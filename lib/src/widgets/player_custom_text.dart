import 'package:backstreets_widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ladder/src/providers.dart';
import 'package:ladder/src/widgets/_widgets.dart';

/// A [CustomText] that shows a player's name.
class PlayerCustomText extends ConsumerWidget {
  /// Create an instance.
  const PlayerCustomText({
    required this.playerId,
    this.points,
    this.showPoints = true,
    super.key,
  });

  /// The ID of the player to show.
  final int playerId;

  /// The points to show.
  ///
  /// If [points] is `null`, then the player's points will be shown instead.
  final int? points;

  /// Whether to show points.
  final bool showPoints;

  /// Build the widget.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final value = ref.watch(teamPlayerProvider(playerId));
    return value.when(
      data: (final player) => CustomText(
        text:
            // ignore: lines_longer_than_80_chars
            '${player.name}${showPoints ? " (${points ?? player.points})" : ""}',
      ),
      error: (final e, final s) => Text('$e\n$s'),
      loading: LoadingWidget.new,
    );
  }
}
