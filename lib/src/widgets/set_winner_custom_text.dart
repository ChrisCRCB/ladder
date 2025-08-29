import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ladder/ladder.dart';

/// A [CustomText] widget which shows the winner of a given set.
class SetWinnerCustomText extends ConsumerWidget {
  /// Create an instance.
  const SetWinnerCustomText({
    required this.setId,
    this.undecidedMessage = 'Undecided',
    super.key,
  });

  /// The ID of the set to show the winner for.
  final int setId;

  /// The text to show if no winner has been established.
  final String undecidedMessage;

  /// Build the widget.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final value = ref.watch(setResultsProvider(setId));
    return value.when(
      data: (final results) {
        switch (results) {
          case UndecidedSetResults():
            return CustomText(text: undecidedMessage);
          case DecidedSetResults():
            return CustomText(
              text:
                  // ignore: lines_longer_than_80_chars
                  '${results.winner.name} (${results.winningPoints}:${results.losingPoints})',
            );
        }
      },
      error: ErrorText.withPositional,
      loading: () => CustomText(text: undecidedMessage),
    );
  }
}
