import 'package:flutter/material.dart';

/// A [Text] widget which shows [error] and [stackTrace].
class ErrorText extends StatelessWidget {
  /// Create an instance.
  const ErrorText({required this.error, required this.stackTrace, super.key});

  /// Create an instance from positional arguments.
  const ErrorText.withPositional(this.error, this.stackTrace, {super.key});

  /// The error object to show.
  final Object error;

  /// The stack trace to show.
  final StackTrace stackTrace;

  /// Build the widget.
  @override
  Widget build(final BuildContext context) => Text('$error\n$stackTrace');
}
