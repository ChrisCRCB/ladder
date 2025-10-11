import 'dart:async';

import 'package:backstreets_widgets/extensions.dart';
import 'package:backstreets_widgets/screens.dart';
import 'package:excel/excel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ladder/ladder.dart';

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
      return ErrorScreen(error: errorObject, stackTrace: _stackTrace);
    }
    final team = _team;
    if (team == null) {
      _steps.add('Loading team from the database.');
      ref
          .read(showdownTeamProvider(widget.teamId).future)
          .then((final team) {
            final sheet = exportTeam(excel: _excel, team: team);
            _excel.setDefaultSheet(sheet.sheetName);
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
    return _StepsListView(steps: _steps, loading: false);
  }

  Widget _loading() => _StepsListView(steps: _steps, loading: true);

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
  const _StepsListView({required this.steps, required this.loading});

  /// The steps which are being performed.
  final List<String> steps;

  /// Whether something is loading or not.
  final bool loading;

  /// Build the widget.
  @override
  Widget build(final BuildContext context) => SimpleScaffold(
    title: loading ? 'Export In Progress' : 'Export Complete',
    body: ListView.builder(
      shrinkWrap: true,
      itemBuilder: (final context, final index) {
        if (index == steps.length) {
          return const Focus(
            autofocus: true,
            child: CircularProgressIndicator(semanticsLabel: 'Loading...'),
          );
        }
        return ListTile(
          autofocus: !loading && index == (steps.length - 1),
          title: CustomText(text: steps[index]),
          onTap: () => steps[index].copyToClipboard(),
        );
      },
      itemCount: loading ? steps.length + 1 : steps.length,
    ),
  );
}
