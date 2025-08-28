import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:ladder/ladder.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'providers.g.dart';

/// Provide application settings.
@riverpod
Future<ApplicationSettings> applicationSettings(final Ref ref) async {
  final preferences = SharedPreferencesAsync();
  final source = await preferences.getString(applicationSettingsKey);
  if (source == null) {
    return ApplicationSettings();
  }
  final json = jsonDecode(source);
  return ApplicationSettings.fromJson(json as Map<String, dynamic>);
}

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

/// Provide a single team.
@riverpod
Future<ShowdownTeam> showdownTeam(final Ref ref, final int teamId) {
  final database = ref.watch(databaseProvider);
  return database.managers.showdownTeams
      .filter((final f) => f.id.equals(teamId))
      .getSingle();
}

/// Provide all players on a team.
@riverpod
Future<List<TeamPlayer>> teamPlayers(final Ref ref, final int teamId) {
  final database = ref.watch(databaseProvider);
  return database.managers.teamPlayers
      .filter((final f) => f.teamId.id.equals(teamId))
      .orderBy((final o) => o.points.desc())
      .orderBy((final o) => o.name.asc())
      .get();
}

/// Provide a single player.
@riverpod
Future<TeamPlayer> teamPlayer(final Ref ref, final int playerId) {
  final database = ref.watch(databaseProvider);
  return database.managers.teamPlayers
      .filter((final f) => f.id.equals(playerId))
      .getSingle();
}

/// Provide all the fouls for a given team.
@riverpod
Future<List<ShowdownPoint>> showdownPoints(final Ref ref, final int teamId) {
  final database = ref.watch(databaseProvider);
  return database.managers.showdownPoints
      .filter((final f) => f.teamId.id.equals(teamId))
      .orderBy((final o) => o.name.asc())
      .get();
}

/// Provide the recent ladder nights.
@riverpod
Future<List<LadderNight>> ladderNights(final Ref ref, final int teamId) async {
  final database = ref.watch(databaseProvider);
  return database.managers.ladderNights
      .orderBy((final o) => o.createdAt.desc())
      .get();
}

/// Provide a single ladder night.
@riverpod
Future<LadderNight> ladderNight(final Ref ref, final int ladderNightId) {
  final database = ref.watch(databaseProvider);
  return database.managers.ladderNights
      .filter((final f) => f.id.equals(ladderNightId))
      .getSingle();
}

/// Provide all the games for a given ladder night.
@riverpod
Future<List<ShowdownGame>> games(final Ref ref, final int ladderNightId) {
  final database = ref.watch(databaseProvider);
  return database.managers.showdownGames
      .filter((final f) => f.ladderNightId.id.equals(ladderNightId))
      .orderBy((final o) => o.createdAt.asc())
      .get();
}

/// Provide a single game.
@riverpod
Future<ShowdownGame> game(final Ref ref, final int gameId) {
  final database = ref.watch(databaseProvider);
  return database.managers.showdownGames
      .filter((final f) => f.id.equals(gameId))
      .getSingle();
}

/// Provide all the players which the given player can challenge.
@riverpod
Future<List<TeamPlayer>> challengeablePlayers(
  final Ref ref,
  final int playerId,
  final int ladderNightId,
) async {
  final db = ref.watch(databaseProvider);
  final firstPlayer = await ref.watch(teamPlayerProvider(playerId).future);
  final team = await ref.watch(showdownTeamProvider(firstPlayer.teamId).future);
  final players = db.alias(db.teamPlayers, 'players');
  final absences = db.alias(db.ladderNightAbsences, 'absences');
  final nights = db.alias(db.ladderNights, 'nights');
  final query =
      await (db.select(players).join([
            innerJoin(
              nights,
              nights.teamId.equals(firstPlayer.teamId),
              useColumns: false,
            ),
            leftOuterJoin(
              absences,
              absences.teamPlayerId.equalsExp(players.id) &
                  absences.ladderNightId.equals(ladderNightId),
              useColumns: false,
            ),
          ])..where(
            absences.id.isNull() &
                players.teamId.equals(firstPlayer.teamId) &
                players.points.isBetween(
                  Constant(firstPlayer.points - team.challengePoints),
                  Constant(firstPlayer.points + team.challengePoints),
                ) &
                players.id.isNotValue(firstPlayer.id) &
                notExistsQuery(
                  db.select(db.showdownGames)..where(
                    (final g) =>
                        g.ladderNightId.equals(ladderNightId) &
                        ((g.firstPlayerId.equals(firstPlayer.id) &
                                g.secondPlayerId.equalsExp(players.id)) |
                            (g.secondPlayerId.equals(firstPlayer.id) &
                                g.firstPlayerId.equalsExp(players.id))),
                  ),
                ),
          ))
          .get();
  final results = query.map((final row) => row.readTable(players));
  return results.toList();
}

/// Provide all the points for the given set.
@riverpod
Future<List<GamePoint>> setPoints(final Ref ref, final int setId) async {
  final database = ref.watch(databaseProvider);
  return database.managers.gamePoints
      .filter((final f) => f.gameSetId.id.equals(setId))
      .orderBy((final o) => o.createdAt.asc())
      .get();
}

/// Provide all the players who are attending the given ladder night.
@riverpod
Future<List<TeamPlayer>> attendingTeamPlayers(
  final Ref ref,
  final int ladderNightId,
) async {
  final db = ref.watch(databaseProvider);
  final query = await (db.select(db.teamPlayers).join([
    innerJoin(
      db.ladderNights,
      db.ladderNights.teamId.equalsExp(db.teamPlayers.teamId),
      useColumns: false,
    ),
    leftOuterJoin(
      db.ladderNightAbsences,
      db.teamPlayers.id.equalsExp(db.ladderNightAbsences.teamPlayerId) &
          db.ladderNightAbsences.ladderNightId.equals(ladderNightId),
      useColumns: false,
    ),
  ])..where(db.ladderNightAbsences.id.isNull())).get();
  final results = query.map((final row) => row.readTable(db.teamPlayers));
  return results.toList();
}

/// Provide a list of player attendances for the given ladder night.
@riverpod
Future<List<PlayerAttendance>> playerAttendance(
  final Ref ref,
  final int ladderNightId,
) async {
  final db = ref.watch(databaseProvider);
  final query = db.select(db.teamPlayers).join([
    innerJoin(
      db.ladderNights,
      db.teamPlayers.teamId.equalsExp(db.ladderNights.teamId),
    ),
    leftOuterJoin(
      db.ladderNightAbsences,
      db.ladderNightAbsences.ladderNightId.equals(ladderNightId) &
          db.ladderNightAbsences.teamPlayerId.equalsExp(db.teamPlayers.id),
    ),
  ]);
  final results = await query.get();
  return results
      .map(
        (final row) => PlayerAttendance(
          player: row.readTable(db.teamPlayers),
          absence: row.readTableOrNull(db.ladderNightAbsences),
        ),
      )
      .toList();
}

/// Provide the sets in a given game.
@riverpod
Future<List<GameSet>> gameSets(final Ref ref, final int gameId) {
  final database = ref.watch(databaseProvider);
  return database.managers.gameSets
      .filter((final f) => f.gameId.id.equals(gameId))
      .get();
}

/// Provide a single game set.
@riverpod
Future<GameSet> gameSet(final Ref ref, final int setId) {
  final database = ref.watch(databaseProvider);
  return database.managers.gameSets
      .filter((final f) => f.id.equals(setId))
      .getSingle();
}

/// Return the players who are involved in a given game.
@riverpod
Future<List<TeamPlayer>> gamePlayers(final Ref ref, final int gameId) async {
  final database = ref.watch(databaseProvider);
  final game = await ref.watch(gameProvider(gameId).future);
  return database.managers.teamPlayers
      .filter(
        (final f) =>
            f.id.equals(game.firstPlayerId) | f.id.equals(game.secondPlayerId),
      )
      .get();
}
