import 'package:backstreets_widgets/extensions.dart';
import 'package:backstreets_widgets/shortcuts.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ladder/ladder.dart';
import 'package:time/time.dart';

/// A page which shows the most recent ladder nights.
class LadderNightsPage extends ConsumerWidget {
  /// Create an instance.
  const LadderNightsPage({required this.teamId, super.key});

  /// The ID of the team whose ladder nights will be shown.
  final int teamId;

  /// Build the widget.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final database = ref.watch(databaseProvider);
    final value = ref.watch(ladderNightsProvider(teamId));
    return value.simpleWhen((final nights) {
      if (nights.isEmpty) {
        return const CustomCenterText(
          text: 'There are no ladder nights to show.',
        );
      }
      return ListView.builder(
        itemBuilder: (final context, final index) {
          final night = nights[index];
          final query = database.managers.ladderNights.filter(
            (final f) => f.id.equals(night.id),
          );
          return PerformableActionsListTile(
            autofocus: index == 0,
            actions: [
              PerformableAction(
                name: 'Move date forward an hour',
                activator: moveUpShortcut,
                invoke: () async {
                  await query.update(
                    (final o) => o(createdAt: Value(night.createdAt + 1.days)),
                  );
                  ref.invalidate(ladderNightsProvider(teamId));
                },
              ),
              PerformableAction(
                name: 'Move date back an hour',
                activator: moveDownShortcut,
                invoke: () async {
                  await query.update(
                    (final o) => o(createdAt: Value(night.createdAt - 1.days)),
                  );
                  ref.invalidate(ladderNightsProvider(teamId));
                },
              ),
              PerformableAction(
                name: 'Move time forward an hour',
                activator: moveRightShortcut,
                invoke: () async {
                  await query.update(
                    (final o) => o(createdAt: Value(night.createdAt + 1.hours)),
                  );
                  ref.invalidate(ladderNightsProvider(teamId));
                },
              ),
              PerformableAction(
                name: 'Move time back an hour',
                activator: moveLeftShortcut,
                invoke: () async {
                  await query.update(
                    (final o) => o(createdAt: Value(night.createdAt - 1.hours)),
                  );
                  ref.invalidate(ladderNightsProvider(teamId));
                },
              ),
            ],
            title: CustomText(text: dateFormat.format(night.createdAt)),
            onTap: () => context.pushWidgetBuilder(
              (_) => LadderNightScreen(ladderNightId: night.id),
            ),
          );
        },
        itemCount: nights.length,
        shrinkWrap: true,
      );
    });
  }
}
