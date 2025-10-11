import 'package:backstreets_widgets/extensions.dart';
import 'package:backstreets_widgets/screens.dart';
import 'package:backstreets_widgets/shortcuts.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ladder/ladder.dart';

/// The points page.
class PointsPage extends ConsumerWidget {
  /// Create an instance.
  const PointsPage({required this.teamId, super.key});

  /// The ID of the team whose points will be shown.
  final int teamId;

  /// Build the widget.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final database = ref.watch(databaseProvider);
    final value = ref.watch(showdownPointsProvider(teamId));
    return value.simpleWhen((final points) {
      if (points.isEmpty) {
        return const CustomCenterText(text: 'There are no points to show.');
      }
      return ListView.builder(
        itemBuilder: (final context, final index) {
          final point = points[index];
          final query = database.managers.showdownPoints.filter(
            (final f) => f.id.equals(point.id),
          );
          return PerformableActionsListTile(
            actions: [
              PerformableAction(
                name: 'Rename',
                activator: renameShortcut,
                invoke: () => context.pushWidgetBuilder(
                  (final innerContext) => GetText(
                    onDone: (final value) async {
                      innerContext.pop();
                      await query.update((final o) => o(name: Value(value)));
                      ref.invalidate(showdownPointsProvider(teamId));
                    },
                    labelText: 'Team name',
                    text: point.name,
                    title: 'Rename Team',
                  ),
                ),
              ),
              PerformableAction(
                name: 'Increase points',
                activator: moveUpShortcut,
                invoke: () async {
                  await query.update(
                    (final o) => o(value: Value(point.value + 1)),
                  );
                  ref.invalidate(showdownPointsProvider(teamId));
                },
              ),
              PerformableAction(
                name: 'Decrease points',
                activator: moveDownShortcut,
                invoke: () async {
                  await query.update(
                    (final o) => o(value: Value(point.value - 1)),
                  );
                  ref.invalidate(showdownPointsProvider(teamId));
                },
              ),
              PerformableAction(
                name: 'Ends point',
                checked: point.endsPoint,
                invoke: () async {
                  await query.update(
                    (final o) => o(endsPoint: Value(!point.endsPoint)),
                  );
                  ref.invalidate(showdownPointsProvider(teamId));
                },
              ),
              PerformableAction(
                name: 'Delete',
                activator: deleteShortcut,
                invoke: () => context.showConfirmMessage(
                  message: 'Really delete ${point.name}?',
                  title: deleteConfirmationTitle,
                  yesCallback: () async {
                    final setPointsCount = await database.managers.setPoints
                        .filter((final f) => f.pointId.id.equals(point.id))
                        .count();
                    if (setPointsCount == 0) {
                      await query.delete();
                      if (points.length == 1) {
                        for (final MapEntry(key: name, value: points)
                            in defaultPoints.entries) {
                          await database.managers.showdownPoints.create(
                            (final o) =>
                                o(teamId: teamId, name: name, value: points),
                          );
                        }
                      }
                      ref.invalidate(showdownPointsProvider(teamId));
                    } else if (context.mounted) {
                      await context.showMessage(
                        message:
                            // ignore: lines_longer_than_80_chars
                            'You can only delete points which have not yet been used.',
                      );
                    }
                  },
                ),
              ),
            ],
            autofocus: index == 0,
            title: CustomText(text: point.name),
            subtitle: CustomText(text: '${point.value}'),
            onTap: () {},
          );
        },
        itemCount: points.length,
        shrinkWrap: true,
      );
    });
  }
}
