import 'dart:async';

import 'package:backstreets_widgets/extensions.dart';
import 'package:backstreets_widgets/screens.dart';
import 'package:backstreets_widgets/shortcuts.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:excel/excel.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ladder/ladder.dart';
import 'package:path_provider/path_provider.dart';

/// A screen for exporting a team to an Excel file.
class ExportTeamScreen extends ConsumerStatefulWidget {
  /// Create an instance.
  const ExportTeamScreen({required this.teamId, super.key});

  /// The ID of the team to export.
  final int teamId;

  /// Create state for this widget.
  @override
  ExportTeamScreenState createState() => ExportTeamScreenState();
}

/// State for [ExportTeamScreen].
class ExportTeamScreenState extends ConsumerState<ExportTeamScreen> {
  /// An error to show.
  Object? _error;

  /// A stack trace to show.
  StackTrace? _stackTrace;

  /// The steps which have been performed.
  late final List<String> _steps;

  /// The excel file to work with.
  late final Excel _excel;

  /// The team to work with.
  ShowdownTeam? _team;

  /// The points to use.
  List<ShowdownPoint>? _points;

  /// The players for [_team].
  List<TeamPlayer>? _players;

  /// The ladder nights to export.
  List<LadderNight>? _ladderNights;

  /// The games for the team.
  List<GameContext>? _games;

  /// Initialise state.
  @override
  void initState() {
    super.initState();
    _steps = [];
    _excel = Excel.createExcel();
  }

  /// Build a widget.
  @override
  Widget build(final BuildContext context) {
    final errorObject = _error;
    if (errorObject != null) {
      return Cancel(
        child: ErrorScreen(error: errorObject, stackTrace: _stackTrace),
      );
    }
    final team = _team;
    if (team == null) {
      _steps.add('Loading team from the database.');
      ref
          .read(showdownTeamProvider(widget.teamId).future)
          .then((final team) {
            exportTeam(excel: _excel, team: team);
            setState(() {
              _team = team;
            });
          })
          .onError(handleError);
      return _loading();
    }
    final points = _points;
    if (points == null) {
      _steps.add('Loading point definitions for ${team.name}.');
      ref
          .read(showdownPointsProvider(team.id).future)
          .then((final points) {
            exportShowdownPoints(excel: _excel, points: points);
            setState(() {
              _points = points;
            });
          })
          .onError(handleError);
      return _loading();
    }
    final players = _players;
    if (players == null) {
      _steps.add('Loading players for ${team.name}.');
      ref
          .read(teamPlayersProvider(team.id).future)
          .then((final players) {
            exportPlayers(excel: _excel, players: players);
            setState(() {
              _players = players;
            });
          })
          .onError(handleError);
      return _loading();
    }
    final ladderNights = _ladderNights;
    if (ladderNights == null) {
      _steps.add('Loading ladder nights for ${team.name}.');
      ref
          .read(ladderNightsProvider(team.id).future)
          .then((final ladderNights) {
            exportLadderNights(excel: _excel, nights: ladderNights);
            setState(() {
              _ladderNights = ladderNights;
            });
          })
          .onError(handleError);
      return _loading();
    }
    final games = _games;
    if (games == null) {
      _steps.add('Loading games for ${team.name}.');
      ref
          .read(gameContextsProvider(team.id).future)
          .then((final gameContexts) {
            exportGameSets(
              excel: _excel,
              gameContexts: gameContexts,
              nights: ladderNights,
              players: players,
              team: team,
            );
            setState(() {
              _games = gameContexts;
            });
          })
          .onError(handleError);
      return _loading();
    }
    _steps.add('Export complete.');
    return _StepsListView(steps: _steps, excel: _excel);
  }

  Widget _loading() => _StepsListView(steps: _steps, excel: _excel);

  /// Handle an [error] and [stackTrace].
  FutureOr<Null> handleError(final Object error, final StackTrace stackTrace) {
    setState(() {
      _error = error;
      _stackTrace = stackTrace;
    });
  }
}

/// The [ListView] which shows all steps.
class _StepsListView extends StatelessWidget {
  /// Create an instance.
  const _StepsListView({required this.steps, required this.excel});

  /// The steps which are being performed.
  final List<String> steps;

  /// The excel spreadsheet to save.
  final Excel? excel;

  /// Build the widget.
  @override
  Widget build(final BuildContext context) {
    final x = excel;
    return Cancel(
      child: CallbackShortcuts(
        bindings: {
          CrossPlatformSingleActivator(LogicalKeyboardKey.keyS): () {
            if (x != null) {
              _save();
            }
          },
        },
        child: SimpleScaffold(
          actions: [
            if (x != null)
              SaveButton(onPressed: _save, tooltip: 'Save spreadsheet'),
          ],
          title: x == null ? 'Export In Progress' : 'Export Complete',
          body: ListView.builder(
            shrinkWrap: true,
            itemBuilder: (final context, final index) {
              if (index == steps.length) {
                return const Focus(
                  autofocus: true,
                  child: CircularProgressIndicator(
                    semanticsLabel: 'Loading...',
                  ),
                );
              }
              return ListTile(
                autofocus: x != null && index == (steps.length - 1),
                title: CustomText(text: steps[index]),
                onTap: () => steps[index].copyToClipboard(),
              );
            },
            itemCount: x == null ? steps.length : steps.length + 1,
          ),
        ),
      ),
    );
  }

  /// Save the spreadsheet.
  Future<void> _save() async {
    final x = excel!;
    if (kIsWeb) {
      x.save(fileName: 'team.xlsx');
      return;
    }
    final bytes = x.save();
    final directory = await getApplicationDocumentsDirectory();
    await FilePicker.platform.saveFile(
      allowedExtensions: ['xlsx'],
      bytes: Uint8List.fromList(bytes!),
      dialogTitle: 'Save Excel',
      fileName: 'team.xlsx',
      initialDirectory: directory.path,
      type: FileType.custom,
    );
  }
}
