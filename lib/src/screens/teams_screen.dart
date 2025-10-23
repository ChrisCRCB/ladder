import 'dart:io';

import 'package:backstreets_widgets/extensions.dart';
import 'package:backstreets_widgets/screens.dart';
import 'package:backstreets_widgets/shortcuts.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:drift/drift.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ladder/ladder.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

/// The screen which shows all teams.
class TeamsScreen extends ConsumerWidget {
  /// Create an instance.
  const TeamsScreen({super.key});

  /// Build the widget.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final database = ref.watch(databaseProvider);
    final teamsManager = database.managers.showdownTeams;
    final value = ref.watch(showdownTeamsProvider);
    return FontShortcuts(
      child: CommonShortcuts(
        newCallback: () => _createTeam(ref),
        child: SimpleScaffold(
          actions: [
            if (!kIsWeb)
              SaveButton(
                onPressed: () async {
                  final directory = await getApplicationDocumentsDirectory();
                  const filename = 'ladder.sqlite3';
                  final file = File(path.join(directory.path, filename));
                  if (file.existsSync()) {
                    final bytes = file.readAsBytesSync();
                    await FilePicker.platform.saveFile(
                      allowedExtensions: ['.sqlite3'],
                      fileName: filename,
                      bytes: Uint8List.fromList(bytes),
                      dialogTitle: 'Save Database',
                      initialDirectory: directory.path,
                      type: FileType.custom,
                    );
                  } else if (context.mounted) {
                    await context.showMessage(
                      message:
                          // ignore: lines_longer_than_80_chars
                          'The database file could not be found at ${file.path}.',
                    );
                  }
                },
                tooltip: 'Save database',
              ),
          ],
          title: 'Teams',
          body: value.simpleWhen((final teams) {
            if (teams.isEmpty) {
              return const CustomCenterText(
                text: 'There are no teams to show.',
              );
            }
            return ListView.builder(
              itemBuilder: (final context, final index) {
                final team = teams[index];
                final query = teamsManager.filter(
                  (final f) => f.id.equals(team.id),
                );
                return PerformableActionsListTile(
                  actions: [
                    PerformableAction(
                      name: 'Rename',
                      activator: renameShortcut,
                      invoke: () => context.pushWidgetBuilder(
                        (final innerContext) => GetText(
                          onDone: (final value) async {
                            innerContext.pop();
                            await query.update(
                              (final o) => o(
                                lastAccessed: Value(DateTime.now()),
                                name: Value(value),
                              ),
                            );
                            ref.invalidate(showdownTeamsProvider);
                          },
                          labelText: 'Team name',
                          text: team.name,
                          title: 'Rename Team',
                        ),
                      ),
                    ),
                    PerformableAction(
                      name: 'Change Email',
                      activator: changeEmailAddressShortcut,
                      invoke: () => context.pushWidgetBuilder(
                        (final innerContext) => GetText(
                          onDone: (final value) async {
                            innerContext.pop();
                            await query.update(
                              (final o) => o(
                                emailAddress: Value(value),
                                lastAccessed: Value(DateTime.now()),
                              ),
                            );
                            ref.invalidate(showdownTeamsProvider);
                          },
                          labelText: 'Email address',
                          text: team.emailAddress,
                          title: 'Change Email Address',
                        ),
                      ),
                    ),
                    PerformableAction(
                      name: 'Export to Excel',
                      activator: exportShortcut,
                      invoke: () => context.pushWidgetBuilder(
                        (_) => ExportTeamScreen(teamId: team.id),
                      ),
                    ),
                    PerformableAction(
                      name: 'Delete',
                      activator: deleteShortcut,
                      invoke: () => context.showConfirmMessage(
                        message: 'Really delete ${team.name}?',
                        title: deleteConfirmationTitle,
                        yesCallback: () async {
                          final nights = await ref.read(
                            ladderNightsProvider(team.id).future,
                          );
                          if (nights.isEmpty) {
                            await query.delete();
                            ref.invalidate(showdownTeamsProvider);
                          } else if (context.mounted) {
                            await context.showMessage(
                              message:
                                  // ignore: lines_longer_than_80_chars
                                  'You can only delete teams before ladder nights have been created.',
                            );
                          }
                        },
                      ),
                    ),
                  ],
                  autofocus: index == 0,
                  title: CustomText(text: team.name),
                  subtitle: CustomText(text: team.emailAddress),
                  onTap: () async {
                    await query.update(
                      (final o) => o(lastAccessed: Value(DateTime.now())),
                    );
                    ref.invalidate(showdownTeamsProvider);
                    if (context.mounted) {
                      await context.pushWidgetBuilder(
                        (_) => TeamScreen(teamId: team.id),
                      );
                    }
                  },
                );
              },
              itemCount: teams.length,
              shrinkWrap: true,
            );
          }),
          floatingActionButton: NewButton(
            onPressed: () => _createTeam(ref),
            tooltip: 'New team',
          ),
        ),
      ),
    );
  }

  /// Create a new team.
  Future<void> _createTeam(final WidgetRef ref) async {
    final database = ref.read(databaseProvider);
    final team = await database.managers.showdownTeams.createReturning(
      (final o) => o(name: 'Untitled Team'),
    );
    await createDefaultPoints(database, team.id);
    ref.invalidate(showdownTeamsProvider);
  }
}
