import 'package:ladder/ladder.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'providers.g.dart';

/// Provide the database.
@Riverpod(keepAlive: true)
LadderDatabase database(final Ref ref) => LadderDatabase();

/// Provide all teams in the database.
@riverpod
Future<List<ShowdownTeam>> showdownTeams(final Ref ref) {
  final database = ref.watch(databaseProvider);
  return database.managers.showdownTeams
      .orderBy((final o) => o.lastAccessed.desc())
      .get();
}
