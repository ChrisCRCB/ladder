import 'package:backstreets_widgets/extensions.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ladder/ladder.dart';

/// The coaching list tile.
class CoachListTile extends ConsumerWidget {
  /// Create an instance.
  const CoachListTile({
    required this.gameId,
    required this.coachNumber,
    this.autofocus = false,
    super.key,
  });

  /// The ID of the game to edit.
  final int gameId;

  /// The coach to edit.
  final CoachNumber coachNumber;

  /// Whether the [ListTile] should be autofocused.
  final bool autofocus;

  /// Build the widget.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final value = ref.watch(gameProvider(gameId));
    return value.when(
      data: (final game) {
        final value = ref.watch(
          teamPlayerProvider(switch (coachNumber) {
            CoachNumber.first => game.firstPlayerId,
            CoachNumber.second => game.secondPlayerId,
          }),
        );
        return value.when(
          data: (final player) => ListTile(
            autofocus: autofocus,
            title: CustomText(text: 'Coach for ${player.name}'),
            subtitle: CustomText(
              text: game.getCoachName(coachNumber) ?? '<None>',
            ),
            onTap: () {
              if (game.lockedOn == null) {
                context.pushWidgetBuilder(
                  (final innerContext) =>
                      EditCoachScreen(gameId: gameId, coachNumber: coachNumber),
                );
              }
            },
          ),
          error: ErrorListTile.withPositional,
          loading: LoadingWidget.new,
        );
      },
      error: ErrorListTile.withPositional,
      loading: LoadingWidget.new,
    );
  }
}
