import 'package:ladder/ladder.dart';

/// A class to hold both a [gamePoint], and associated[showdownPoint].
class GamePointContext {
  /// Create an instance.
  const GamePointContext({
    required this.gamePoint,
    required this.showdownPoint,
  });

  /// The game point to represent.
  final GamePoint gamePoint;

  /// The showdown point which [gamePoint] represents.
  final ShowdownPoint showdownPoint;
}
