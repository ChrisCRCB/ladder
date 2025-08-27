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
    final value = ref.watch(gamesProvider(ladderNightId));
    return FontShortcuts(
      child: Cancel(
        child: SimpleScaffold(
          title: 'Games',
          body: value.simpleWhen((final games) {
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
                return PerformableActionsListTile(
                  actions: [
                    PerformableAction(
                      name: 'Move game back',
                      activator: moveUpShortcut,
                      invoke: () async {
                        final night = await ref.read(
                          ladderNightProvider(ladderNightId).future,
                        );
                        final team = await ref.read(
                          showdownTeamProvider(night.teamId).future,
                        );
                        await query.update(
                          (final o) => o(
                            createdAt: Value(
                              game.createdAt + team.gameLength.minutes,
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                  autofocus: index == 0,
                  title: PlayerCustomText(playerId: game.firstPlayerId),
                  subtitle: PlayerCustomText(playerId: game.secondPlayerId),
                  onTap: () {},
                );
              },
              itemCount: games.length,
              shrinkWrap: true,
            );
          }),
        ),
      ),
    );
  }
}
