import 'dart:convert';

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
