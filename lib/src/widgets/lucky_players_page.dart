import 'package:backstreets_widgets/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ladder/ladder.dart';

/// The page which shows how lucky players are.
class LuckyPlayersPage extends ConsumerWidget {
  /// Create an instance.
  const LuckyPlayersPage({required this.teamId, super.key});

  /// The ID of the team whose lucky players will be shown.
  final int teamId;

  /// Build the widget.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final value = ref.watch(luckyPlayersProvider(teamId));
    return value.simpleWhen((final players) {
      if (players.isEmpty) {
        return const CustomCenterText(text: 'This team has no lucky players.');
      }
      return ListView.builder(
        itemBuilder: (final context, final index) {
          final result = players[index];
          final player = result.$1;
          final luck = result.$2;
          return ListTile(
            autofocus: index == 0,
            title: CustomText(text: player.name),
            subtitle: CustomText(text: '$luck'),
            onTap: () => context.pushWidgetBuilder(
              (_) => PlayerScreen(playerId: player.id),
            ),
          );
        },
        itemCount: players.length,
        shrinkWrap: true,
      );
    });
  }
}
