import 'package:backstreets_widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ladder/src/providers.dart';
import 'package:ladder/src/widgets/_widgets.dart';

/// A [CustomText] that shows a player's name.
class PlayerCustomText extends ConsumerWidget {
  /// Create an instance.
  const PlayerCustomText({required this.playerId, super.key});

  /// The ID of the player to show.
  final int playerId;

  /// Build the widget.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final value = ref.watch(teamPlayerProvider(playerId));
    return value.when(
      data: (final player) => CustomText(text: player.name),
      error: (final e, final s) => Text('$e\n$s'),
      loading: LoadingWidget.new,
    );
  }
}
