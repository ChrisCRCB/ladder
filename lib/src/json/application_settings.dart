import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:ladder/ladder.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'application_settings.g.dart';

/// Application settings.
@JsonSerializable()
class ApplicationSettings {
  /// Create an instance.
  ApplicationSettings({this.fontSize = 24.0});

  /// Create an instance from a JSON object.
  factory ApplicationSettings.fromJson(final Map<String, dynamic> json) =>
      _$ApplicationSettingsFromJson(json);

  /// The size of the font to use in the application.
  double fontSize;

  /// Save the settings.
  Future<void> save(final WidgetRef ref) async {
    final source = jsonEncode(toJson());
    final preferences = SharedPreferencesAsync();
    await preferences.setString(applicationSettingsKey, source);
    ref.invalidate(applicationSettingsProvider);
  }

  /// Convert an instance to JSON.
  Map<String, dynamic> toJson() => _$ApplicationSettingsToJson(this);
}
