import 'package:backstreets_widgets/extensions.dart';
import 'package:backstreets_widgets/shortcuts.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
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
                subtitle: CustomText(text: timeFormat.format(game.createdAt)),
                onTap: () {},
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
