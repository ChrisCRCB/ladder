import 'package:backstreets_widgets/widgets.dart';
import 'package:drift/drift.dart';
import 'package:intl/intl.dart';
import 'package:ladder/ladder.dart';

/// The title to use for delete confirmation dialogues.
const deleteConfirmationTitle = 'Confirm Delete';

/// The key used for the application settings.
const applicationSettingsKey = 'ladder_application_preferences';

/// The default points to use when creating new teams.
const defaultPoints = <DefaultShowdownPoint>{
  DefaultShowdownPoint(name: 'Goal', value: 2),
  DefaultShowdownPoint(name: 'Body touch', value: -1),
  DefaultShowdownPoint(name: 'Infringement', value: -1),
  DefaultShowdownPoint(name: 'Touched shades', value: -2),
  DefaultShowdownPoint(name: 'Long serve', value: -1),
  DefaultShowdownPoint(name: 'Short serve', value: -1),
  DefaultShowdownPoint(name: 'Centre board', value: -1),
  DefaultShowdownPoint(name: 'Out', value: -1),
  DefaultShowdownPoint(name: 'Service fault', value: -1),
  DefaultShowdownPoint(name: 'Own goal', value: -2),
  DefaultShowdownPoint(name: 'Equipment fault', value: -2),
  DefaultShowdownPoint(name: 'Player forfeit', value: -11),
  DefaultShowdownPoint(name: 'Timeout from player', value: 0, endsPoint: false),
  DefaultShowdownPoint(name: 'Timeout from coach', value: 0, endsPoint: false),
  DefaultShowdownPoint(name: 'Player talks', value: -2, endsPoint: false),
  DefaultShowdownPoint(name: 'Coach talks', value: -1, endsPoint: false),
};

/// The date format to use.
final dateFormat = DateFormat('EEEE d MMMM y HH:mm');

/// The format for times.
final timeFormat = DateFormat('HH:mm');

/// Calculate the [points] for the given [player].
int getPoints(final List<SetPointContext> points, final TeamPlayer player) {
  if (points.isEmpty) {
    return 0;
  }
  return points
      .map<int>((final gamePointContext) {
        final point = gamePointContext.showdownPoint;
        final playerId = gamePointContext.setPoint.playerId;
        if ((playerId == player.id && point.value > 0) ||
            (playerId != player.id && point.value < 0)) {
          return point.value.abs();
        }
        return 0;
      })
      .reduce((final value, final element) => value + element);
}

/// The number keys, used by the set editor.
const numberKeys = <GameShortcutsShortcut>[
  GameShortcutsShortcut.digit1,
  GameShortcutsShortcut.digit2,
  GameShortcutsShortcut.digit3,
  GameShortcutsShortcut.digit4,
  GameShortcutsShortcut.digit5,
  GameShortcutsShortcut.digit6,
  GameShortcutsShortcut.digit7,
  GameShortcutsShortcut.digit8,
  GameShortcutsShortcut.digit9,
  GameShortcutsShortcut.digit0,
  GameShortcutsShortcut.minus,
  GameShortcutsShortcut.equal,
  GameShortcutsShortcut.backspace,
  GameShortcutsShortcut.keyW,
  GameShortcutsShortcut.keyE,
  GameShortcutsShortcut.keyR,
  GameShortcutsShortcut.keyT,
  GameShortcutsShortcut.keyY,
  GameShortcutsShortcut.keyU,
  GameShortcutsShortcut.keyI,
  GameShortcutsShortcut.keyO,
  GameShortcutsShortcut.keyP,
];

/// The name of the team information sheet in Excel.
const teamSheetName = 'Team Information';

/// The name of the point definitions page.
const showdownPointsSheetName = 'Point Definitions';

/// The name of the players sheet in Excel.
const playersSheetName = 'Players';

/// The name of the ladder nights sheet in Excel.
const ladderNightsSheetName = 'Ladder Nights';

/// The name of the games sheet in Excel.
const gamesSheetName = 'Games';

/// Create default points.
Future<void> createDefaultPoints(
  final LadderDatabase database,
  final int teamId,
) async {
  for (final defaultPoint in defaultPoints) {
    await database.managers.showdownPoints.create(
      (final o) => o(
        teamId: teamId,
        name: defaultPoint.name,
        value: defaultPoint.value,
        endsPoint: Value(defaultPoint.endsPoint),
      ),
    );
  }
}
