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
