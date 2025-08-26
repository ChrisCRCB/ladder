import 'package:drift/drift.dart';
import 'package:ladder/ladder.dart';

/// The possible endings for game points.
///
/// Sensible defaults should be created with each new team.
class ShowdownPoints extends Table with IdMixin, NameMixin, TeamIdMixin {
  /// How many points this ending is worth.
  ///
  ///  If [value] is < 0, then this ending gives the points to the opponent.
  late final value = integer()();
}
