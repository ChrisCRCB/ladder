import 'dart:math';

import 'package:backstreets_widgets/extensions.dart';
import 'package:backstreets_widgets/shortcuts.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ladder/ladder.dart';

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
              final startTime = night.getStartTime(game);
              final query = database.managers.showdownGames.filter(
                (final f) => f.id.equals(game.id),
              );
              final gameLength = team.gameLength;
              if (game.lockedOn == null) {
                return PerformableActionsListTile(
                  actions: [
                    PerformableAction(
                      name: 'Move game forward',
                      activator: moveUpShortcut,
                      invoke: () async {
                        await query.update(
                          (final o) => o(
                            startAfter: Value(game.startAfter + gameLength),
                          ),
                        );
                        ref.invalidate(gamesProvider(ladderNightId));
                      },
                    ),
                    PerformableAction(
                      name: 'Move game back',
                      activator: moveDownShortcut,
                      invoke: () async {
                        await query.update(
                          (final o) => o(
                            startAfter: Value(
                              max(0, game.startAfter - gameLength),
                            ),
                          ),
                        );
                        ref.invalidate(gamesProvider(night.id));
                      },
                    ),
                    PerformableAction(
                      name: 'Lock',
                      activator: CrossPlatformSingleActivator(
                        LogicalKeyboardKey.keyL,
                      ),
                      invoke: () async {
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
                        var firstPlayerWins = 0;
                        var secondPlayerWins = 0;
                        for (final set in sets) {
                          final results = await ref.read(
                            setResultsProvider(set.id).future,
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
                              if (winner.id == game.firstPlayerId) {
                                firstPlayerWins += 1;
                              } else {
                                secondPlayerWins += 1;
                              }
                          }
                        }
                        for (final id in [
                          game.firstPlayerId,
                          game.secondPlayerId,
                        ]) {
                          final query = database.managers.teamPlayers.filter(
                            (final f) => f.id.equals(id),
                          );
                          final player = await query.getSingle();
                          await query.update(
                            (final o) => o(
                              points: Value(
                                player.points +
                                    (id == game.firstPlayerId
                                        ? firstPlayerWins
                                        : secondPlayerWins),
                              ),
                            ),
                          );
                          ref.invalidate(teamPlayerProvider(id));
                        }
                        ref.invalidate(teamPlayersProvider);
                        final lastSet = sets.last;
                        final points = await ref.read(
                          setPointsProvider(lastSet.id).future,
                        );
                        final lastPoint = points.last;
                        await query.update(
                          (final o) =>
                              o(lockedOn: Value(lastPoint.setPoint.createdAt)),
                        );
                        ref.invalidate(gamesProvider(ladderNightId));
                      },
                    ),
                    PerformableAction(
                      name: 'Delete game',
                      activator: deleteShortcut,
                      invoke: () async {
                        final setsCount = await database.managers.gameSets
                            .filter((final f) => f.gameId.id.equals(game.id))
                            .count();
                        if (setsCount == 0) {
                          await query.delete();
                          ref.invalidate(gamesProvider(night.id));
                        } else if (context.mounted) {
                          await context.showMessage(
                            message:
                                // ignore: lines_longer_than_80_chars
                                'You cannot delete this game as it has at least 1 set.',
                          );
                        }
                      },
                    ),
                  ],
                  autofocus: index == 0,
                  title: PlayersCustomText(
                    firstPlayerId: game.firstPlayerId,
                    secondPlayerId: game.secondPlayerId,
                  ),
                  subtitle: CustomText(text: timeFormat.format(startTime)),
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
                subtitle: CustomText(text: timeFormat.format(startTime)),
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
