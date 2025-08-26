// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $ShowdownTeamsTable extends ShowdownTeams
    with TableInfo<$ShowdownTeamsTable, ShowdownTeam> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ShowdownTeamsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 100,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _emailAddressMeta = const VerificationMeta(
    'emailAddress',
  );
  @override
  late final GeneratedColumn<String> emailAddress = GeneratedColumn<String>(
    'email_address',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 6,
      maxTextLength: 100,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('team@example.com'),
  );
  static const VerificationMeta _lastAccessedMeta = const VerificationMeta(
    'lastAccessed',
  );
  @override
  late final GeneratedColumn<DateTime> lastAccessed = GeneratedColumn<DateTime>(
    'last_accessed',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _sessionsPerCycleMeta = const VerificationMeta(
    'sessionsPerCycle',
  );
  @override
  late final GeneratedColumn<int> sessionsPerCycle = GeneratedColumn<int>(
    'sessions_per_cycle',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(6),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    createdAt,
    emailAddress,
    lastAccessed,
    sessionsPerCycle,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'showdown_teams';
  @override
  VerificationContext validateIntegrity(
    Insertable<ShowdownTeam> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('email_address')) {
      context.handle(
        _emailAddressMeta,
        emailAddress.isAcceptableOrUnknown(
          data['email_address']!,
          _emailAddressMeta,
        ),
      );
    }
    if (data.containsKey('last_accessed')) {
      context.handle(
        _lastAccessedMeta,
        lastAccessed.isAcceptableOrUnknown(
          data['last_accessed']!,
          _lastAccessedMeta,
        ),
      );
    }
    if (data.containsKey('sessions_per_cycle')) {
      context.handle(
        _sessionsPerCycleMeta,
        sessionsPerCycle.isAcceptableOrUnknown(
          data['sessions_per_cycle']!,
          _sessionsPerCycleMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ShowdownTeam map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ShowdownTeam(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      emailAddress: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}email_address'],
      )!,
      lastAccessed: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_accessed'],
      )!,
      sessionsPerCycle: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sessions_per_cycle'],
      )!,
    );
  }

  @override
  $ShowdownTeamsTable createAlias(String alias) {
    return $ShowdownTeamsTable(attachedDatabase, alias);
  }
}

class ShowdownTeam extends DataClass implements Insertable<ShowdownTeam> {
  /// The primary key.
  final int id;

  /// The name of this row.
  final String name;

  /// The date and time this row was created.
  final DateTime createdAt;

  /// The email address use.
  final String emailAddress;

  /// The last time this team was accessed.
  final DateTime lastAccessed;

  /// How many sessions should be taken into account when calculating stats.
  final int sessionsPerCycle;
  const ShowdownTeam({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.emailAddress,
    required this.lastAccessed,
    required this.sessionsPerCycle,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['email_address'] = Variable<String>(emailAddress);
    map['last_accessed'] = Variable<DateTime>(lastAccessed);
    map['sessions_per_cycle'] = Variable<int>(sessionsPerCycle);
    return map;
  }

  ShowdownTeamsCompanion toCompanion(bool nullToAbsent) {
    return ShowdownTeamsCompanion(
      id: Value(id),
      name: Value(name),
      createdAt: Value(createdAt),
      emailAddress: Value(emailAddress),
      lastAccessed: Value(lastAccessed),
      sessionsPerCycle: Value(sessionsPerCycle),
    );
  }

  factory ShowdownTeam.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ShowdownTeam(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      emailAddress: serializer.fromJson<String>(json['emailAddress']),
      lastAccessed: serializer.fromJson<DateTime>(json['lastAccessed']),
      sessionsPerCycle: serializer.fromJson<int>(json['sessionsPerCycle']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'emailAddress': serializer.toJson<String>(emailAddress),
      'lastAccessed': serializer.toJson<DateTime>(lastAccessed),
      'sessionsPerCycle': serializer.toJson<int>(sessionsPerCycle),
    };
  }

  ShowdownTeam copyWith({
    int? id,
    String? name,
    DateTime? createdAt,
    String? emailAddress,
    DateTime? lastAccessed,
    int? sessionsPerCycle,
  }) => ShowdownTeam(
    id: id ?? this.id,
    name: name ?? this.name,
    createdAt: createdAt ?? this.createdAt,
    emailAddress: emailAddress ?? this.emailAddress,
    lastAccessed: lastAccessed ?? this.lastAccessed,
    sessionsPerCycle: sessionsPerCycle ?? this.sessionsPerCycle,
  );
  ShowdownTeam copyWithCompanion(ShowdownTeamsCompanion data) {
    return ShowdownTeam(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      emailAddress: data.emailAddress.present
          ? data.emailAddress.value
          : this.emailAddress,
      lastAccessed: data.lastAccessed.present
          ? data.lastAccessed.value
          : this.lastAccessed,
      sessionsPerCycle: data.sessionsPerCycle.present
          ? data.sessionsPerCycle.value
          : this.sessionsPerCycle,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ShowdownTeam(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('createdAt: $createdAt, ')
          ..write('emailAddress: $emailAddress, ')
          ..write('lastAccessed: $lastAccessed, ')
          ..write('sessionsPerCycle: $sessionsPerCycle')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    createdAt,
    emailAddress,
    lastAccessed,
    sessionsPerCycle,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ShowdownTeam &&
          other.id == this.id &&
          other.name == this.name &&
          other.createdAt == this.createdAt &&
          other.emailAddress == this.emailAddress &&
          other.lastAccessed == this.lastAccessed &&
          other.sessionsPerCycle == this.sessionsPerCycle);
}

class ShowdownTeamsCompanion extends UpdateCompanion<ShowdownTeam> {
  final Value<int> id;
  final Value<String> name;
  final Value<DateTime> createdAt;
  final Value<String> emailAddress;
  final Value<DateTime> lastAccessed;
  final Value<int> sessionsPerCycle;
  const ShowdownTeamsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.emailAddress = const Value.absent(),
    this.lastAccessed = const Value.absent(),
    this.sessionsPerCycle = const Value.absent(),
  });
  ShowdownTeamsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.createdAt = const Value.absent(),
    this.emailAddress = const Value.absent(),
    this.lastAccessed = const Value.absent(),
    this.sessionsPerCycle = const Value.absent(),
  }) : name = Value(name);
  static Insertable<ShowdownTeam> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<DateTime>? createdAt,
    Expression<String>? emailAddress,
    Expression<DateTime>? lastAccessed,
    Expression<int>? sessionsPerCycle,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (createdAt != null) 'created_at': createdAt,
      if (emailAddress != null) 'email_address': emailAddress,
      if (lastAccessed != null) 'last_accessed': lastAccessed,
      if (sessionsPerCycle != null) 'sessions_per_cycle': sessionsPerCycle,
    });
  }

  ShowdownTeamsCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<DateTime>? createdAt,
    Value<String>? emailAddress,
    Value<DateTime>? lastAccessed,
    Value<int>? sessionsPerCycle,
  }) {
    return ShowdownTeamsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      createdAt: createdAt ?? this.createdAt,
      emailAddress: emailAddress ?? this.emailAddress,
      lastAccessed: lastAccessed ?? this.lastAccessed,
      sessionsPerCycle: sessionsPerCycle ?? this.sessionsPerCycle,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (emailAddress.present) {
      map['email_address'] = Variable<String>(emailAddress.value);
    }
    if (lastAccessed.present) {
      map['last_accessed'] = Variable<DateTime>(lastAccessed.value);
    }
    if (sessionsPerCycle.present) {
      map['sessions_per_cycle'] = Variable<int>(sessionsPerCycle.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ShowdownTeamsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('createdAt: $createdAt, ')
          ..write('emailAddress: $emailAddress, ')
          ..write('lastAccessed: $lastAccessed, ')
          ..write('sessionsPerCycle: $sessionsPerCycle')
          ..write(')'))
        .toString();
  }
}

class $ShowdownPointsTable extends ShowdownPoints
    with TableInfo<$ShowdownPointsTable, ShowdownPoint> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ShowdownPointsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 100,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _teamIdMeta = const VerificationMeta('teamId');
  @override
  late final GeneratedColumn<int> teamId = GeneratedColumn<int>(
    'team_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES showdown_teams (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<int> value = GeneratedColumn<int>(
    'value',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, name, teamId, value];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'showdown_points';
  @override
  VerificationContext validateIntegrity(
    Insertable<ShowdownPoint> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('team_id')) {
      context.handle(
        _teamIdMeta,
        teamId.isAcceptableOrUnknown(data['team_id']!, _teamIdMeta),
      );
    } else if (isInserting) {
      context.missing(_teamIdMeta);
    }
    if (data.containsKey('value')) {
      context.handle(
        _valueMeta,
        value.isAcceptableOrUnknown(data['value']!, _valueMeta),
      );
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ShowdownPoint map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ShowdownPoint(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      teamId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}team_id'],
      )!,
      value: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}value'],
      )!,
    );
  }

  @override
  $ShowdownPointsTable createAlias(String alias) {
    return $ShowdownPointsTable(attachedDatabase, alias);
  }
}

class ShowdownPoint extends DataClass implements Insertable<ShowdownPoint> {
  /// The primary key.
  final int id;

  /// The name of this row.
  final String name;

  /// The ID of the team.
  final int teamId;

  /// How many points this ending is worth.
  ///
  ///  If [value] is < 0, then this ending gives the points to the opponent.
  final int value;
  const ShowdownPoint({
    required this.id,
    required this.name,
    required this.teamId,
    required this.value,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['team_id'] = Variable<int>(teamId);
    map['value'] = Variable<int>(value);
    return map;
  }

  ShowdownPointsCompanion toCompanion(bool nullToAbsent) {
    return ShowdownPointsCompanion(
      id: Value(id),
      name: Value(name),
      teamId: Value(teamId),
      value: Value(value),
    );
  }

  factory ShowdownPoint.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ShowdownPoint(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      teamId: serializer.fromJson<int>(json['teamId']),
      value: serializer.fromJson<int>(json['value']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'teamId': serializer.toJson<int>(teamId),
      'value': serializer.toJson<int>(value),
    };
  }

  ShowdownPoint copyWith({int? id, String? name, int? teamId, int? value}) =>
      ShowdownPoint(
        id: id ?? this.id,
        name: name ?? this.name,
        teamId: teamId ?? this.teamId,
        value: value ?? this.value,
      );
  ShowdownPoint copyWithCompanion(ShowdownPointsCompanion data) {
    return ShowdownPoint(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      teamId: data.teamId.present ? data.teamId.value : this.teamId,
      value: data.value.present ? data.value.value : this.value,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ShowdownPoint(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('teamId: $teamId, ')
          ..write('value: $value')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, teamId, value);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ShowdownPoint &&
          other.id == this.id &&
          other.name == this.name &&
          other.teamId == this.teamId &&
          other.value == this.value);
}

class ShowdownPointsCompanion extends UpdateCompanion<ShowdownPoint> {
  final Value<int> id;
  final Value<String> name;
  final Value<int> teamId;
  final Value<int> value;
  const ShowdownPointsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.teamId = const Value.absent(),
    this.value = const Value.absent(),
  });
  ShowdownPointsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required int teamId,
    required int value,
  }) : name = Value(name),
       teamId = Value(teamId),
       value = Value(value);
  static Insertable<ShowdownPoint> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? teamId,
    Expression<int>? value,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (teamId != null) 'team_id': teamId,
      if (value != null) 'value': value,
    });
  }

  ShowdownPointsCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<int>? teamId,
    Value<int>? value,
  }) {
    return ShowdownPointsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      teamId: teamId ?? this.teamId,
      value: value ?? this.value,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (teamId.present) {
      map['team_id'] = Variable<int>(teamId.value);
    }
    if (value.present) {
      map['value'] = Variable<int>(value.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ShowdownPointsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('teamId: $teamId, ')
          ..write('value: $value')
          ..write(')'))
        .toString();
  }
}

class $TeamPlayersTable extends TeamPlayers
    with TableInfo<$TeamPlayersTable, TeamPlayer> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TeamPlayersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 100,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _emailAddressMeta = const VerificationMeta(
    'emailAddress',
  );
  @override
  late final GeneratedColumn<String> emailAddress = GeneratedColumn<String>(
    'email_address',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 6,
      maxTextLength: 100,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('team@example.com'),
  );
  static const VerificationMeta _teamIdMeta = const VerificationMeta('teamId');
  @override
  late final GeneratedColumn<int> teamId = GeneratedColumn<int>(
    'team_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES showdown_teams (id) ON DELETE CASCADE',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    createdAt,
    emailAddress,
    teamId,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'team_players';
  @override
  VerificationContext validateIntegrity(
    Insertable<TeamPlayer> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('email_address')) {
      context.handle(
        _emailAddressMeta,
        emailAddress.isAcceptableOrUnknown(
          data['email_address']!,
          _emailAddressMeta,
        ),
      );
    }
    if (data.containsKey('team_id')) {
      context.handle(
        _teamIdMeta,
        teamId.isAcceptableOrUnknown(data['team_id']!, _teamIdMeta),
      );
    } else if (isInserting) {
      context.missing(_teamIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TeamPlayer map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TeamPlayer(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      emailAddress: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}email_address'],
      )!,
      teamId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}team_id'],
      )!,
    );
  }

  @override
  $TeamPlayersTable createAlias(String alias) {
    return $TeamPlayersTable(attachedDatabase, alias);
  }
}

class TeamPlayer extends DataClass implements Insertable<TeamPlayer> {
  /// The primary key.
  final int id;

  /// The name of this row.
  final String name;

  /// The date and time this row was created.
  final DateTime createdAt;

  /// The email address use.
  final String emailAddress;

  /// The ID of the team.
  final int teamId;
  const TeamPlayer({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.emailAddress,
    required this.teamId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['email_address'] = Variable<String>(emailAddress);
    map['team_id'] = Variable<int>(teamId);
    return map;
  }

  TeamPlayersCompanion toCompanion(bool nullToAbsent) {
    return TeamPlayersCompanion(
      id: Value(id),
      name: Value(name),
      createdAt: Value(createdAt),
      emailAddress: Value(emailAddress),
      teamId: Value(teamId),
    );
  }

  factory TeamPlayer.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TeamPlayer(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      emailAddress: serializer.fromJson<String>(json['emailAddress']),
      teamId: serializer.fromJson<int>(json['teamId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'emailAddress': serializer.toJson<String>(emailAddress),
      'teamId': serializer.toJson<int>(teamId),
    };
  }

  TeamPlayer copyWith({
    int? id,
    String? name,
    DateTime? createdAt,
    String? emailAddress,
    int? teamId,
  }) => TeamPlayer(
    id: id ?? this.id,
    name: name ?? this.name,
    createdAt: createdAt ?? this.createdAt,
    emailAddress: emailAddress ?? this.emailAddress,
    teamId: teamId ?? this.teamId,
  );
  TeamPlayer copyWithCompanion(TeamPlayersCompanion data) {
    return TeamPlayer(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      emailAddress: data.emailAddress.present
          ? data.emailAddress.value
          : this.emailAddress,
      teamId: data.teamId.present ? data.teamId.value : this.teamId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TeamPlayer(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('createdAt: $createdAt, ')
          ..write('emailAddress: $emailAddress, ')
          ..write('teamId: $teamId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, createdAt, emailAddress, teamId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TeamPlayer &&
          other.id == this.id &&
          other.name == this.name &&
          other.createdAt == this.createdAt &&
          other.emailAddress == this.emailAddress &&
          other.teamId == this.teamId);
}

class TeamPlayersCompanion extends UpdateCompanion<TeamPlayer> {
  final Value<int> id;
  final Value<String> name;
  final Value<DateTime> createdAt;
  final Value<String> emailAddress;
  final Value<int> teamId;
  const TeamPlayersCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.emailAddress = const Value.absent(),
    this.teamId = const Value.absent(),
  });
  TeamPlayersCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.createdAt = const Value.absent(),
    this.emailAddress = const Value.absent(),
    required int teamId,
  }) : name = Value(name),
       teamId = Value(teamId);
  static Insertable<TeamPlayer> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<DateTime>? createdAt,
    Expression<String>? emailAddress,
    Expression<int>? teamId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (createdAt != null) 'created_at': createdAt,
      if (emailAddress != null) 'email_address': emailAddress,
      if (teamId != null) 'team_id': teamId,
    });
  }

  TeamPlayersCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<DateTime>? createdAt,
    Value<String>? emailAddress,
    Value<int>? teamId,
  }) {
    return TeamPlayersCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      createdAt: createdAt ?? this.createdAt,
      emailAddress: emailAddress ?? this.emailAddress,
      teamId: teamId ?? this.teamId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (emailAddress.present) {
      map['email_address'] = Variable<String>(emailAddress.value);
    }
    if (teamId.present) {
      map['team_id'] = Variable<int>(teamId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TeamPlayersCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('createdAt: $createdAt, ')
          ..write('emailAddress: $emailAddress, ')
          ..write('teamId: $teamId')
          ..write(')'))
        .toString();
  }
}

abstract class _$LadderDatabase extends GeneratedDatabase {
  _$LadderDatabase(QueryExecutor e) : super(e);
  $LadderDatabaseManager get managers => $LadderDatabaseManager(this);
  late final $ShowdownTeamsTable showdownTeams = $ShowdownTeamsTable(this);
  late final $ShowdownPointsTable showdownPoints = $ShowdownPointsTable(this);
  late final $TeamPlayersTable teamPlayers = $TeamPlayersTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    showdownTeams,
    showdownPoints,
    teamPlayers,
  ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules([
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'showdown_teams',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('showdown_points', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'showdown_teams',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('team_players', kind: UpdateKind.delete)],
    ),
  ]);
}

typedef $$ShowdownTeamsTableCreateCompanionBuilder =
    ShowdownTeamsCompanion Function({
      Value<int> id,
      required String name,
      Value<DateTime> createdAt,
      Value<String> emailAddress,
      Value<DateTime> lastAccessed,
      Value<int> sessionsPerCycle,
    });
typedef $$ShowdownTeamsTableUpdateCompanionBuilder =
    ShowdownTeamsCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<DateTime> createdAt,
      Value<String> emailAddress,
      Value<DateTime> lastAccessed,
      Value<int> sessionsPerCycle,
    });

final class $$ShowdownTeamsTableReferences
    extends
        BaseReferences<_$LadderDatabase, $ShowdownTeamsTable, ShowdownTeam> {
  $$ShowdownTeamsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<$ShowdownPointsTable, List<ShowdownPoint>>
  _showdownPointsRefsTable(_$LadderDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.showdownPoints,
        aliasName: $_aliasNameGenerator(
          db.showdownTeams.id,
          db.showdownPoints.teamId,
        ),
      );

  $$ShowdownPointsTableProcessedTableManager get showdownPointsRefs {
    final manager = $$ShowdownPointsTableTableManager(
      $_db,
      $_db.showdownPoints,
    ).filter((f) => f.teamId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_showdownPointsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$TeamPlayersTable, List<TeamPlayer>>
  _teamPlayersRefsTable(_$LadderDatabase db) => MultiTypedResultKey.fromTable(
    db.teamPlayers,
    aliasName: $_aliasNameGenerator(db.showdownTeams.id, db.teamPlayers.teamId),
  );

  $$TeamPlayersTableProcessedTableManager get teamPlayersRefs {
    final manager = $$TeamPlayersTableTableManager(
      $_db,
      $_db.teamPlayers,
    ).filter((f) => f.teamId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_teamPlayersRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ShowdownTeamsTableFilterComposer
    extends Composer<_$LadderDatabase, $ShowdownTeamsTable> {
  $$ShowdownTeamsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get emailAddress => $composableBuilder(
    column: $table.emailAddress,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastAccessed => $composableBuilder(
    column: $table.lastAccessed,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get sessionsPerCycle => $composableBuilder(
    column: $table.sessionsPerCycle,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> showdownPointsRefs(
    Expression<bool> Function($$ShowdownPointsTableFilterComposer f) f,
  ) {
    final $$ShowdownPointsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.showdownPoints,
      getReferencedColumn: (t) => t.teamId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ShowdownPointsTableFilterComposer(
            $db: $db,
            $table: $db.showdownPoints,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> teamPlayersRefs(
    Expression<bool> Function($$TeamPlayersTableFilterComposer f) f,
  ) {
    final $$TeamPlayersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.teamPlayers,
      getReferencedColumn: (t) => t.teamId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TeamPlayersTableFilterComposer(
            $db: $db,
            $table: $db.teamPlayers,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ShowdownTeamsTableOrderingComposer
    extends Composer<_$LadderDatabase, $ShowdownTeamsTable> {
  $$ShowdownTeamsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get emailAddress => $composableBuilder(
    column: $table.emailAddress,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastAccessed => $composableBuilder(
    column: $table.lastAccessed,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get sessionsPerCycle => $composableBuilder(
    column: $table.sessionsPerCycle,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ShowdownTeamsTableAnnotationComposer
    extends Composer<_$LadderDatabase, $ShowdownTeamsTable> {
  $$ShowdownTeamsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<String> get emailAddress => $composableBuilder(
    column: $table.emailAddress,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get lastAccessed => $composableBuilder(
    column: $table.lastAccessed,
    builder: (column) => column,
  );

  GeneratedColumn<int> get sessionsPerCycle => $composableBuilder(
    column: $table.sessionsPerCycle,
    builder: (column) => column,
  );

  Expression<T> showdownPointsRefs<T extends Object>(
    Expression<T> Function($$ShowdownPointsTableAnnotationComposer a) f,
  ) {
    final $$ShowdownPointsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.showdownPoints,
      getReferencedColumn: (t) => t.teamId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ShowdownPointsTableAnnotationComposer(
            $db: $db,
            $table: $db.showdownPoints,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> teamPlayersRefs<T extends Object>(
    Expression<T> Function($$TeamPlayersTableAnnotationComposer a) f,
  ) {
    final $$TeamPlayersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.teamPlayers,
      getReferencedColumn: (t) => t.teamId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TeamPlayersTableAnnotationComposer(
            $db: $db,
            $table: $db.teamPlayers,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ShowdownTeamsTableTableManager
    extends
        RootTableManager<
          _$LadderDatabase,
          $ShowdownTeamsTable,
          ShowdownTeam,
          $$ShowdownTeamsTableFilterComposer,
          $$ShowdownTeamsTableOrderingComposer,
          $$ShowdownTeamsTableAnnotationComposer,
          $$ShowdownTeamsTableCreateCompanionBuilder,
          $$ShowdownTeamsTableUpdateCompanionBuilder,
          (ShowdownTeam, $$ShowdownTeamsTableReferences),
          ShowdownTeam,
          PrefetchHooks Function({
            bool showdownPointsRefs,
            bool teamPlayersRefs,
          })
        > {
  $$ShowdownTeamsTableTableManager(
    _$LadderDatabase db,
    $ShowdownTeamsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ShowdownTeamsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ShowdownTeamsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ShowdownTeamsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<String> emailAddress = const Value.absent(),
                Value<DateTime> lastAccessed = const Value.absent(),
                Value<int> sessionsPerCycle = const Value.absent(),
              }) => ShowdownTeamsCompanion(
                id: id,
                name: name,
                createdAt: createdAt,
                emailAddress: emailAddress,
                lastAccessed: lastAccessed,
                sessionsPerCycle: sessionsPerCycle,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                Value<DateTime> createdAt = const Value.absent(),
                Value<String> emailAddress = const Value.absent(),
                Value<DateTime> lastAccessed = const Value.absent(),
                Value<int> sessionsPerCycle = const Value.absent(),
              }) => ShowdownTeamsCompanion.insert(
                id: id,
                name: name,
                createdAt: createdAt,
                emailAddress: emailAddress,
                lastAccessed: lastAccessed,
                sessionsPerCycle: sessionsPerCycle,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ShowdownTeamsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({showdownPointsRefs = false, teamPlayersRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (showdownPointsRefs) db.showdownPoints,
                    if (teamPlayersRefs) db.teamPlayers,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (showdownPointsRefs)
                        await $_getPrefetchedData<
                          ShowdownTeam,
                          $ShowdownTeamsTable,
                          ShowdownPoint
                        >(
                          currentTable: table,
                          referencedTable: $$ShowdownTeamsTableReferences
                              ._showdownPointsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ShowdownTeamsTableReferences(
                                db,
                                table,
                                p0,
                              ).showdownPointsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.teamId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (teamPlayersRefs)
                        await $_getPrefetchedData<
                          ShowdownTeam,
                          $ShowdownTeamsTable,
                          TeamPlayer
                        >(
                          currentTable: table,
                          referencedTable: $$ShowdownTeamsTableReferences
                              ._teamPlayersRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ShowdownTeamsTableReferences(
                                db,
                                table,
                                p0,
                              ).teamPlayersRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.teamId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$ShowdownTeamsTableProcessedTableManager =
    ProcessedTableManager<
      _$LadderDatabase,
      $ShowdownTeamsTable,
      ShowdownTeam,
      $$ShowdownTeamsTableFilterComposer,
      $$ShowdownTeamsTableOrderingComposer,
      $$ShowdownTeamsTableAnnotationComposer,
      $$ShowdownTeamsTableCreateCompanionBuilder,
      $$ShowdownTeamsTableUpdateCompanionBuilder,
      (ShowdownTeam, $$ShowdownTeamsTableReferences),
      ShowdownTeam,
      PrefetchHooks Function({bool showdownPointsRefs, bool teamPlayersRefs})
    >;
typedef $$ShowdownPointsTableCreateCompanionBuilder =
    ShowdownPointsCompanion Function({
      Value<int> id,
      required String name,
      required int teamId,
      required int value,
    });
typedef $$ShowdownPointsTableUpdateCompanionBuilder =
    ShowdownPointsCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<int> teamId,
      Value<int> value,
    });

final class $$ShowdownPointsTableReferences
    extends
        BaseReferences<_$LadderDatabase, $ShowdownPointsTable, ShowdownPoint> {
  $$ShowdownPointsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $ShowdownTeamsTable _teamIdTable(_$LadderDatabase db) =>
      db.showdownTeams.createAlias(
        $_aliasNameGenerator(db.showdownPoints.teamId, db.showdownTeams.id),
      );

  $$ShowdownTeamsTableProcessedTableManager get teamId {
    final $_column = $_itemColumn<int>('team_id')!;

    final manager = $$ShowdownTeamsTableTableManager(
      $_db,
      $_db.showdownTeams,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_teamIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ShowdownPointsTableFilterComposer
    extends Composer<_$LadderDatabase, $ShowdownPointsTable> {
  $$ShowdownPointsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnFilters(column),
  );

  $$ShowdownTeamsTableFilterComposer get teamId {
    final $$ShowdownTeamsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.teamId,
      referencedTable: $db.showdownTeams,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ShowdownTeamsTableFilterComposer(
            $db: $db,
            $table: $db.showdownTeams,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ShowdownPointsTableOrderingComposer
    extends Composer<_$LadderDatabase, $ShowdownPointsTable> {
  $$ShowdownPointsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnOrderings(column),
  );

  $$ShowdownTeamsTableOrderingComposer get teamId {
    final $$ShowdownTeamsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.teamId,
      referencedTable: $db.showdownTeams,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ShowdownTeamsTableOrderingComposer(
            $db: $db,
            $table: $db.showdownTeams,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ShowdownPointsTableAnnotationComposer
    extends Composer<_$LadderDatabase, $ShowdownPointsTable> {
  $$ShowdownPointsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get value =>
      $composableBuilder(column: $table.value, builder: (column) => column);

  $$ShowdownTeamsTableAnnotationComposer get teamId {
    final $$ShowdownTeamsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.teamId,
      referencedTable: $db.showdownTeams,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ShowdownTeamsTableAnnotationComposer(
            $db: $db,
            $table: $db.showdownTeams,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ShowdownPointsTableTableManager
    extends
        RootTableManager<
          _$LadderDatabase,
          $ShowdownPointsTable,
          ShowdownPoint,
          $$ShowdownPointsTableFilterComposer,
          $$ShowdownPointsTableOrderingComposer,
          $$ShowdownPointsTableAnnotationComposer,
          $$ShowdownPointsTableCreateCompanionBuilder,
          $$ShowdownPointsTableUpdateCompanionBuilder,
          (ShowdownPoint, $$ShowdownPointsTableReferences),
          ShowdownPoint,
          PrefetchHooks Function({bool teamId})
        > {
  $$ShowdownPointsTableTableManager(
    _$LadderDatabase db,
    $ShowdownPointsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ShowdownPointsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ShowdownPointsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ShowdownPointsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<int> teamId = const Value.absent(),
                Value<int> value = const Value.absent(),
              }) => ShowdownPointsCompanion(
                id: id,
                name: name,
                teamId: teamId,
                value: value,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required int teamId,
                required int value,
              }) => ShowdownPointsCompanion.insert(
                id: id,
                name: name,
                teamId: teamId,
                value: value,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ShowdownPointsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({teamId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (teamId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.teamId,
                                referencedTable: $$ShowdownPointsTableReferences
                                    ._teamIdTable(db),
                                referencedColumn:
                                    $$ShowdownPointsTableReferences
                                        ._teamIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$ShowdownPointsTableProcessedTableManager =
    ProcessedTableManager<
      _$LadderDatabase,
      $ShowdownPointsTable,
      ShowdownPoint,
      $$ShowdownPointsTableFilterComposer,
      $$ShowdownPointsTableOrderingComposer,
      $$ShowdownPointsTableAnnotationComposer,
      $$ShowdownPointsTableCreateCompanionBuilder,
      $$ShowdownPointsTableUpdateCompanionBuilder,
      (ShowdownPoint, $$ShowdownPointsTableReferences),
      ShowdownPoint,
      PrefetchHooks Function({bool teamId})
    >;
typedef $$TeamPlayersTableCreateCompanionBuilder =
    TeamPlayersCompanion Function({
      Value<int> id,
      required String name,
      Value<DateTime> createdAt,
      Value<String> emailAddress,
      required int teamId,
    });
typedef $$TeamPlayersTableUpdateCompanionBuilder =
    TeamPlayersCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<DateTime> createdAt,
      Value<String> emailAddress,
      Value<int> teamId,
    });

final class $$TeamPlayersTableReferences
    extends BaseReferences<_$LadderDatabase, $TeamPlayersTable, TeamPlayer> {
  $$TeamPlayersTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $ShowdownTeamsTable _teamIdTable(_$LadderDatabase db) =>
      db.showdownTeams.createAlias(
        $_aliasNameGenerator(db.teamPlayers.teamId, db.showdownTeams.id),
      );

  $$ShowdownTeamsTableProcessedTableManager get teamId {
    final $_column = $_itemColumn<int>('team_id')!;

    final manager = $$ShowdownTeamsTableTableManager(
      $_db,
      $_db.showdownTeams,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_teamIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$TeamPlayersTableFilterComposer
    extends Composer<_$LadderDatabase, $TeamPlayersTable> {
  $$TeamPlayersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get emailAddress => $composableBuilder(
    column: $table.emailAddress,
    builder: (column) => ColumnFilters(column),
  );

  $$ShowdownTeamsTableFilterComposer get teamId {
    final $$ShowdownTeamsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.teamId,
      referencedTable: $db.showdownTeams,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ShowdownTeamsTableFilterComposer(
            $db: $db,
            $table: $db.showdownTeams,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TeamPlayersTableOrderingComposer
    extends Composer<_$LadderDatabase, $TeamPlayersTable> {
  $$TeamPlayersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get emailAddress => $composableBuilder(
    column: $table.emailAddress,
    builder: (column) => ColumnOrderings(column),
  );

  $$ShowdownTeamsTableOrderingComposer get teamId {
    final $$ShowdownTeamsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.teamId,
      referencedTable: $db.showdownTeams,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ShowdownTeamsTableOrderingComposer(
            $db: $db,
            $table: $db.showdownTeams,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TeamPlayersTableAnnotationComposer
    extends Composer<_$LadderDatabase, $TeamPlayersTable> {
  $$TeamPlayersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<String> get emailAddress => $composableBuilder(
    column: $table.emailAddress,
    builder: (column) => column,
  );

  $$ShowdownTeamsTableAnnotationComposer get teamId {
    final $$ShowdownTeamsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.teamId,
      referencedTable: $db.showdownTeams,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ShowdownTeamsTableAnnotationComposer(
            $db: $db,
            $table: $db.showdownTeams,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TeamPlayersTableTableManager
    extends
        RootTableManager<
          _$LadderDatabase,
          $TeamPlayersTable,
          TeamPlayer,
          $$TeamPlayersTableFilterComposer,
          $$TeamPlayersTableOrderingComposer,
          $$TeamPlayersTableAnnotationComposer,
          $$TeamPlayersTableCreateCompanionBuilder,
          $$TeamPlayersTableUpdateCompanionBuilder,
          (TeamPlayer, $$TeamPlayersTableReferences),
          TeamPlayer,
          PrefetchHooks Function({bool teamId})
        > {
  $$TeamPlayersTableTableManager(_$LadderDatabase db, $TeamPlayersTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TeamPlayersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TeamPlayersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TeamPlayersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<String> emailAddress = const Value.absent(),
                Value<int> teamId = const Value.absent(),
              }) => TeamPlayersCompanion(
                id: id,
                name: name,
                createdAt: createdAt,
                emailAddress: emailAddress,
                teamId: teamId,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                Value<DateTime> createdAt = const Value.absent(),
                Value<String> emailAddress = const Value.absent(),
                required int teamId,
              }) => TeamPlayersCompanion.insert(
                id: id,
                name: name,
                createdAt: createdAt,
                emailAddress: emailAddress,
                teamId: teamId,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$TeamPlayersTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({teamId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (teamId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.teamId,
                                referencedTable: $$TeamPlayersTableReferences
                                    ._teamIdTable(db),
                                referencedColumn: $$TeamPlayersTableReferences
                                    ._teamIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$TeamPlayersTableProcessedTableManager =
    ProcessedTableManager<
      _$LadderDatabase,
      $TeamPlayersTable,
      TeamPlayer,
      $$TeamPlayersTableFilterComposer,
      $$TeamPlayersTableOrderingComposer,
      $$TeamPlayersTableAnnotationComposer,
      $$TeamPlayersTableCreateCompanionBuilder,
      $$TeamPlayersTableUpdateCompanionBuilder,
      (TeamPlayer, $$TeamPlayersTableReferences),
      TeamPlayer,
      PrefetchHooks Function({bool teamId})
    >;

class $LadderDatabaseManager {
  final _$LadderDatabase _db;
  $LadderDatabaseManager(this._db);
  $$ShowdownTeamsTableTableManager get showdownTeams =>
      $$ShowdownTeamsTableTableManager(_db, _db.showdownTeams);
  $$ShowdownPointsTableTableManager get showdownPoints =>
      $$ShowdownPointsTableTableManager(_db, _db.showdownPoints);
  $$TeamPlayersTableTableManager get teamPlayers =>
      $$TeamPlayersTableTableManager(_db, _db.teamPlayers);
}
