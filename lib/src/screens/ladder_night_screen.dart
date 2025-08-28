import 'package:backstreets_widgets/extensions.dart';
import 'package:backstreets_widgets/screens.dart';
import 'package:backstreets_widgets/shortcuts.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ladder/ladder.dart';
import 'package:time/time.dart';

/// A screen showing the details of a ladder night.
class LadderNightScreen extends ConsumerWidget {
  /// Create an instance.
  const LadderNightScreen({required this.ladderNightId, super.key});

  /// The ID of the ladder night to show.
  final int ladderNightId;

  /// Build the widget.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final database = ref.watch(databaseProvider);
    final gamesValue = ref.watch(gamesProvider(ladderNightId));
    return FontShortcuts(
      child: Cancel(
        child: gamesValue.when(
          data: (final games) {
            final ladderNightValue = ref.watch(
              ladderNightProvider(ladderNightId),
            );
            return ladderNightValue.simpleWhen((final night) {
              final teamValue = ref.watch(showdownTeamProvider(night.teamId));
              return CommonShortcuts(
                newCallback: () => _createGame(ref),
                child: SimpleScaffold(
                  title: 'Games',
                  body: teamValue.simpleWhen((final team) {
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
                        final previousSlot =
                            game.createdAt - team.gameLength.minutes;
                        final nextSlot =
                            game.createdAt + team.gameLength.minutes;
                        return PerformableActionsListTile(
                          actions: [
                            PerformableAction(
                              name: 'Move game forward',
                              activator: moveUpShortcut,
                              invoke: () async {
                                await query.update(
                                  (final o) => o(createdAt: Value(nextSlot)),
                                );
                                ref.invalidate(gamesProvider(night.id));
                              },
                            ),
                            if (previousSlot.isAfter(night.createdAt) ||
                                previousSlot.isAtSameHourAs(night.createdAt))
                              PerformableAction(
                                name: 'Move game back',
                                activator: moveDownShortcut,
                                invoke: () async {
                                  await query.update(
                                    (final o) =>
                                        o(createdAt: Value(previousSlot)),
                                  );
                                  ref.invalidate(gamesProvider(night.id));
                                },
                              ),
                            PerformableAction(
                              name: 'Delete game',
                              activator: deleteShortcut,
                              invoke: () async {
                                final points = await ref.read(
                                  gamePointsProvider(game.id).future,
                                );
                                if (points.isNotEmpty) {
                                  if (context.mounted) {
                                    await context.showMessage(
                                      message:
                                          // ignore: lines_longer_than_80_chars
                                          'You cannot delete this game as it has attached results.',
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
                          subtitle: CustomText(
                            text: timeFormat.format(game.createdAt),
                          ),
                          onTap: () {},
                        );
                      },
                      itemCount: games.length,
                      shrinkWrap: true,
                    );
                  }),
                  floatingActionButton: NewButton(
                    onPressed: () => _createGame(ref),
                    tooltip: 'New game',
                  ),
                ),
              );
            });
          },
          error: ErrorScreen.withPositional,
          loading: LoadingScreen.new,
        ),
      ),
    );
  }

  /// Create a new game.
  Future<void> _createGame(final WidgetRef ref) async {
    final night = await ref.read(ladderNightProvider(ladderNightId).future);
    final team = await ref.read(showdownTeamProvider(night.teamId).future);
    final games = await ref.read(gamesProvider(ladderNightId).future);
    final DateTime gameStart;
    if (games.isEmpty) {
      gameStart = night.createdAt;
    } else {
      gameStart = games.last.createdAt + team.gameLength.minutes;
    }
    final context = ref.context;
    if (context.mounted) {
      await context.pushWidgetBuilder(
        (_) => CreateGameScreen(
          ladderNightId: ladderNightId,
          gameStartTime: gameStart,
          excludedPlayer1Ids: games.map((final game) => game.firstPlayerId),
        ),
      );
    }
  }
}
