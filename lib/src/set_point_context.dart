import 'package:ladder/ladder.dart';

/// A class to hold both a [setPoint], and associated[showdownPoint].
class SetPointContext {
  /// Create an instance.
  const SetPointContext({required this.setPoint, required this.showdownPoint});

  /// The game point to represent.
  final SetPoint setPoint;

  /// The showdown point which [setPoint] represents.
  final ShowdownPoint showdownPoint;
}
