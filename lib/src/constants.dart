import 'package:backstreets_widgets/widgets.dart';
import 'package:intl/intl.dart';
import 'package:ladder/ladder.dart';

/// The title to use for delete confirmation dialogues.
const deleteConfirmationTitle = 'Confirm Delete';

/// The key used for the application settings.
const applicationSettingsKey = 'ladder_application_preferences';

/// The default points to use when creating new teams.
const defaultPoints = <String, int>{
  'Goal': 2,
  'Body touch': -1,
  'Infringement': -1,
  'Touched shades': -2,
  'Long serve': -1,
  'Short serve': -1,
  'Centre board': -1,
  'Out': -1,
  'Service fault': -1,
  'Own goal': -2,
  'Equipment fault': -2,
  'Player forfeit': -11,
  'Timeout': 0,
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
