import 'package:backstreets_widgets/screens.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ladder/ladder.dart';

/// A screen for creating a new game point.
class CreateGamePointScreen extends ConsumerWidget {
  /// Create an instance.
  const CreateGamePointScreen({
    required this.setId,
    required this.playerId,
    super.key,
  });

  /// The ID of the set to add the new point to.
  final int setId;

  /// The ID of the player whose point this will be.
  final int playerId;

  /// Build the widget.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final database = ref.watch(databaseProvider);
    final value = ref.watch(teamPlayerProvider(playerId));
    return Cancel(
      child: FontShortcuts(
        child: value.when(
          data: (final player) => SelectShowdownPointScreen(
            teamId: player.teamId,
            onChanged: (final point) async {
              await database.managers.gamePoints.create(
                (final f) =>
                    f(gameSetId: setId, playerId: playerId, pointId: point.id),
              );
              ref.invalidate(setPointsProvider(setId));
            },
          ),
          error: ErrorScreen.withPositional,
          loading: LoadingScreen.new,
        ),
      ),
    );
  }
}
