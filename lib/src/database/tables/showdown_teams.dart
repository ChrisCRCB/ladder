import 'package:drift/drift.dart';
import 'package:ladder/src/database/tables/_tables.dart';

/// The showdown teams table.
class ShowdownTeams extends Table with IdMixin, NameMixin, CreatedAtMixin {
  /// The last time this team was accessed.
  DateTimeColumn get lastAccessed =>
      dateTime().withDefault(currentDateAndTime)();

  /// The email address to send notifications from.
  TextColumn get emailAddress => text()
      .withLength(min: 6, max: 100)
      .withDefault(const Constant('team@example.com'))();

  /// How many sessions should be taken into account when calculating stats.
  IntColumn get sessionsPerCycle => integer().withDefault(const Constant(6))();
}
