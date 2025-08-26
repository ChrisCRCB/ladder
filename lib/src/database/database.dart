import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:ladder/ladder.dart';
import 'package:ladder/src/database/tables/_tables.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

part 'database.g.dart';

/// The database class.
@DriftDatabase(tables: [ShowdownTeams, ShowdownPoints, TeamPlayers])
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
  int get schemaVersion => 1;
}
