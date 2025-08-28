import 'package:ladder/ladder.dart';

/// A class which shows player attendance.
class PlayerAttendance {
  /// Create an instance.
  const PlayerAttendance({required this.player, required this.absence});

  /// The player in question.
  final TeamPlayer player;

  /// Whether [player] will be absent.
  final LadderNightAbsence? absence;
}
