import 'dart:math';

import 'package:backstreets_widgets/extensions.dart';
import 'package:backstreets_widgets/screens.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ladder/ladder.dart';

final _random = Random();

/// The screen for editing game points.
class EditGameScreen extends ConsumerWidget {
  /// Create an instance.
  const EditGameScreen({
    required this.gameId,
    this.readOnly = false,
    super.key,
  });

  /// The ID of the game to show.
  final int gameId;

  /// Whether this screen should be read only.
  final bool readOnly;

  /// Build the widget.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final database = ref.watch(databaseProvider);
    final gameValue = ref.watch(gameProvider(gameId));
    return gameValue.when(
      data: (final game) {
        final query = database.managers.showdownGames.filter(
          (final f) => f.id.equals(game.id),
        );
        final setsValue = ref.watch(gameSetsProvider(game.id));
        return Cancel(
          child: CommonShortcuts(
            newCallback: readOnly ? null : () => _createSet(ref),
            child: Scaffold(
              appBar: AppBar(
                title: PlayersCustomText(
                  firstPlayerId: game.firstPlayerId,
                  secondPlayerId: game.secondPlayerId,
                ),
              ),
              body: setsValue.simpleWhen((final sets) {
                if (sets.isEmpty) {
                  final playersValue = ref.watch(gamePlayersProvider(gameId));
                  return playersValue.simpleWhen(
                    (final players) => ListView(
                      shrinkWrap: true,
                      children: [
                        CoachListTile(
                          autofocus: true,
                          gameId: gameId,
                          coachNumber: CoachNumber.first,
                        ),
                        CoachListTile(
                          gameId: gameId,
                          coachNumber: CoachNumber.second,
                        ),
                        CheckboxListTile(
                          value: game.wonToss,
                          onChanged: (_) async {
                            await query.update(
                              (final o) => o(wonToss: Value(!game.wonToss)),
                            );
                            ref
                              ..invalidate(gamesProvider(game.ladderNightId))
                              ..invalidate(gameProvider(game.id));
                          },
                          isThreeLine: false,
                          title: CustomText(
                            text: '${players.first.name} won the toss',
                          ),
                        ),
                        ...players.map(
                          (final player) => ListTile(
                            title: PlayerCustomText(playerId: player.id),
                            onTap: () async {
                              final set = await database.managers.gameSets
                                  .createReturning(
                                    (final o) => o(
                                      gameId: gameId,
                                      startingPlayerId: player.id,
                                    ),
                                  );
                              ref.invalidate(gameSetsProvider(gameId));
                              if (context.mounted) {
                                await context.pushWidgetBuilder(
                                  (_) => EditSetScreen(
                                    setId: set.id,
                                    setNumber: 1,
                                  ),
                                );
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                }
                return ListView(
                  shrinkWrap: true,
                  children: [
                    CoachListTile(
                      gameId: gameId,
                      coachNumber: CoachNumber.first,
                      autofocus: true,
                    ),
                    CoachListTile(
                      gameId: gameId,
                      coachNumber: CoachNumber.second,
                    ),
                    for (var i = 0; i < sets.length; i++)
                      () {
                        final set = sets[i];
                        return ListTile(
                          title: CustomText(text: 'Set #${i + 1}'),
                          subtitle: PlayerCustomText(
                            playerId: set.startingPlayerId,
                            showPoints: false,
                          ),
                          trailing: SetWinnerCustomText(setId: set.id),
                          onTap: () => context.pushWidgetBuilder(
                            (_) => EditSetScreen(
                              setId: set.id,
                              setNumber: i + 1,
                              readOnly: readOnly,
                            ),
                          ),
                        );
                      }(),
                  ],
                );
              }),
              floatingActionButton: readOnly
                  ? null
                  : NewButton(
                      onPressed: () => _createSet(ref),
                      tooltip: 'Create set',
                    ),
            ),
          ),
        );
      },
      error: ErrorScreen.withPositional,
      loading: LoadingScreen.new,
    );
  }

  /// Create a new set.
  Future<void> _createSet(final WidgetRef ref) async {
    final game = await ref.read(gameProvider(gameId).future);
    final sets = await ref.read(gameSetsProvider(gameId).future);
    final startingPlayerId = sets.isEmpty
        ? [game.firstPlayerId, game.secondPlayerId][_random.nextInt(2)]
        : (sets.last.startingPlayerId == game.firstPlayerId
              ? game.secondPlayerId
              : game.firstPlayerId);
    final database = ref.read(databaseProvider);
    await database.managers.gameSets.create(
      (final o) => o(gameId: gameId, startingPlayerId: startingPlayerId),
    );
    ref.invalidate(gameSetsProvider(gameId));
  }
}
