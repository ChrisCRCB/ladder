import 'package:drift/drift.dart';
import 'package:ladder/ladder.dart';

/// The showdown teams table.
class ShowdownTeams extends Table
    with IdMixin, NameMixin, CreatedAtMixin, EmailAddressMixin {
  /// The last time this team was accessed.
  late final lastAccessed = dateTime().withDefault(currentDateAndTime)();

  /// How many sessions should be taken into account when calculating stats.
  late final sessionsPerCycle = integer().withDefault(const Constant(6))();
}
