import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ladder/ladder.dart';

/// A custom text widget, which shows [text] in the users preferred size.
class CustomText extends ConsumerWidget {
  /// Create an instance.
  const CustomText({required this.text, super.key});

  /// The text to show.
  final String text;

  /// Build the widget.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final style = DefaultTextStyle.of(context).style;
    final value = ref.watch(applicationSettingsProvider);
    return value.when(
      data: (final settings) =>
          Text(text, style: style.copyWith(fontSize: settings.fontSize)),
      error: (final e, final s) => Text('$e\n$s'),
      loading: () => Text(text, style: style),
    );
  }
}
