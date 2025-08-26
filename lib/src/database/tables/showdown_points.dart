import 'package:drift/drift.dart';
import 'package:ladder/src/database/_database.dart';

/// The possible endings for game points.
class ShowdownPoints extends Table with IdMixin, NameMixin {
  /// The ID of the team this ending belongs to.
  IntColumn get teamId =>
      integer().references(ShowdownTeams, #id, onDelete: KeyAction.cascade)();

  /// How many points this ending is worth.
  ///
  ///  If [value] is < 0, then this ending gives the points to the opponent.
  IntColumn get value => integer()();
}
