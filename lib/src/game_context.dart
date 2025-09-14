import 'package:ladder/ladder.dart';

/// Context for a [game].
class GameContext {
  /// Create a new [GameContext].
  const GameContext({
    required this.game,
    required this.firstPlayer,
    required this.secondPlayer,
    required this.sets,
  });

  /// The game in question.
  final ShowdownGame game;

  /// The first player in this game.
  final TeamPlayer firstPlayer;

  /// The second player in this game.
  final TeamPlayer secondPlayer;

  /// The sets in this game.
  final List<GameSetContext> sets;
}
