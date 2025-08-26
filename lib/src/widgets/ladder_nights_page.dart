import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ladder/ladder.dart';

/// A page which shows the most recent ladder nights.
class LadderNightsPage extends ConsumerWidget {
  /// Create an instance.
  const LadderNightsPage({required this.teamId, super.key});

  /// The ID of the team whose ladder nights will be shown.
  final int teamId;

  /// Build the widget.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final value = ref.watch(recentLadderNightsProvider(teamId));
    return value.simpleWhen((final nights) {
      if (nights.isEmpty) {
        return const CustomCenterText(
          text: 'There are no ladder nights to show.',
        );
      }
      return ListView.builder(
        itemBuilder: (final context, final index) {
          final night = nights[index];
          return ListTile(
            title: CustomText(text: 'Held on ${night.createdAt.toLocal()}'),
            onTap: () {},
          );
        },
        itemCount: nights.length,
        shrinkWrap: true,
      );
    });
  }
}
