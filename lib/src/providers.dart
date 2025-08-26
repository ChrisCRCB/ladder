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

/// Provide all players on a team.
@riverpod
Future<List<TeamPlayer>> teamPlayers(final Ref ref, final int teamId) {
  final database = ref.watch(databaseProvider);
  return database.managers.teamPlayers
      .filter((final f) => f.teamId.id.equals(teamId))
      .orderBy((final o) => o.name.asc())
      .get();
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

/// Provide the points for the given player.
@riverpod
Future<int> playerPoints(final Ref ref, final int playerId) async {
  final database = ref.watch(databaseProvider);
  final managers = database.managers;
  final player = await managers.teamPlayers
      .filter((final f) => f.id.equals(playerId))
      .getSingle();
  final team = await managers.showdownTeams
      .filter((final f) => f.id.equals(player.teamId))
      .getSingle();
  final recentNights = await managers.ladderNights
      .orderBy((final o) => o.createdAt.desc())
      .limit(team.sessionsPerCycle)
      .get();
  final nightIds = recentNights.map((final night) => night.id);
  final games = await managers.showdownGames
      .filter(
        (final f) =>
            f.firstPlayerId.id.equals(playerId) |
            f.secondPlayerId.id.equals(playerId),
      )
      .filter((final f) => f.ladderNightId.id.isIn(nightIds))
      .get();
  final points = await managers.gamePoints
      .filter((final f) => f.gameId.id.isIn(games.map((final game) => game.id)))
      .get();
  final showdownPoints = await managers.showdownPoints
      .filter((final f) => f.id.isIn(points.map((final point) => point.id)))
      .get();
  var playerPoints = 0;
  for (final point in points) {
    final showdownPoint = showdownPoints.firstWhere(
      (final p) => p.id == point.id,
    );
    if (point.playerId == playerId && showdownPoint.value > 0) {
      playerPoints += showdownPoint.value;
    } else if (point.playerId != playerId && showdownPoint.value < 0) {
      playerPoints += showdownPoint.value * -1;
    }
  }
  return playerPoints;
}
