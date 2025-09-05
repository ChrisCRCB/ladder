import 'package:backstreets_widgets/extensions.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ladder/ladder.dart';

/// A [ListTile] to show a game with the given [gameId].
class GameListTile extends ConsumerWidget {
  /// Create an instance.
  const GameListTile({
    required this.gameId,
    required this.autofocus,
    super.key,
  });

  /// The ID of the game to show.
  final int gameId;

  /// Whether this [ListTile] should be autofocused.
  final bool autofocus;

  /// Build the widget.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    const error = ErrorListTile.withPositional;
    const loading = LoadingWidget.new;
    final value = ref.watch(gameProvider(gameId));
    return value.when(
      data: (final game) {
        final value = ref.watch(ladderNightProvider(game.ladderNightId));
        return value.when(
          data: (final night) => ListTile(
            autofocus: autofocus,
            title: PlayersCustomText(
              firstPlayerId: game.firstPlayerId,
              secondPlayerId: game.secondPlayerId,
            ),
            subtitle: CustomText(
              text: timeFormat.format(night.getStartTime(game)),
            ),
            trailing: const Icon(Icons.lock, semanticLabel: 'Locked'),
            onTap: () => context.pushWidgetBuilder(
              (_) => EditGameScreen(
                gameId: gameId,
                readOnly: game.lockedOn != null,
              ),
            ),
          ),
          error: error,
          loading: loading,
        );
      },
      error: error,
      loading: loading,
    );
  }
}
