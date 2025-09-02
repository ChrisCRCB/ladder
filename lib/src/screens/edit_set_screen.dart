import 'package:backstreets_widgets/extensions.dart';
import 'package:backstreets_widgets/screens.dart';
import 'package:backstreets_widgets/shortcuts.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ladder/ladder.dart';

/// A screen which allows editing game sets.
class EditSetScreen extends ConsumerWidget {
  /// Create an instance.
  const EditSetScreen({
    required this.setId,
    required this.setNumber,
    this.readOnly = false,
    super.key,
  });

  /// The ID of the set to show.
  final int setId;

  /// The number of this set.
  final int setNumber;

  /// Whether this set is read only.
  final bool readOnly;

  /// Build the widget.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final database = ref.watch(databaseProvider);
    final value = ref.watch(gameSetProvider(setId));
    return Cancel(
      child: FontShortcuts(
        child: value.when(
          data: (final set) {
            final value = ref.watch(gamePlayersProvider(set.gameId));
            return SimpleScaffold(
              actions: [
                if (!readOnly)
                  IconButton(
                    onPressed: () async {
                      final points = await ref.read(
                        setPointsProvider(setId).future,
                      );
                      if (points.isEmpty) {
                        await database.managers.gameSets
                            .filter((final f) => f.id.equals(setId))
                            .delete();
                        ref.invalidate(gameSetsProvider(set.gameId));
                        if (context.mounted) {
                          context.pop();
                        }
                      } else if (context.mounted) {
                        await context.showMessage(
                          message: 'You can only delete empty sets.',
                        );
                      }
                    },
                    icon: const Icon(Icons.delete),
                    tooltip: 'Delete set',
                  ),
              ],
              title: 'Set #$setNumber',
              body: value.simpleWhen((final players) {
                final value = ref.watch(setPointsProvider(setId));
                return value.simpleWhen((final points) {
                  final value = ref.watch(
                    showdownTeamProvider(players.first.teamId),
                  );
                  return value.simpleWhen((final team) {
                    final totalServes = points.length;
                    final serveBlock = totalServes ~/ team.servesPerPlayer;
                    final currentPlayerIndex = serveBlock % players.length;
                    final server = players[currentPlayerIndex];
                    final serveNumber =
                        (totalServes % team.servesPerPlayer) + 1;
                    return ListView(
                      shrinkWrap: true,
                      children: [
                        ...players.map((final player) {
                          final isServing = player.id == server.id;
                          return ListTile(
                            autofocus: player.id == players.first.id,
                            selected: isServing,
                            title: PlayerCustomText(
                              playerId: player.id,
                              points: getPoints(points, player),
                            ),
                            subtitle: isServing
                                ? CustomText(text: '$serveNumber')
                                : const CustomText(text: 'Receiving'),
                            onTap: () {
                              if (readOnly) {
                                return;
                              }
                              context.pushWidgetBuilder(
                                (_) => CreateGamePointScreen(
                                  setId: setId,
                                  playerId: player.id,
                                ),
                              );
                            },
                          );
                        }),
                        ...points.map((final pointContext) {
                          final gamePoint = pointContext.setPoint;
                          final playerId = gamePoint.playerId;
                          final player = players.firstWhere(
                            (final p) => p.id == playerId,
                          );
                          final point = pointContext.showdownPoint;
                          final query = database.managers.setPoints.filter(
                            (final f) => f.id.equals(gamePoint.id),
                          );
                          if (readOnly) {
                            return ListTile(
                              title: PlayerCustomText(
                                playerId: playerId,
                                showPoints: false,
                              ),
                              subtitle: CustomText(
                                text: '${point.name} (${point.value})',
                              ),
                              onTap: () {},
                            );
                          }
                          return PerformableActionsListTile(
                            actions: [
                              ...players.map(
                                (final player) => PerformableAction(
                                  name: player.name,
                                  checked: player.id == playerId,
                                  invoke: () async {
                                    await query.update(
                                      (final o) =>
                                          o(playerId: Value(player.id)),
                                    );
                                    ref.invalidate(setPointsProvider(setId));
                                  },
                                ),
                              ),
                              if (gamePoint.id == points.last.setPoint.id)
                                PerformableAction(
                                  name: 'delete',
                                  activator: deleteShortcut,
                                  invoke: () {
                                    context.showConfirmMessage(
                                      message:
                                          // ignore: lines_longer_than_80_chars
                                          'Are you sure you want to delete this point?',
                                      title: deleteConfirmationTitle,
                                      yesCallback: () async {
                                        await query.delete();
                                        ref.invalidate(
                                          setPointsProvider(setId),
                                        );
                                      },
                                    );
                                  },
                                ),
                            ],
                            title: PlayerCustomText(
                              playerId: playerId,
                              showPoints: false,
                            ),
                            subtitle: CustomText(
                              text: '${point.name} (${point.value})',
                            ),
                            onTap: () => context.pushWidgetBuilder(
                              (_) => SelectShowdownPointScreen(
                                teamId: player.teamId,
                                onChanged: (final showdownPoint) async {
                                  await query.update(
                                    (final o) =>
                                        o(pointId: Value(showdownPoint.id)),
                                  );
                                  ref.invalidate(setPointsProvider(setId));
                                },
                              ),
                            ),
                          );
                        }),
                      ],
                    );
                  });
                });
              }),
            );
          },
          error: ErrorScreen.withPositional,
          loading: LoadingScreen.new,
        ),
      ),
    );
  }
}
