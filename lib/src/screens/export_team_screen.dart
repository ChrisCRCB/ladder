import 'dart:io';

import 'package:backstreets_widgets/extensions.dart';
import 'package:backstreets_widgets/screens.dart';
import 'package:excel/excel.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
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
  /// The steps which have been performed.
  late final List<String> _steps;

  /// The excel file to work with.
  late final Excel _excel;

  /// Initialise state.
  @override
  void initState() {
    super.initState();
    _steps = ['Loading team from the database.'];
    _excel = Excel.createExcel();
  }

  /// Build a widget.
  @override
  Widget build(final BuildContext context) {
    const title = 'Export Text';
    const error = ErrorScreen.withPositional;
    Widget loading() => SimpleScaffold(
      title: title,
      body: _StepsListView(steps: _steps),
    );
    final value = ref.watch(showdownTeamProvider(widget.teamId));
    return value.when(
      data: (final team) {
        final sheet = exportTeam(excel: _excel, team: team);
        _excel.setDefaultSheet(sheet.sheetName);
        _steps.add('Loading point definitions for ${team.name}.');
        final value = ref.watch(showdownPointsProvider(team.id));
        return value.when(
          data: (final points) {
            exportShowdownPoints(excel: _excel, points: points);
            _steps.add('Loading players for ${team.name}.');
            final value = ref.watch(teamPlayersProvider(team.id));
            return value.when(
              data: (final players) {
                exportPlayers(excel: _excel, players: players);
                _steps.add('Loading ladder nights for ${team.name}.');
                final value = ref.watch(ladderNightsProvider(team.id));
                return value.when(
                  data: (final nights) {
                    exportLadderNights(excel: _excel, nights: nights);
                    _steps.add('Loading games.');
                    final value = ref.watch(gameContextsProvider(team.id));
                    return value.when(
                      data: (final contexts) {
                        exportGameSets(
                          excel: _excel,
                          gameContexts: contexts,
                          players: players,
                          nights: nights,
                          team: team,
                        );
                        _steps.add('Done.');
                        return SimpleScaffold(
                          title: 'Export Complete',
                          body: _StepsListView(steps: _steps),
                          floatingActionButton: FloatingActionButton(
                            onPressed: () async {
                              final filename = await FilePicker.platform
                                  .saveFile(
                                    allowedExtensions: ['xlsx'],
                                    dialogTitle: 'Save Excel file',
                                    fileName: 'Team.xlsx',
                                    type: FileType.custom,
                                  );
                              if (filename != null) {
                                if (kIsWeb) {
                                  _excel.save(fileName: filename);
                                } else {
                                  final file = File(filename);
                                  final bytes = _excel.save(fileName: filename);
                                  if (bytes != null) {
                                    file.writeAsBytesSync(bytes);
                                  }
                                }
                              }
                            },
                            tooltip: 'Save excel file',
                            child: const Icon(Icons.save),
                          ),
                        );
                      },
                      error: error,
                      loading: loading,
                    );
                  },
                  error: error,
                  loading: loading,
                );
              },
              error: error,
              loading: loading,
            );
          },
          error: error,
          loading: loading,
        );
      },
      error: error,
      loading: loading,
    );
  }
}

/// The [ListView] which shows all steps.
class _StepsListView extends StatelessWidget {
  /// Create an instance.
  const _StepsListView({required this.steps});

  /// The steps which are being performed.
  final List<String> steps;

  /// Build the widget.
  @override
  Widget build(final BuildContext context) => ListView.builder(
    shrinkWrap: true,
    itemBuilder: (final context, final index) => ListTile(
      autofocus: index == 0,
      title: CustomText(text: steps[index]),
      onTap: () => steps[index].copyToClipboard(),
    ),
    itemCount: steps.length,
  );
}
