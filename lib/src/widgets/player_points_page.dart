import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ladder/ladder.dart';

/// A page which shows the possible points, along with the number of times this
/// player has scored that particular point.
class PlayerPointsPage extends ConsumerWidget {
  /// Create an instance.
  const PlayerPointsPage({required this.playerId, super.key});

  /// The ID of the player whose scores will be shown.
  final int playerId;

  /// Build the widget.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final value = ref.watch(showdownPointScoresProvider(playerId));
    return value.simpleWhen((final points) {
      if (points.isEmpty) {
        return const CustomCenterText(text: 'There are no points to show.');
      }
      return ListView.builder(
        itemBuilder: (final context, final index) {
          final result = points[index];
          return ListTile(
            autofocus: index == 0,
            title: CustomText(text: result.point.name),
            subtitle: CustomText(text: '${result.score}'),
            onTap: () {},
          );
        },
        itemCount: points.length,
        shrinkWrap: true,
      );
    });
  }
}
