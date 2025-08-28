import 'package:backstreets_widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ladder/ladder.dart';

/// A widget which shows two player names.
class PlayersCustomText extends ConsumerWidget {
  /// Create an instance.
  const PlayersCustomText({
    required this.firstPlayerId,
    required this.secondPlayerId,
    this.separator = ' vs ',
    super.key,
  });

  /// The ID of the first player.
  final int firstPlayerId;

  /// The ID of the second player.
  final int secondPlayerId;

  /// The string to separate the two player names.
  final String separator;

  /// Build the widget.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final value1 = ref.watch(teamPlayerProvider(firstPlayerId));
    return value1.when(
      data: (final player1) {
        final value2 = ref.watch(teamPlayerProvider(secondPlayerId));
        return value2.when(
          data: (final player2) => CustomText(
            text:
                // ignore: lines_longer_than_80_chars
                '${player1.name} (${player1.points})$separator${player2.name} (${player2.points})',
          ),
          error: ErrorText.withPositional,
          loading: () => CustomText(
            text: '${player1.name} (${player1.points})${separator}Loading',
          ),
        );
      },
      error: ErrorText.withPositional,
      loading: LoadingWidget.new,
    );
  }
}
