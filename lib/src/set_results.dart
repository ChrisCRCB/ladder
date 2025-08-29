import 'package:ladder/src/database/_DATABASE.dart';

/// The results of a set.
sealed class SetResults {
  /// Create an instance.
  const SetResults();
}

/// The result of an undecided set.
class UndecidedSetResults implements SetResults {
  /// Create an instance.
  const UndecidedSetResults();
}

/// The result of all undecided sets.
const undecided = UndecidedSetResults();

/// The result of a set with a clear winner.
class DecidedSetResults implements SetResults {
  /// Create an instance.
  const DecidedSetResults({
    required this.winner,
    required this.winningPoints,
    required this.loser,
    required this.losingPoints,
  });

  /// The winning player.
  final TeamPlayer winner;

  /// The number of points the [winner] got.
  final int winningPoints;

  /// The losing player.
  final TeamPlayer loser;

  /// The number of points the loser got.
  final int losingPoints;
}
