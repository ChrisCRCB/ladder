import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ladder/src/providers.dart';
import 'package:ladder/src/widgets/custom_text.dart';

/// A [Text] widget which shows the points for a player with [playerId].
class ShowdownPlayerPointsText extends ConsumerWidget {
  /// Create an instance.
  const ShowdownPlayerPointsText({required this.playerId, super.key});

  /// The ID of the player whose points will be shown.
  final int playerId;

  /// Build the widget.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final value = ref.watch(playerPointsProvider(playerId));
    return value.when(
      data: (final points) => CustomText(text: '$points'),
      error: (final error, final stackTrace) => Text('$error\n$stackTrace'),
      loading: () => const CustomText(text: 'Loading'),
    );
  }
}
