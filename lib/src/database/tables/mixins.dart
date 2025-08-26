import 'package:drift/drift.dart';
import 'package:ladder/ladder.dart';

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
