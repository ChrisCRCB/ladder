import 'package:drift/drift.dart';
import 'package:ladder/src/database/tables.dart';

part 'database.g.dart';

/// The database class.
@DriftDatabase(
  tables: [
    ShowdownTeams,
    ShowdownPoints,
    TeamPlayers,
    LadderNights,
    ShowdownGames,
    SetPoints,
    LadderNightAbsences,
    GameSets,
  ],
)
class LadderDatabase extends _$LadderDatabase {
  /// Create an instance.
  LadderDatabase(super.e);

  /// The schema version to use.
  @override
  int get schemaVersion => 2;

  /// The migration strategy to use.
  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (final m) => m.createAll(),
    beforeOpen: (final details) => customStatement('PRAGMA foreign_keys = ON'),
    onUpgrade: (final m, final from, final to) async {
      if (from < 2) {
        await m.addColumn(showdownTeams, showdownTeams.servesPerPlayer);
      }
    },
  );
}
