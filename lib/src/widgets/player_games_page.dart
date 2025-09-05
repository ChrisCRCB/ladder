import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ladder/ladder.dart';

/// A page which shows all games played by a given player.
class PlayerGamesPage extends ConsumerWidget {
  /// Create an instance.
  const PlayerGamesPage({required this.playerId, super.key});

  /// The ID of the player to show.
  final int playerId;

  /// Build the widget.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final value = ref.watch(playerGamesProvider(playerId));
    return value.simpleWhen((final games) {
      if (games.isEmpty) {
        return const CustomCenterText(
          text: 'There are no games for this player.',
        );
      }
      return ListView.builder(
        itemBuilder: (final context, final index) {
          final game = games[index];
          return GameListTile(gameId: game.id, autofocus: index == 0);
        },
        itemCount: games.length,
        shrinkWrap: true,
      );
    });
  }
}
