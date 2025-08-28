import 'package:backstreets_widgets/extensions.dart';
import 'package:backstreets_widgets/screens.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ladder/ladder.dart';

/// A screen for creating a new game.
class CreateGameScreen extends ConsumerStatefulWidget {
  /// Create an instance.
  const CreateGameScreen({
    required this.ladderNightId,
    required this.gameStartTime,
    this.excludedPlayer1Ids = const [],
    super.key,
  });

  /// The ID of the night this game will be part of.
  final int ladderNightId;

  /// The time the newly-created game should start.
  final DateTime gameStartTime;

  /// The player IDs who should be excluded when selecting player 1.
  final Iterable<int> excludedPlayer1Ids;

  /// Create state for this widget.
  @override
  CreateGameScreenState createState() => CreateGameScreenState();
}

/// State for [CreateGameScreen].
class CreateGameScreenState extends ConsumerState<CreateGameScreen> {
  /// The ID of the first player.
  int? _firstPlayerId;

  /// Build a widget.
  @override
  Widget build(final BuildContext context) {
    final database = ref.watch(databaseProvider);
    final value = ref.watch(ladderNightProvider(widget.ladderNightId));
    return FontShortcuts(
      child: Cancel(
        child: value.when(
          data: (final night) {
            final firstPlayerId = _firstPlayerId;
            if (firstPlayerId == null) {
              final value = ref.watch(teamPlayersProvider(night.teamId));
              return SimpleScaffold(
                title: 'Select First Player',
                body: value.simpleWhen((final players) {
                  final allowedPlayers = players
                      .where(
                        (final player) =>
                            !widget.excludedPlayer1Ids.contains(player.id),
                      )
                      .toList();
                  if (allowedPlayers.isEmpty) {
                    return const CustomCenterText(
                      text: 'There are no players who can create new games.',
                    );
                  }
                  return ListView.builder(
                    itemBuilder: (final context, final index) {
                      final player = allowedPlayers[index];
                      return ListTile(
                        autofocus: index == 0,
                        title: CustomText(text: player.name),
                        onTap: () => setState(() => _firstPlayerId = player.id),
                      );
                    },
                    itemCount: allowedPlayers.length,
                    shrinkWrap: true,
                  );
                }),
              );
            }
            final value = ref.watch(
              challengeablePlayersProvider(firstPlayerId),
            );
            return SimpleScaffold(
              title: 'Select Second Player',
              body: value.simpleWhen((final players) {
                if (players.isEmpty) {
                  return const CustomCenterText(
                    text: 'There are no players which can be challenged.',
                  );
                }
                return ListView.builder(
                  itemBuilder: (final context, final index) {
                    final player = players[index];
                    return ListTile(
                      autofocus: index == 0,
                      title: CustomText(text: player.name),
                      onTap: () async {
                        context.pop();
                        await database.managers.showdownGames.create(
                          (final o) => o(
                            firstPlayerId: firstPlayerId,
                            secondPlayerId: player.id,
                            ladderNightId: widget.ladderNightId,
                            createdAt: Value(widget.gameStartTime),
                          ),
                        );
                        ref.invalidate(gamesProvider(night.id));
                      },
                    );
                  },
                  itemCount: players.length,
                  shrinkWrap: true,
                );
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
