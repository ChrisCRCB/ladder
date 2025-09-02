import 'package:backstreets_widgets/screens.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ladder/ladder.dart';

/// A screen which shows a player.
class PlayerScreen extends ConsumerWidget {
  /// Create an instance.
  const PlayerScreen({required this.playerId, super.key});

  /// The ID of the player to show.
  final int playerId;

  /// Build the widget.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) => Cancel(
    child: TabbedScaffold(
      tabs: [
        TabbedScaffoldTab(
          title: 'Games',
          icon: const Icon(Icons.emoji_events),
          child: PlayerGamesPage(playerId: playerId),
        ),
        TabbedScaffoldTab(
          title: 'Points',
          icon: const Text('Player statistics'),
          child: PlayerPointsPage(playerId: playerId),
        ),
      ],
    ),
  );
}
