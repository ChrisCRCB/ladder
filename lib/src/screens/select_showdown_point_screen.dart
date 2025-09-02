import 'package:backstreets_widgets/extensions.dart';
import 'package:backstreets_widgets/screens.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ladder/ladder.dart';

/// A screen for selecting a showdown point.
class SelectShowdownPointScreen extends ConsumerWidget {
  /// Create an instance.
  const SelectShowdownPointScreen({
    required this.teamId,
    required this.onChanged,
    this.showdownPointId,
    this.playerId,
    this.title = 'Select Point Type',
    super.key,
  });

  /// The ID of the team whose showdown points should be used.
  final int teamId;

  /// The function to call when a showdown point has been selected.
  final ValueChanged<ShowdownPoint> onChanged;

  /// The ID of the current point.
  final int? showdownPointId;

  /// The ID of the player to sort points by.
  final int? playerId;

  /// The title of the screen.
  final String title;

  /// Build the widget.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final value = ref.watch(showdownPointsProvider(teamId, playerId: playerId));
    return Cancel(
      child: FontShortcuts(
        child: SimpleScaffold(
          title: title,
          body: value.simpleWhen(
            (final points) => ListView.builder(
              itemBuilder: (final context, final index) {
                final point = points[index];
                return ListTile(
                  autofocus: (showdownPointId == null)
                      ? index == 0
                      : (point.id == showdownPointId),
                  title: CustomText(text: point.name),
                  subtitle: CustomText(text: '${point.value}'),
                  onTap: () {
                    context.pop();
                    onChanged(point);
                  },
                );
              },
              itemCount: points.length,
              shrinkWrap: true,
            ),
          ),
        ),
      ),
    );
  }
}
