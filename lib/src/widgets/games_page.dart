import 'package:backstreets_widgets/extensions.dart';
import 'package:backstreets_widgets/shortcuts.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ladder/ladder.dart';
import 'package:time/time.dart';

/// The ladder night games page.
class GamesPage extends ConsumerWidget {
  /// Create an instance.
  const GamesPage({required this.ladderNightId, super.key});

  /// The ID of the ladder night whose games will be shown.
  final int ladderNightId;

  /// Build the widget.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final database = ref.watch(databaseProvider);
    final ladderNightValue = ref.watch(ladderNightProvider(ladderNightId));
    return ladderNightValue.simpleWhen((final night) {
      final teamValue = ref.watch(showdownTeamProvider(night.teamId));
      return teamValue.simpleWhen((final team) {
        final gamesValue = ref.watch(gamesProvider(ladderNightId));
        return gamesValue.simpleWhen((final games) {
          if (games.isEmpty) {
            return const CustomCenterText(
              text: 'There are no games for this night.',
            );
          }
          return ListView.builder(
            itemBuilder: (final context, final index) {
              final game = games[index];
              final query = database.managers.showdownGames.filter(
                (final f) => f.id.equals(game.id),
              );
              final previousSlot = game.createdAt - team.gameLength.minutes;
              final nextSlot = game.createdAt + team.gameLength.minutes;
              if (game.lockedOn == null) {
                return PerformableActionsListTile(
                  actions: [
                    PerformableAction(
                      name: 'Move game forward',
                      activator: moveUpShortcut,
                      invoke: () async {
                        await query.update(
                          (final o) => o(createdAt: Value(nextSlot)),
                        );
                        ref.invalidate(gamesProvider(ladderNightId));
                      },
                    ),
                    if (previousSlot.isAfter(night.createdAt) ||
                        previousSlot.isAtSameHourAs(night.createdAt))
                      PerformableAction(
                        name: 'Move game back',
                        activator: moveDownShortcut,
                        invoke: () async {
                          await query.update(
                            (final o) => o(createdAt: Value(previousSlot)),
                          );
                          ref.invalidate(gamesProvider(night.id));
                        },
                      ),
                    PerformableAction(
                      name: 'Lock',
                      activator: CrossPlatformSingleActivator(
                        LogicalKeyboardKey.keyL,
                      ),
                      invoke: () {
                        context.showConfirmMessage(
                          message:
                              // ignore: lines_longer_than_80_chars
                              'Locking this game will prevent further edits. Are you sure?',
                          yesCallback: () async {
                            final sets = await ref.read(
                              gameSetsProvider(game.id).future,
                            );
                            if (sets.isEmpty) {
                              if (context.mounted) {
                                await context.showMessage(
                                  message:
                                      // ignore: lines_longer_than_80_chars
                                      'This game cannot be locked without any sets.',
                                );
                              }
                              return;
                            }
                            for (final set in sets) {
                              final results = await ref.read(
                                setWinnerProvider(set.id).future,
                              );
                              switch (results) {
                                case UndecidedSetResults():
                                  if (context.mounted) {
                                    await context.showMessage(
                                      message:
                                          // ignore: lines_longer_than_80_chars
                                          'This game cannot be locked until all sets have a winner.',
                                    );
                                  }
                                  return;
                                case DecidedSetResults():
                                  final winner = results.winner;
                                  await database.managers.teamPlayers
                                      .filter(
                                        (final f) => f.id.equals(winner.id),
                                      )
                                      .update(
                                        (final o) =>
                                            o(points: Value(winner.points + 1)),
                                      );
                                  ref.invalidate(teamPlayerProvider(winner.id));
                              }
                            }
                            ref.invalidate(teamPlayersProvider);
                            await query.update(
                              (final o) => o(lockedOn: Value(DateTime.now())),
                            );
                            ref.invalidate(gamesProvider(ladderNightId));
                          },
                        );
                      },
                    ),
                    PerformableAction(
                      name: 'Delete game',
                      activator: deleteShortcut,
                      invoke: () async {
                        final sets = await ref.read(
                          gameSetsProvider(game.id).future,
                        );
                        if (sets.isNotEmpty) {
                          if (context.mounted) {
                            await context.showMessage(
                              message:
                                  // ignore: lines_longer_than_80_chars
                                  'You cannot delete this game as it has at least 1 set.',
                            );
                          }
                          return;
                        }
                        await query.delete();
                        ref.invalidate(gamesProvider(night.id));
                      },
                    ),
                  ],
                  autofocus: index == 0,
                  title: PlayersCustomText(
                    firstPlayerId: game.firstPlayerId,
                    secondPlayerId: game.secondPlayerId,
                  ),
                  subtitle: CustomText(text: timeFormat.format(game.createdAt)),
                  onTap: () => context.pushWidgetBuilder(
                    (_) => EditGameScreen(gameId: game.id),
                  ),
                );
              }
              return ListTile(
                autofocus: index == 0,
                title: PlayersCustomText(
                  firstPlayerId: game.firstPlayerId,
                  secondPlayerId: game.secondPlayerId,
                ),
                subtitle: CustomText(text: timeFormat.format(game.createdAt)),
                trailing: const Icon(Icons.lock, semanticLabel: 'Locked'),
                onTap: () => context.pushWidgetBuilder(
                  (_) => EditGameScreen(gameId: game.id, readOnly: true),
                ),
              );
            },
            itemCount: games.length,
            shrinkWrap: true,
          );
        });
      });
    });
  }
}
