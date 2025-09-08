import 'dart:async';

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
    return value.when(
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
            final setPlayers = [
              players.firstWhere(
                (final player) => player.id == set.startingPlayerId,
              ),
              players.firstWhere(
                (final player) => player.id != set.startingPlayerId,
              ),
            ];
            final value = ref.watch(setPointsProvider(setId));
            return value.simpleWhen((final points) {
              final value = ref.watch(
                showdownTeamProvider(setPlayers.first.teamId),
              );
              return value.simpleWhen((final team) {
                final value = ref.watch(showdownPointsProvider(team.id));
                return value.simpleWhen((final showdownPoints) {
                  final includedPoints = points
                      .where((final p) => p.showdownPoint.value != 0)
                      .toList();
                  final totalServes = includedPoints.length;
                  final serveBlock = totalServes ~/ team.servesPerPlayer;
                  final currentPlayerIndex = serveBlock % players.length;
                  final server = setPlayers[currentPlayerIndex];
                  final receiver = setPlayers.firstWhere(
                    (final p) => p.id != server.id,
                  );
                  final serveNumber = (totalServes % team.servesPerPlayer) + 1;
                  ShowdownPoint? showdownPoint;
                  TeamPlayer? awardingPlayer;
                  final shortcuts = [
                    GameShortcut(
                      title: 'Speak first player points',
                      shortcut: GameShortcutsShortcut.bracketLeft,
                      controlKey: useControlKey,
                      metaKey: useMetaKey,
                      onStart: (final _) => _speakPlayerStats(
                        ref: ref,
                        player: setPlayers.first,
                        points: points,
                      ),
                    ),
                    GameShortcut(
                      title: 'Speak second player points',
                      shortcut: GameShortcutsShortcut.bracketRight,
                      controlKey: useControlKey,
                      metaKey: useMetaKey,
                      onStart: (final _) => _speakPlayerStats(
                        ref: ref,
                        player: setPlayers.last,
                        points: points,
                      ),
                    ),
                    GameShortcut(
                      title: 'Speak serve details',
                      shortcut: GameShortcutsShortcut.keyB,
                      controlKey: useControlKey,
                      metaKey: useMetaKey,
                      onStart: (_) {
                        final serverPoints = getPoints(points, server);
                        final receiverPoints = getPoints(points, receiver);
                        context.announce(
                          // ignore: lines_longer_than_80_chars
                          'Serve $serveNumber for ${server.name}: $serverPoints : $receiverPoints',
                        );
                      },
                    ),
                    for (var i = 0; i < numberKeys.length; i++)
                      ...(() {
                        final numberKey = numberKeys[i];
                        final sp = i < showdownPoints.length
                            ? showdownPoints[i]
                            : null;
                        return <GameShortcut>[
                          GameShortcut(
                            title: 'Speak point number ${i + 1}',
                            shortcut: numberKey,
                            controlKey: useControlKey,
                            metaKey: useMetaKey,
                            onStart: (_) {
                              if (i >= points.length) {
                                return context.announce(
                                  "There aren't that many points.",
                                );
                              }
                              final point = points[i];
                              final player =
                                  point.setPoint.playerId == server.id
                                  ? server
                                  : receiver;
                              context.announce(
                                // ignore: lines_longer_than_80_chars
                                '${player.name}: ${point.showdownPoint.name}',
                              );
                            },
                          ),
                          if (sp != null && !readOnly)
                            GameShortcut(
                              title: 'Award a $sp',
                              shortcut: numberKey,
                              onStart: (_) {
                                if (awardingPlayer == null) {
                                  return context.announce(
                                    // ignore: lines_longer_than_80_chars
                                    'You cannot award ${sp.name} without first setting the player to award.',
                                  );
                                }
                                showdownPoint = sp;
                                context.announce(sp.name);
                              },
                            ),
                        ];
                      })(),
                    GameShortcut(
                      title: 'Award point to first player',
                      shortcut: GameShortcutsShortcut.bracketLeft,
                      onStart: (_) {
                        showdownPoint = null;
                        awardingPlayer = setPlayers.first;
                        context.announce(awardingPlayer!.name);
                      },
                      onStop: (_) {
                        awardingPlayer = null;
                        _awardPoint(
                          ref: ref,
                          point: showdownPoint,
                          player: setPlayers.first,
                        );
                      },
                    ),
                    GameShortcut(
                      title: 'Award point to second player',
                      shortcut: GameShortcutsShortcut.bracketRight,
                      onStart: (_) {
                        showdownPoint = null;
                        awardingPlayer = setPlayers.last;
                        context.announce(awardingPlayer!.name);
                      },
                      onStop: (_) {
                        awardingPlayer = null;
                        _awardPoint(
                          ref: ref,
                          point: showdownPoint,
                          player: setPlayers.last,
                        );
                      },
                    ),
                    GameShortcut(
                      title:
                          'Clear awarding player or return to previous screen',
                      shortcut: GameShortcutsShortcut.escape,
                      onStart: (final innerContext) {
                        if (awardingPlayer == null) {
                          innerContext.pop();
                        } else {
                          awardingPlayer = null;
                          showdownPoint = null;
                          innerContext.announce('Cancelled.');
                        }
                      },
                    ),
                    GameShortcut(
                      title: 'Delete the most recent point',
                      shortcut: GameShortcutsShortcut.backspace,
                      shiftKey: true,
                      onStart: (final innerContext) async {
                        if (points.isEmpty) {
                          return innerContext.announce(
                            'There are no points to delete.',
                          );
                        }
                        final point = points.last;
                        final player = point.setPoint.playerId == server.id
                            ? server
                            : receiver;
                        await database.managers.setPoints
                            .filter((final f) => f.id.equals(point.setPoint.id))
                            .delete();
                        ref.invalidate(setPointsProvider(setId));
                        if (context.mounted) {
                          context.announce(
                            // ignore: lines_longer_than_80_chars
                            'Deleted ${point.showdownPoint.name} from ${player.name}.',
                          );
                        }
                      },
                    ),
                  ];
                  shortcuts.add(
                    GameShortcut(
                      title: 'Show help',
                      shortcut: GameShortcutsShortcut.slash,
                      shiftKey: true,
                      onStart: (final innerContext) =>
                          innerContext.pushWidgetBuilder(
                            (_) =>
                                GameShortcutsHelpScreen(shortcuts: shortcuts),
                          ),
                    ),
                  );
                  return GameShortcuts(
                    autofocus: false,
                    canRequestFocus: false,
                    shortcuts: shortcuts,
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        ...setPlayers.map(
                          (final player) => _PlayerListTile(
                            autofocus: player.id == players.first.id,
                            player: player,
                            readOnly: readOnly,
                            serveNumber: player.id == server.id
                                ? serveNumber
                                : null,
                            setId: setId,
                            setNumber: setNumber,
                            points: points,
                          ),
                        ),
                        const SizedBox(height: 100),
                        ...[
                          for (var i = 0; i < points.length; i++)
                            () {
                              final pointContext = points[i];
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
                                        ref.invalidate(
                                          setPointsProvider(setId),
                                        );
                                      },
                                    ),
                                  ),
                                  if (gamePoint.id == points.last.setPoint.id)
                                    PerformableAction(
                                      name: 'delete',
                                      activator: deleteShortcut,
                                      invoke: () async {
                                        await query.delete();
                                        ref.invalidate(
                                          setPointsProvider(setId),
                                        );
                                        if (context.mounted) {
                                          context.announce(
                                            // ignore: lines_longer_than_80_chars
                                            'Deleted ${point.name} from ${player.name}.',
                                          );
                                        }
                                      },
                                    ),
                                ],
                                title: PlayerCustomText(
                                  playerId: playerId,
                                  points: getPoints(
                                    points.sublist(0, i + 1),
                                    player,
                                  ),
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
                            }(),
                        ],
                      ],
                    ),
                  );
                });
              });
            });
          }),
        );
      },
      error: ErrorScreen.withPositional,
      loading: LoadingScreen.new,
    );
  }

  /// Speak the stats of [player].
  void _speakPlayerStats({
    required final WidgetRef ref,
    required final TeamPlayer player,
    required final List<SetPointContext> points,
  }) {
    final playerPoints = getPoints(points, player);
    ref.context.announce('${player.name}: $playerPoints');
  }

  /// Award [point] to [player].
  Future<void> _awardPoint({
    required final WidgetRef ref,
    required final ShowdownPoint? point,
    required final TeamPlayer player,
  }) async {
    if (point == null) {
      return;
    }
    final database = ref.read(databaseProvider);
    await database.managers.setPoints.create(
      (final f) => f(gameSetId: setId, playerId: player.id, pointId: point.id),
    );
    ref
      ..invalidate(setPointsProvider(setId))
      ..invalidate(showdownPointScoresProvider(player.teamId));
    final context = ref.context;
    if (context.mounted) {
      context.announce('Awarded ${point.name} to ${player.name}.');
    }
  }
}

class _PlayerListTile extends ConsumerWidget {
  /// Create an instance.
  const _PlayerListTile({
    required this.autofocus,
    required this.player,
    required this.readOnly,
    required this.serveNumber,
    required this.setId,
    required this.setNumber,
    required this.points,
  });

  /// The ID of the set that [player] is playing in.
  final int setId;

  /// The set number.
  final int setNumber;

  /// The player to show.
  final TeamPlayer player;

  /// The serve number for [player].
  final int? serveNumber;

  /// Whether the set is read-only.
  final bool readOnly;

  /// Whether the [ListTile] should be autofocused.
  final bool autofocus;

  /// The list of points which have been scored so far in the set.
  final List<SetPointContext> points;

  /// Build the widget.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final isServing = serveNumber != null;
    final database = ref.watch(databaseProvider);
    final value = ref.watch(
      showdownPointsProvider(player.teamId, playerId: player.id),
    );
    return value.when(
      data: (final showdownPoints) => PerformableActionsListTile(
        actions: showdownPoints
            .map(
              (final point) => PerformableAction(
                name: '${point.name} (${point.value})',
                invoke: () async {
                  await database.managers.setPoints.create(
                    (final o) => o(
                      gameSetId: setId,
                      playerId: player.id,
                      pointId: point.id,
                    ),
                  );
                  ref
                    ..invalidate(setPointsProvider(setId))
                    ..invalidate(
                      showdownPointsProvider(
                        player.teamId,
                        playerId: player.id,
                      ),
                    );
                },
              ),
            )
            .toList(),
        autofocus: autofocus,
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
            (_) => CreateGamePointScreen(setId: setId, playerId: player.id),
          );
        },
      ),
      error: ErrorText.withPositional,
      loading: () => ListTile(
        autofocus: autofocus,
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
            (_) => CreateGamePointScreen(setId: setId, playerId: player.id),
          );
        },
      ),
    );
  }
}
