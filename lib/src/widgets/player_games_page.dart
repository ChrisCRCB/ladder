import 'package:backstreets_widgets/extensions.dart';
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
          return ListTile(
            autofocus: index == 0,
            title: PlayersCustomText(
              firstPlayerId: game.firstPlayerId,
              secondPlayerId: game.secondPlayerId,
            ),
            subtitle: CustomText(text: timeFormat.format(game.createdAt)),
            trailing: const Icon(Icons.lock, semanticLabel: 'Locked'),
            onTap: () => context.pushWidgetBuilder(
              (_) => EditGameScreen(
                gameId: game.id,
                readOnly: game.lockedOn != null,
              ),
            ),
          );
        },
        itemCount: games.length,
        shrinkWrap: true,
      );
    });
  }
}
