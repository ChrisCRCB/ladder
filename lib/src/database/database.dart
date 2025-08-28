import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:ladder/src/database/tables.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

part 'database.g.dart';

/// The database class.
@DriftDatabase(
  tables: [
    ShowdownTeams,
    ShowdownPoints,
    TeamPlayers,
    LadderNights,
    ShowdownGames,
    ShowdownChallenges,
    GamePoints,
    LadderNightAbsences,
  ],
)
class LadderDatabase extends _$LadderDatabase {
  /// Create an instance.
  LadderDatabase({final String filename = 'ladder.sqlite3'})
    : super(
        LazyDatabase(() async {
          final directory = await getApplicationDocumentsDirectory();
          final file = File(path.join(directory.path, filename));
          return NativeDatabase(file);
        }),
      );

  /// The schema version to use.
  @override
  int get schemaVersion => 3;

  /// The migration strategy to use.
  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (final m) => m.createAll(),
    beforeOpen: (final details) => customStatement('PRAGMA foreign_keys = ON'),
    onUpgrade: (final m, final from, final to) async {
      if (from < 2) {
        await m.addColumn(gamePoints, gamePoints.createdAt);
      }
      if (from < 3) {
        await m.createTable(ladderNightAbsences);
      }
    },
  );
}
