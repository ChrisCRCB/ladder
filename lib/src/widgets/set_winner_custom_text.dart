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
    final value = ref.watch(setWinnerProvider(setId));
    return value.when(
      data: (final winner) =>
          CustomText(text: winner?.name ?? undecidedMessage),
      error: ErrorText.withPositional,
      loading: () => CustomText(text: undecidedMessage),
    );
  }
}
