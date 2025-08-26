import 'package:drift/drift.dart';

/// Add an [id] column.
mixin IdMixin on Table {
  /// The primary key.
  IntColumn get id => integer().autoIncrement()();
}

/// Add a [name] column.
mixin NameMixin on Table {
  /// The name of this row.
  TextColumn get name => text().withLength(min: 1, max: 100)();
}

/// Add a [createdAt] column.
mixin CreatedAtMixin on Table {
  /// The date and time this row was created.
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}
