import 'package:backstreets_widgets/extensions.dart';
import 'package:backstreets_widgets/screens.dart';
import 'package:backstreets_widgets/shortcuts.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ladder/ladder.dart';

/// The screen for editing game points.
class EditGameScreen extends ConsumerWidget {
  /// Create an instance.
  const EditGameScreen({
    required this.gameId,
    this.winningPoints = 11,
    this.clearPoints = 2,
    this.numberOfServes = 2,
    super.key,
  });

  /// The ID of the game to show.
  final int gameId;

  /// The number of points needed to win.
  final int winningPoints;

  /// The number of clear points needed to win.
  final int clearPoints;

  /// The number of serves each player gets.
  final int numberOfServes;

  /// Build the widget.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final database = ref.watch(databaseProvider);
    final gameValue = ref.watch(gameProvider(gameId));
    return gameValue.when(
      data: (final game) {
        final setsValue = ref.watch(gameSetsProvider(game.id));
        return Scaffold(
          appBar: AppBar(
            title: PlayersCustomText(
              firstPlayerId: game.firstPlayerId,
              secondPlayerId: game.secondPlayerId,
            ),
          ),
          body: setsValue.simpleWhen((final sets) {
            if (sets.isEmpty) {
              return const CustomCenterText(text: 'This game has no sets yet.');
            }
            return ListView.builder(
              itemBuilder: (final context, final index) {
                final set = sets[index];
                return PerformableActionsListTile(
                  autofocus: index == 0,
                  actions: [
                    PerformableAction(
                      name: 'Delete',
                      activator: deleteShortcut,
                      invoke: () async {
                        final points = await ref.read(
                          setPointsProvider(set.id).future,
                        );
                        if (points.isEmpty) {
                          await database.managers.gameSets
                              .filter((final f) => f.id.equals(set.id))
                              .delete();
                          ref.invalidate(gameSetsProvider(gameId));
                        }
                        if (context.mounted) {
                          await context.showMessage(
                            message:
                                // ignore: lines_longer_than_80_chars
                                'You cannot delete a set which contains points.',
                          );
                        }
                      },
                    ),
                  ],
                  title: CustomText(text: 'Set ${index + 1}'),
                  subtitle: PlayerCustomText(playerId: set.startingPlayerId),
                  onTap: () {},
                );
              },
              itemCount: sets.length,
              shrinkWrap: true,
            );
          }),
        );
      },
      error: ErrorScreen.withPositional,
      loading: LoadingScreen.new,
    );
  }
}
