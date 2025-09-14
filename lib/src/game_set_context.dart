import 'package:ladder/ladder.dart';

/// The context for a [gameSet].
///
/// This class holds both the [gameSet], and its [points].
class GameSetContext {
  /// Create a [GameSetContext] for the given [gameSet] and its [points].
  const GameSetContext({required this.gameSet, required this.points});

  /// The set to work with.
  final GameSet gameSet;

  /// The points which occurred in [gameSet].
  final List<SetPointContext> points;
}
