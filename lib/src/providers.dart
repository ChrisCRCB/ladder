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
LadderDatabase database(final Ref ref) => openDatabase();

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
///
/// If [playerId] is not `null`, then points will be ordered by the frequency
/// they have been scored by that player.
///
/// It is worth noting that even "fouls" are "scored" by the player they are
/// against.
@riverpod
Future<List<ShowdownPoint>> showdownPoints(
  final Ref ref,
  final int teamId, {
  final int? playerId,
}) async {
  final database = ref.watch(databaseProvider);
  if (playerId == null) {
    return database.managers.showdownPoints
        .filter((final f) => f.teamId.id.equals(teamId))
        .orderBy((final o) => o.name.asc())
        .get();
  }
  final setPointsTable = database.setPoints;
  final showdownPointsTable = database.showdownPoints;
  final player = await ref.watch(teamPlayerProvider(playerId).future);
  final countColumn = setPointsTable.id.count();
  final rows =
      await (database.selectOnly(showdownPointsTable)
            ..addColumns([
              showdownPointsTable.id,
              showdownPointsTable.name,
              showdownPointsTable.value,
              showdownPointsTable.endsPoint,
              showdownPointsTable.teamId,
              countColumn, // exposes the aggregate
            ])
            ..join([
              // LEFT JOIN so points with zero usage still appear with count = 0
              leftOuterJoin(
                setPointsTable,
                setPointsTable.pointId.equalsExp(showdownPointsTable.id) &
                    setPointsTable.playerId.equals(playerId),
              ),
            ])
            ..where(showdownPointsTable.teamId.equals(player.teamId))
            ..groupBy([showdownPointsTable.id])
            ..orderBy([
              OrderingTerm.desc(countColumn),
              OrderingTerm.asc(showdownPointsTable.name),
            ]))
          .get();

  return rows
      .map(
        (final row) => ShowdownPoint(
          id: row.read(showdownPointsTable.id)!,
          name: row.read(showdownPointsTable.name)!,
          value: row.read(showdownPointsTable.value)!,
          endsPoint: row.read(showdownPointsTable.endsPoint)!,
          teamId: row.read(showdownPointsTable.teamId)!,
        ),
      )
      .toList();
}

/// Provide the recent ladder nights.
@riverpod
Future<List<LadderNight>> ladderNights(final Ref ref, final int teamId) async {
  final database = ref.watch(databaseProvider);
  return database.managers.ladderNights
      .filter((final f) => f.teamId.id.equals(teamId))
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
      .orderBy((final o) => o.startAfter.asc())
      .get();
}

/// Provide all games for the given team.
@riverpod
Future<List<ShowdownGame>> teamGames(final Ref ref, final int teamId) async {
  final database = ref.watch(databaseProvider);
  final games = database.showdownGames;
  final nights = database.ladderNights;
  final query = database.select(games).join([
    innerJoin(nights, nights.teamId.equals(teamId)),
  ])..orderBy([OrderingTerm.asc(games.startAfter)]);
  final results = await query.get();
  return results.map((final row) => row.readTable(games)).toList();
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
  final query =
      await (db.select(players).join([
              leftOuterJoin(
                absences,
                absences.teamPlayerId.equalsExp(players.id) &
                    absences.ladderNightId.equals(ladderNightId),
                useColumns: false,
              ),
            ])
            ..where(
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
            )
            ..orderBy([OrderingTerm.asc(players.name)]))
          .get();
  final results = query.map((final row) => row.readTable(players));
  return results.toList();
}

/// Provide all the points for the given set.
@riverpod
Future<List<SetPointContext>> setPoints(final Ref ref, final int setId) async {
  final db = ref.watch(databaseProvider);
  final query = db.select(db.setPoints).join([
    innerJoin(
      db.showdownPoints,
      db.showdownPoints.id.equalsExp(db.setPoints.pointId),
    ),
  ])..where(db.setPoints.gameSetId.equals(setId));
  final results = await query.get();
  return results
      .map(
        (final row) => SetPointContext(
          setPoint: row.readTable(db.setPoints),
          showdownPoint: row.readTable(db.showdownPoints),
        ),
      )
      .toList();
}

/// Provide all the players who are attending the given ladder night.
@riverpod
Future<List<TeamPlayer>> attendingTeamPlayers(
  final Ref ref,
  final int ladderNightId,
) async {
  final db = ref.watch(databaseProvider);
  final night = await ref.watch(ladderNightProvider(ladderNightId).future);
  final query =
      await (db.select(db.teamPlayers).join([
              leftOuterJoin(
                db.ladderNightAbsences,
                db.teamPlayers.id.equalsExp(
                      db.ladderNightAbsences.teamPlayerId,
                    ) &
                    db.ladderNightAbsences.ladderNightId.equals(ladderNightId),
                useColumns: false,
              ),
            ])
            ..where(
              db.ladderNightAbsences.id.isNull() &
                  db.teamPlayers.teamId.equals(night.teamId),
            )
            ..orderBy([OrderingTerm.asc(db.teamPlayers.name)]))
          .get();
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
  final night = await ref.watch(ladderNightProvider(ladderNightId).future);
  final query =
      db.select(db.teamPlayers).join([
          leftOuterJoin(
            db.ladderNightAbsences,
            db.ladderNightAbsences.ladderNightId.equals(ladderNightId) &
                db.ladderNightAbsences.teamPlayerId.equalsExp(
                  db.teamPlayers.id,
                ),
          ),
        ])
        ..where(db.teamPlayers.teamId.equals(night.teamId))
        ..orderBy([
          OrderingTerm.desc(db.teamPlayers.points),
          OrderingTerm.asc(db.teamPlayers.name),
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
  final game = await ref.watch(gameProvider(gameId).future);
  final firstPlayer = await ref.watch(
    teamPlayerProvider(game.firstPlayerId).future,
  );
  final secondPlayer = await ref.watch(
    teamPlayerProvider(game.secondPlayerId).future,
  );
  return [firstPlayer, secondPlayer];
}

/// Provide the result of a given set.
@riverpod
Future<SetResults> setResults(final Ref ref, final int setId) async {
  final set = await ref.watch(gameSetProvider(setId).future);
  final points = await ref.watch(setPointsProvider(setId).future);
  final players = await ref.watch(gamePlayersProvider(set.gameId).future);
  final firstPlayer = players.first;
  final secondPlayer = players.last;
  final player1Points = getPoints(points, firstPlayer);
  final player2Points = getPoints(points, secondPlayer);
  final team = await ref.watch(showdownTeamProvider(firstPlayer.teamId).future);
  if (player1Points >= team.winningPoints &&
      (player1Points - player2Points) >= team.clearPoints) {
    return DecidedSetResults(
      winner: firstPlayer,
      winningPoints: player1Points,
      loser: secondPlayer,
      losingPoints: player2Points,
    );
  }
  if (player2Points >= team.winningPoints &&
      (player2Points - player1Points) >= team.clearPoints) {
    return DecidedSetResults(
      winner: secondPlayer,
      winningPoints: player2Points,
      loser: firstPlayer,
      losingPoints: player1Points,
    );
  }
  return const UndecidedSetResults();
}

/// Returns the possible points, organised by how often the given player has
/// scored them.
@riverpod
Future<List<({ShowdownPoint point, int score})>> showdownPointScores(
  final Ref ref,
  final int playerId,
) async {
  final database = ref.watch(databaseProvider);
  final setPointsTable = database.setPoints;
  final showdownPointsTable = database.showdownPoints;
  final player = await ref.watch(teamPlayerProvider(playerId).future);
  final countColumn = setPointsTable.id.count();
  final rows =
      await (database.selectOnly(showdownPointsTable)
            ..addColumns([
              showdownPointsTable.id,
              showdownPointsTable.name,
              showdownPointsTable.value,
              showdownPointsTable.endsPoint,
              showdownPointsTable.teamId,
              countColumn, // exposes the aggregate
            ])
            ..join([
              // LEFT JOIN so points with zero usage still appear with count = 0
              leftOuterJoin(
                setPointsTable,
                setPointsTable.pointId.equalsExp(showdownPointsTable.id) &
                    setPointsTable.playerId.equals(playerId),
              ),
            ])
            ..where(showdownPointsTable.teamId.equals(player.teamId))
            ..groupBy([showdownPointsTable.id])
            ..orderBy([
              OrderingTerm.desc(countColumn),
              OrderingTerm.asc(showdownPointsTable.name),
            ]))
          .get();

  return rows
      .map(
        (final row) => (
          point: ShowdownPoint(
            id: row.read(showdownPointsTable.id)!,
            name: row.read(showdownPointsTable.name)!,
            value: row.read(showdownPointsTable.value)!,
            endsPoint: row.read(showdownPointsTable.endsPoint)!,
            teamId: row.read(showdownPointsTable.teamId)!,
          ),
          score: row.read(countColumn) ?? 0,
        ),
      )
      .toList();
}

/// Provide all the games played by the given player.
@riverpod
Future<List<ShowdownGame>> playerGames(
  final Ref ref,
  final int playerId,
) async {
  final database = ref.watch(databaseProvider);
  return database.managers.showdownGames
      .filter(
        (final f) =>
            f.firstPlayerId.id.equals(playerId) |
            f.secondPlayerId.id.equals(playerId),
      )
      .orderBy((final o) => o.startAfter.desc())
      .get();
}

/// Provide the players, sorted by luck.
@riverpod
Future<List<(TeamPlayer, int?)>> luckyPlayers(
  final Ref ref,
  final int teamId,
) async {
  final db = ref.watch(databaseProvider);
  final games = db.showdownGames;
  final players = db.teamPlayers;
  final query = db.selectOnly(games)
    ..addColumns([
      players.id,
      players.name,
      players.createdAt,
      players.emailAddress,
      players.points,
    ])
    ..addColumns([games.id.count()])
    ..join([innerJoin(players, players.id.equalsExp(games.firstPlayerId))])
    ..where(games.wonToss.equals(true) & players.teamId.equals(teamId))
    ..groupBy([players.id, players.name]);
  final results = await query.get();
  return results.map((final row) {
    final player = TeamPlayer(
      id: row.read(players.id)!,
      name: row.read(players.name)!,
      createdAt: row.read(players.createdAt)!,
      emailAddress: row.read(players.emailAddress)!,
      points: row.read(players.points)!,
      teamId: teamId,
    );
    final tossWins = row.read(games.id.count());
    return (player, tossWins);
  }).toList();
}

/// Export all game sets for the given [teamId].
@riverpod
Future<List<GameContext>> gameContexts(final Ref ref, final int teamId) async {
  final games = await ref.watch(teamGamesProvider(teamId).future);
  final contexts = <GameContext>[];
  for (final game in games) {
    final sets = await ref.watch(gameSetsProvider(game.id).future);
    final players = await ref.watch(gamePlayersProvider(game.id).future);
    final setContexts = <GameSetContext>[];
    for (final set in sets) {
      final points = await ref.watch(setPointsProvider(set.id).future);
      setContexts.add(GameSetContext(gameSet: set, points: points));
    }
    contexts.add(
      GameContext(
        game: game,
        firstPlayer: players.first,
        secondPlayer: players.last,
        sets: setContexts,
      ),
    );
  }
  return contexts;
}
