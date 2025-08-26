import 'package:backstreets_widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:ladder/src/widgets/custom_text.dart';

/// A custom [CenterText] widget.
class CustomCenterText extends StatelessWidget {
  /// Create an instance.
  const CustomCenterText({required this.text, super.key});

  /// The text to show.
  final String text;

  /// Build the widget.
  @override
  Widget build(final BuildContext context) => Center(
    child: Focus(autofocus: true, child: CustomText(text: text)),
  );
}
