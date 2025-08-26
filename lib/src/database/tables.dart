import 'package:drift/drift.dart';

/// Add an [id] column.
mixin IdMixin on Table {
  /// The primary key.
  late final id = integer().autoIncrement()();
}

/// Add a [name] column.
mixin NameMixin on Table {
  /// The name of this row.
  late final name = text().withLength(min: 1, max: 100)();
}

/// Add a [createdAt] column.
mixin CreatedAtMixin on Table {
  /// The date and time this row was created.
  late final createdAt = dateTime().withDefault(currentDateAndTime)();
}

/// Add an [emailAddress] column.
mixin EmailAddressMixin on Table {
  /// The email address use.
  late final emailAddress = text()
      .withLength(min: 6, max: 100)
      .withDefault(const Constant('team@example.com'))();
}

/// Add a [teamId] column.
mixin TeamIdMixin on Table {
  /// The ID of the team.
  late final teamId = integer().references(
    ShowdownTeams,
    #id,
    onDelete: KeyAction.cascade,
  )();
}

/// The possible endings for game points.
///
/// Sensible defaults should be created with each new team.
class ShowdownPoints extends Table with IdMixin, NameMixin, TeamIdMixin {
  /// How many points this ending is worth.
  ///
  ///  If [value] is < 0, then this ending gives the points to the opponent.
  late final value = integer()();
}

/// The showdown teams table.
class ShowdownTeams extends Table
    with IdMixin, NameMixin, CreatedAtMixin, EmailAddressMixin {
  /// The last time this team was accessed.
  late final lastAccessed = dateTime().withDefault(currentDateAndTime)();

  /// How many sessions should be taken into account when calculating stats.
  late final sessionsPerCycle = integer().withDefault(const Constant(6))();
}

/// The team players table.
class TeamPlayers extends Table
    with IdMixin, NameMixin, CreatedAtMixin, EmailAddressMixin, TeamIdMixin {}
