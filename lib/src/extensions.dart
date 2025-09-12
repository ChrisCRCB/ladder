import 'package:backstreets_widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ladder/ladder.dart';
import 'package:time/time.dart';

/// Useful extensions for [AsyncValue].
extension AsyncValueX<T> on AsyncValue<T> {
  /// A simple version of [when].
  Widget simpleWhen(final Widget Function(T data) data) => when(
    data: data,
    error: ErrorListView.withPositional,
    loading: LoadingWidget.new,
  );
}

/// Useful methods on [LadderNight]s.
extension LadderNightX on LadderNight {
  /// Get the start time of [game].
  DateTime getStartTime(final ShowdownGame game) =>
      createdAt.add(game.startAfter.minutes);
}

/// Useful methods for [ShowdownGame]s.
extension ShowdownGameX on ShowdownGame {
  /// Get the name of the coach at the given [coachNumber].
  String? getCoachName(final CoachNumber coachNumber) => switch (coachNumber) {
    CoachNumber.first => firstPlayerCoachName,
    CoachNumber.second => secondPlayerCoachName,
  };
}
