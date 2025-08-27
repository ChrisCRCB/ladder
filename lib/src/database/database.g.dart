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
  static const VerificationMeta _pointsMeta = const VerificationMeta('points');
  @override
  late final GeneratedColumn<int> points = GeneratedColumn<int>(
    'points',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    createdAt,
    emailAddress,
    teamId,
    points,
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
    if (data.containsKey('points')) {
      context.handle(
        _pointsMeta,
        points.isAcceptableOrUnknown(data['points']!, _pointsMeta),
      );
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
      points: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}points'],
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

  /// How many points this player has.
  final int points;
  const TeamPlayer({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.emailAddress,
    required this.teamId,
    required this.points,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['email_address'] = Variable<String>(emailAddress);
    map['team_id'] = Variable<int>(teamId);
    map['points'] = Variable<int>(points);
    return map;
  }

  TeamPlayersCompanion toCompanion(bool nullToAbsent) {
    return TeamPlayersCompanion(
      id: Value(id),
      name: Value(name),
      createdAt: Value(createdAt),
      emailAddress: Value(emailAddress),
      teamId: Value(teamId),
      points: Value(points),
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
      points: serializer.fromJson<int>(json['points']),
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
      'points': serializer.toJson<int>(points),
    };
  }

  TeamPlayer copyWith({
    int? id,
    String? name,
    DateTime? createdAt,
    String? emailAddress,
    int? teamId,
    int? points,
  }) => TeamPlayer(
    id: id ?? this.id,
    name: name ?? this.name,
    createdAt: createdAt ?? this.createdAt,
    emailAddress: emailAddress ?? this.emailAddress,
    teamId: teamId ?? this.teamId,
    points: points ?? this.points,
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
      points: data.points.present ? data.points.value : this.points,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TeamPlayer(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('createdAt: $createdAt, ')
          ..write('emailAddress: $emailAddress, ')
          ..write('teamId: $teamId, ')
          ..write('points: $points')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, createdAt, emailAddress, teamId, points);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TeamPlayer &&
          other.id == this.id &&
          other.name == this.name &&
          other.createdAt == this.createdAt &&
          other.emailAddress == this.emailAddress &&
          other.teamId == this.teamId &&
          other.points == this.points);
}

class TeamPlayersCompanion extends UpdateCompanion<TeamPlayer> {
  final Value<int> id;
  final Value<String> name;
  final Value<DateTime> createdAt;
  final Value<String> emailAddress;
  final Value<int> teamId;
  final Value<int> points;
  const TeamPlayersCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.emailAddress = const Value.absent(),
    this.teamId = const Value.absent(),
    this.points = const Value.absent(),
  });
  TeamPlayersCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.createdAt = const Value.absent(),
    this.emailAddress = const Value.absent(),
    required int teamId,
    this.points = const Value.absent(),
  }) : name = Value(name),
       teamId = Value(teamId);
  static Insertable<TeamPlayer> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<DateTime>? createdAt,
    Expression<String>? emailAddress,
    Expression<int>? teamId,
    Expression<int>? points,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (createdAt != null) 'created_at': createdAt,
      if (emailAddress != null) 'email_address': emailAddress,
      if (teamId != null) 'team_id': teamId,
      if (points != null) 'points': points,
    });
  }

  TeamPlayersCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<DateTime>? createdAt,
    Value<String>? emailAddress,
    Value<int>? teamId,
    Value<int>? points,
  }) {
    return TeamPlayersCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      createdAt: createdAt ?? this.createdAt,
      emailAddress: emailAddress ?? this.emailAddress,
      teamId: teamId ?? this.teamId,
      points: points ?? this.points,
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
    if (points.present) {
      map['points'] = Variable<int>(points.value);
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
          ..write('teamId: $teamId, ')
          ..write('points: $points')
          ..write(')'))
        .toString();
  }
}

class $LadderNightsTable extends LadderNights
    with TableInfo<$LadderNightsTable, LadderNight> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LadderNightsTable(this.attachedDatabase, [this._alias]);
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
  List<GeneratedColumn> get $columns => [id, createdAt, teamId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'ladder_nights';
  @override
  VerificationContext validateIntegrity(
    Insertable<LadderNight> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
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
  LadderNight map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LadderNight(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      teamId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}team_id'],
      )!,
    );
  }

  @override
  $LadderNightsTable createAlias(String alias) {
    return $LadderNightsTable(attachedDatabase, alias);
  }
}

class LadderNight extends DataClass implements Insertable<LadderNight> {
  /// The primary key.
  final int id;

  /// The date and time this row was created.
  final DateTime createdAt;

  /// The ID of the team.
  final int teamId;
  const LadderNight({
    required this.id,
    required this.createdAt,
    required this.teamId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['team_id'] = Variable<int>(teamId);
    return map;
  }

  LadderNightsCompanion toCompanion(bool nullToAbsent) {
    return LadderNightsCompanion(
      id: Value(id),
      createdAt: Value(createdAt),
      teamId: Value(teamId),
    );
  }

  factory LadderNight.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LadderNight(
      id: serializer.fromJson<int>(json['id']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      teamId: serializer.fromJson<int>(json['teamId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'teamId': serializer.toJson<int>(teamId),
    };
  }

  LadderNight copyWith({int? id, DateTime? createdAt, int? teamId}) =>
      LadderNight(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        teamId: teamId ?? this.teamId,
      );
  LadderNight copyWithCompanion(LadderNightsCompanion data) {
    return LadderNight(
      id: data.id.present ? data.id.value : this.id,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      teamId: data.teamId.present ? data.teamId.value : this.teamId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LadderNight(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('teamId: $teamId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, createdAt, teamId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LadderNight &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.teamId == this.teamId);
}

class LadderNightsCompanion extends UpdateCompanion<LadderNight> {
  final Value<int> id;
  final Value<DateTime> createdAt;
  final Value<int> teamId;
  const LadderNightsCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.teamId = const Value.absent(),
  });
  LadderNightsCompanion.insert({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    required int teamId,
  }) : teamId = Value(teamId);
  static Insertable<LadderNight> custom({
    Expression<int>? id,
    Expression<DateTime>? createdAt,
    Expression<int>? teamId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (teamId != null) 'team_id': teamId,
    });
  }

  LadderNightsCompanion copyWith({
    Value<int>? id,
    Value<DateTime>? createdAt,
    Value<int>? teamId,
  }) {
    return LadderNightsCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      teamId: teamId ?? this.teamId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (teamId.present) {
      map['team_id'] = Variable<int>(teamId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LadderNightsCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('teamId: $teamId')
          ..write(')'))
        .toString();
  }
}

class $ShowdownGamesTable extends ShowdownGames
    with TableInfo<$ShowdownGamesTable, ShowdownGame> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ShowdownGamesTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _ladderNightIdMeta = const VerificationMeta(
    'ladderNightId',
  );
  @override
  late final GeneratedColumn<int> ladderNightId = GeneratedColumn<int>(
    'ladder_night_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES ladder_nights (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _firstPlayerIdMeta = const VerificationMeta(
    'firstPlayerId',
  );
  @override
  late final GeneratedColumn<int> firstPlayerId = GeneratedColumn<int>(
    'first_player_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES team_players (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _secondPlayerIdMeta = const VerificationMeta(
    'secondPlayerId',
  );
  @override
  late final GeneratedColumn<int> secondPlayerId = GeneratedColumn<int>(
    'second_player_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES team_players (id) ON DELETE CASCADE',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    ladderNightId,
    firstPlayerId,
    secondPlayerId,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'showdown_games';
  @override
  VerificationContext validateIntegrity(
    Insertable<ShowdownGame> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('ladder_night_id')) {
      context.handle(
        _ladderNightIdMeta,
        ladderNightId.isAcceptableOrUnknown(
          data['ladder_night_id']!,
          _ladderNightIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_ladderNightIdMeta);
    }
    if (data.containsKey('first_player_id')) {
      context.handle(
        _firstPlayerIdMeta,
        firstPlayerId.isAcceptableOrUnknown(
          data['first_player_id']!,
          _firstPlayerIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_firstPlayerIdMeta);
    }
    if (data.containsKey('second_player_id')) {
      context.handle(
        _secondPlayerIdMeta,
        secondPlayerId.isAcceptableOrUnknown(
          data['second_player_id']!,
          _secondPlayerIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_secondPlayerIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ShowdownGame map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ShowdownGame(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      ladderNightId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}ladder_night_id'],
      )!,
      firstPlayerId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}first_player_id'],
      )!,
      secondPlayerId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}second_player_id'],
      )!,
    );
  }

  @override
  $ShowdownGamesTable createAlias(String alias) {
    return $ShowdownGamesTable(attachedDatabase, alias);
  }
}

class ShowdownGame extends DataClass implements Insertable<ShowdownGame> {
  /// The primary key.
  final int id;

  /// The ID of the night this game belongs to.
  final int ladderNightId;

  /// The ID of the first player.
  ///
  /// The first player is the one who initiated the challenge.
  final int firstPlayerId;

  /// The ID of the second player.
  final int secondPlayerId;
  const ShowdownGame({
    required this.id,
    required this.ladderNightId,
    required this.firstPlayerId,
    required this.secondPlayerId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['ladder_night_id'] = Variable<int>(ladderNightId);
    map['first_player_id'] = Variable<int>(firstPlayerId);
    map['second_player_id'] = Variable<int>(secondPlayerId);
    return map;
  }

  ShowdownGamesCompanion toCompanion(bool nullToAbsent) {
    return ShowdownGamesCompanion(
      id: Value(id),
      ladderNightId: Value(ladderNightId),
      firstPlayerId: Value(firstPlayerId),
      secondPlayerId: Value(secondPlayerId),
    );
  }

  factory ShowdownGame.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ShowdownGame(
      id: serializer.fromJson<int>(json['id']),
      ladderNightId: serializer.fromJson<int>(json['ladderNightId']),
      firstPlayerId: serializer.fromJson<int>(json['firstPlayerId']),
      secondPlayerId: serializer.fromJson<int>(json['secondPlayerId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'ladderNightId': serializer.toJson<int>(ladderNightId),
      'firstPlayerId': serializer.toJson<int>(firstPlayerId),
      'secondPlayerId': serializer.toJson<int>(secondPlayerId),
    };
  }

  ShowdownGame copyWith({
    int? id,
    int? ladderNightId,
    int? firstPlayerId,
    int? secondPlayerId,
  }) => ShowdownGame(
    id: id ?? this.id,
    ladderNightId: ladderNightId ?? this.ladderNightId,
    firstPlayerId: firstPlayerId ?? this.firstPlayerId,
    secondPlayerId: secondPlayerId ?? this.secondPlayerId,
  );
  ShowdownGame copyWithCompanion(ShowdownGamesCompanion data) {
    return ShowdownGame(
      id: data.id.present ? data.id.value : this.id,
      ladderNightId: data.ladderNightId.present
          ? data.ladderNightId.value
          : this.ladderNightId,
      firstPlayerId: data.firstPlayerId.present
          ? data.firstPlayerId.value
          : this.firstPlayerId,
      secondPlayerId: data.secondPlayerId.present
          ? data.secondPlayerId.value
          : this.secondPlayerId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ShowdownGame(')
          ..write('id: $id, ')
          ..write('ladderNightId: $ladderNightId, ')
          ..write('firstPlayerId: $firstPlayerId, ')
          ..write('secondPlayerId: $secondPlayerId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, ladderNightId, firstPlayerId, secondPlayerId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ShowdownGame &&
          other.id == this.id &&
          other.ladderNightId == this.ladderNightId &&
          other.firstPlayerId == this.firstPlayerId &&
          other.secondPlayerId == this.secondPlayerId);
}

class ShowdownGamesCompanion extends UpdateCompanion<ShowdownGame> {
  final Value<int> id;
  final Value<int> ladderNightId;
  final Value<int> firstPlayerId;
  final Value<int> secondPlayerId;
  const ShowdownGamesCompanion({
    this.id = const Value.absent(),
    this.ladderNightId = const Value.absent(),
    this.firstPlayerId = const Value.absent(),
    this.secondPlayerId = const Value.absent(),
  });
  ShowdownGamesCompanion.insert({
    this.id = const Value.absent(),
    required int ladderNightId,
    required int firstPlayerId,
    required int secondPlayerId,
  }) : ladderNightId = Value(ladderNightId),
       firstPlayerId = Value(firstPlayerId),
       secondPlayerId = Value(secondPlayerId);
  static Insertable<ShowdownGame> custom({
    Expression<int>? id,
    Expression<int>? ladderNightId,
    Expression<int>? firstPlayerId,
    Expression<int>? secondPlayerId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (ladderNightId != null) 'ladder_night_id': ladderNightId,
      if (firstPlayerId != null) 'first_player_id': firstPlayerId,
      if (secondPlayerId != null) 'second_player_id': secondPlayerId,
    });
  }

  ShowdownGamesCompanion copyWith({
    Value<int>? id,
    Value<int>? ladderNightId,
    Value<int>? firstPlayerId,
    Value<int>? secondPlayerId,
  }) {
    return ShowdownGamesCompanion(
      id: id ?? this.id,
      ladderNightId: ladderNightId ?? this.ladderNightId,
      firstPlayerId: firstPlayerId ?? this.firstPlayerId,
      secondPlayerId: secondPlayerId ?? this.secondPlayerId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (ladderNightId.present) {
      map['ladder_night_id'] = Variable<int>(ladderNightId.value);
    }
    if (firstPlayerId.present) {
      map['first_player_id'] = Variable<int>(firstPlayerId.value);
    }
    if (secondPlayerId.present) {
      map['second_player_id'] = Variable<int>(secondPlayerId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ShowdownGamesCompanion(')
          ..write('id: $id, ')
          ..write('ladderNightId: $ladderNightId, ')
          ..write('firstPlayerId: $firstPlayerId, ')
          ..write('secondPlayerId: $secondPlayerId')
          ..write(')'))
        .toString();
  }
}

class $ShowdownChallengesTable extends ShowdownChallenges
    with TableInfo<$ShowdownChallengesTable, ShowdownChallenge> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ShowdownChallengesTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _firstPlayerIdMeta = const VerificationMeta(
    'firstPlayerId',
  );
  @override
  late final GeneratedColumn<int> firstPlayerId = GeneratedColumn<int>(
    'first_player_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES team_players (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _secondPlayerIdMeta = const VerificationMeta(
    'secondPlayerId',
  );
  @override
  late final GeneratedColumn<int> secondPlayerId = GeneratedColumn<int>(
    'second_player_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES team_players (id) ON DELETE CASCADE',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    createdAt,
    firstPlayerId,
    secondPlayerId,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'showdown_challenges';
  @override
  VerificationContext validateIntegrity(
    Insertable<ShowdownChallenge> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('first_player_id')) {
      context.handle(
        _firstPlayerIdMeta,
        firstPlayerId.isAcceptableOrUnknown(
          data['first_player_id']!,
          _firstPlayerIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_firstPlayerIdMeta);
    }
    if (data.containsKey('second_player_id')) {
      context.handle(
        _secondPlayerIdMeta,
        secondPlayerId.isAcceptableOrUnknown(
          data['second_player_id']!,
          _secondPlayerIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_secondPlayerIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ShowdownChallenge map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ShowdownChallenge(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      firstPlayerId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}first_player_id'],
      )!,
      secondPlayerId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}second_player_id'],
      )!,
    );
  }

  @override
  $ShowdownChallengesTable createAlias(String alias) {
    return $ShowdownChallengesTable(attachedDatabase, alias);
  }
}

class ShowdownChallenge extends DataClass
    implements Insertable<ShowdownChallenge> {
  /// The primary key.
  final int id;

  /// The date and time this row was created.
  final DateTime createdAt;

  /// The ID of the first player.
  ///
  /// The first player is the one who initiated the challenge.
  final int firstPlayerId;

  /// The ID of the second player.
  final int secondPlayerId;
  const ShowdownChallenge({
    required this.id,
    required this.createdAt,
    required this.firstPlayerId,
    required this.secondPlayerId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['first_player_id'] = Variable<int>(firstPlayerId);
    map['second_player_id'] = Variable<int>(secondPlayerId);
    return map;
  }

  ShowdownChallengesCompanion toCompanion(bool nullToAbsent) {
    return ShowdownChallengesCompanion(
      id: Value(id),
      createdAt: Value(createdAt),
      firstPlayerId: Value(firstPlayerId),
      secondPlayerId: Value(secondPlayerId),
    );
  }

  factory ShowdownChallenge.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ShowdownChallenge(
      id: serializer.fromJson<int>(json['id']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      firstPlayerId: serializer.fromJson<int>(json['firstPlayerId']),
      secondPlayerId: serializer.fromJson<int>(json['secondPlayerId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'firstPlayerId': serializer.toJson<int>(firstPlayerId),
      'secondPlayerId': serializer.toJson<int>(secondPlayerId),
    };
  }

  ShowdownChallenge copyWith({
    int? id,
    DateTime? createdAt,
    int? firstPlayerId,
    int? secondPlayerId,
  }) => ShowdownChallenge(
    id: id ?? this.id,
    createdAt: createdAt ?? this.createdAt,
    firstPlayerId: firstPlayerId ?? this.firstPlayerId,
    secondPlayerId: secondPlayerId ?? this.secondPlayerId,
  );
  ShowdownChallenge copyWithCompanion(ShowdownChallengesCompanion data) {
    return ShowdownChallenge(
      id: data.id.present ? data.id.value : this.id,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      firstPlayerId: data.firstPlayerId.present
          ? data.firstPlayerId.value
          : this.firstPlayerId,
      secondPlayerId: data.secondPlayerId.present
          ? data.secondPlayerId.value
          : this.secondPlayerId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ShowdownChallenge(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('firstPlayerId: $firstPlayerId, ')
          ..write('secondPlayerId: $secondPlayerId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, createdAt, firstPlayerId, secondPlayerId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ShowdownChallenge &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.firstPlayerId == this.firstPlayerId &&
          other.secondPlayerId == this.secondPlayerId);
}

class ShowdownChallengesCompanion extends UpdateCompanion<ShowdownChallenge> {
  final Value<int> id;
  final Value<DateTime> createdAt;
  final Value<int> firstPlayerId;
  final Value<int> secondPlayerId;
  const ShowdownChallengesCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.firstPlayerId = const Value.absent(),
    this.secondPlayerId = const Value.absent(),
  });
  ShowdownChallengesCompanion.insert({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    required int firstPlayerId,
    required int secondPlayerId,
  }) : firstPlayerId = Value(firstPlayerId),
       secondPlayerId = Value(secondPlayerId);
  static Insertable<ShowdownChallenge> custom({
    Expression<int>? id,
    Expression<DateTime>? createdAt,
    Expression<int>? firstPlayerId,
    Expression<int>? secondPlayerId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (firstPlayerId != null) 'first_player_id': firstPlayerId,
      if (secondPlayerId != null) 'second_player_id': secondPlayerId,
    });
  }

  ShowdownChallengesCompanion copyWith({
    Value<int>? id,
    Value<DateTime>? createdAt,
    Value<int>? firstPlayerId,
    Value<int>? secondPlayerId,
  }) {
    return ShowdownChallengesCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      firstPlayerId: firstPlayerId ?? this.firstPlayerId,
      secondPlayerId: secondPlayerId ?? this.secondPlayerId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (firstPlayerId.present) {
      map['first_player_id'] = Variable<int>(firstPlayerId.value);
    }
    if (secondPlayerId.present) {
      map['second_player_id'] = Variable<int>(secondPlayerId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ShowdownChallengesCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('firstPlayerId: $firstPlayerId, ')
          ..write('secondPlayerId: $secondPlayerId')
          ..write(')'))
        .toString();
  }
}

class $GamePointsTable extends GamePoints
    with TableInfo<$GamePointsTable, GamePoint> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GamePointsTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _playerIdMeta = const VerificationMeta(
    'playerId',
  );
  @override
  late final GeneratedColumn<int> playerId = GeneratedColumn<int>(
    'player_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES team_players (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _gameIdMeta = const VerificationMeta('gameId');
  @override
  late final GeneratedColumn<int> gameId = GeneratedColumn<int>(
    'game_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES showdown_games (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _pointIdMeta = const VerificationMeta(
    'pointId',
  );
  @override
  late final GeneratedColumn<int> pointId = GeneratedColumn<int>(
    'point_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES showdown_points (id) ON DELETE CASCADE',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [id, playerId, gameId, pointId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'game_points';
  @override
  VerificationContext validateIntegrity(
    Insertable<GamePoint> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('player_id')) {
      context.handle(
        _playerIdMeta,
        playerId.isAcceptableOrUnknown(data['player_id']!, _playerIdMeta),
      );
    } else if (isInserting) {
      context.missing(_playerIdMeta);
    }
    if (data.containsKey('game_id')) {
      context.handle(
        _gameIdMeta,
        gameId.isAcceptableOrUnknown(data['game_id']!, _gameIdMeta),
      );
    } else if (isInserting) {
      context.missing(_gameIdMeta);
    }
    if (data.containsKey('point_id')) {
      context.handle(
        _pointIdMeta,
        pointId.isAcceptableOrUnknown(data['point_id']!, _pointIdMeta),
      );
    } else if (isInserting) {
      context.missing(_pointIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  GamePoint map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return GamePoint(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      playerId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}player_id'],
      )!,
      gameId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}game_id'],
      )!,
      pointId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}point_id'],
      )!,
    );
  }

  @override
  $GamePointsTable createAlias(String alias) {
    return $GamePointsTable(attachedDatabase, alias);
  }
}

class GamePoint extends DataClass implements Insertable<GamePoint> {
  /// The primary key.
  final int id;

  /// The ID of the player who was awarded the points.
  final int playerId;

  /// The ID of the game in which the points were awarded.
  final int gameId;

  /// The ID of the point that was awarded.
  final int pointId;
  const GamePoint({
    required this.id,
    required this.playerId,
    required this.gameId,
    required this.pointId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['player_id'] = Variable<int>(playerId);
    map['game_id'] = Variable<int>(gameId);
    map['point_id'] = Variable<int>(pointId);
    return map;
  }

  GamePointsCompanion toCompanion(bool nullToAbsent) {
    return GamePointsCompanion(
      id: Value(id),
      playerId: Value(playerId),
      gameId: Value(gameId),
      pointId: Value(pointId),
    );
  }

  factory GamePoint.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return GamePoint(
      id: serializer.fromJson<int>(json['id']),
      playerId: serializer.fromJson<int>(json['playerId']),
      gameId: serializer.fromJson<int>(json['gameId']),
      pointId: serializer.fromJson<int>(json['pointId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'playerId': serializer.toJson<int>(playerId),
      'gameId': serializer.toJson<int>(gameId),
      'pointId': serializer.toJson<int>(pointId),
    };
  }

  GamePoint copyWith({int? id, int? playerId, int? gameId, int? pointId}) =>
      GamePoint(
        id: id ?? this.id,
        playerId: playerId ?? this.playerId,
        gameId: gameId ?? this.gameId,
        pointId: pointId ?? this.pointId,
      );
  GamePoint copyWithCompanion(GamePointsCompanion data) {
    return GamePoint(
      id: data.id.present ? data.id.value : this.id,
      playerId: data.playerId.present ? data.playerId.value : this.playerId,
      gameId: data.gameId.present ? data.gameId.value : this.gameId,
      pointId: data.pointId.present ? data.pointId.value : this.pointId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('GamePoint(')
          ..write('id: $id, ')
          ..write('playerId: $playerId, ')
          ..write('gameId: $gameId, ')
          ..write('pointId: $pointId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, playerId, gameId, pointId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GamePoint &&
          other.id == this.id &&
          other.playerId == this.playerId &&
          other.gameId == this.gameId &&
          other.pointId == this.pointId);
}

class GamePointsCompanion extends UpdateCompanion<GamePoint> {
  final Value<int> id;
  final Value<int> playerId;
  final Value<int> gameId;
  final Value<int> pointId;
  const GamePointsCompanion({
    this.id = const Value.absent(),
    this.playerId = const Value.absent(),
    this.gameId = const Value.absent(),
    this.pointId = const Value.absent(),
  });
  GamePointsCompanion.insert({
    this.id = const Value.absent(),
    required int playerId,
    required int gameId,
    required int pointId,
  }) : playerId = Value(playerId),
       gameId = Value(gameId),
       pointId = Value(pointId);
  static Insertable<GamePoint> custom({
    Expression<int>? id,
    Expression<int>? playerId,
    Expression<int>? gameId,
    Expression<int>? pointId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (playerId != null) 'player_id': playerId,
      if (gameId != null) 'game_id': gameId,
      if (pointId != null) 'point_id': pointId,
    });
  }

  GamePointsCompanion copyWith({
    Value<int>? id,
    Value<int>? playerId,
    Value<int>? gameId,
    Value<int>? pointId,
  }) {
    return GamePointsCompanion(
      id: id ?? this.id,
      playerId: playerId ?? this.playerId,
      gameId: gameId ?? this.gameId,
      pointId: pointId ?? this.pointId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (playerId.present) {
      map['player_id'] = Variable<int>(playerId.value);
    }
    if (gameId.present) {
      map['game_id'] = Variable<int>(gameId.value);
    }
    if (pointId.present) {
      map['point_id'] = Variable<int>(pointId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GamePointsCompanion(')
          ..write('id: $id, ')
          ..write('playerId: $playerId, ')
          ..write('gameId: $gameId, ')
          ..write('pointId: $pointId')
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
  late final $LadderNightsTable ladderNights = $LadderNightsTable(this);
  late final $ShowdownGamesTable showdownGames = $ShowdownGamesTable(this);
  late final $ShowdownChallengesTable showdownChallenges =
      $ShowdownChallengesTable(this);
  late final $GamePointsTable gamePoints = $GamePointsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    showdownTeams,
    showdownPoints,
    teamPlayers,
    ladderNights,
    showdownGames,
    showdownChallenges,
    gamePoints,
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
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'showdown_teams',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('ladder_nights', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'ladder_nights',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('showdown_games', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'team_players',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('showdown_games', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'team_players',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('showdown_games', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'team_players',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('showdown_challenges', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'team_players',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('showdown_challenges', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'team_players',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('game_points', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'showdown_games',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('game_points', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'showdown_points',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('game_points', kind: UpdateKind.delete)],
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

  static MultiTypedResultKey<$LadderNightsTable, List<LadderNight>>
  _ladderNightsRefsTable(_$LadderDatabase db) => MultiTypedResultKey.fromTable(
    db.ladderNights,
    aliasName: $_aliasNameGenerator(
      db.showdownTeams.id,
      db.ladderNights.teamId,
    ),
  );

  $$LadderNightsTableProcessedTableManager get ladderNightsRefs {
    final manager = $$LadderNightsTableTableManager(
      $_db,
      $_db.ladderNights,
    ).filter((f) => f.teamId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_ladderNightsRefsTable($_db));
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

  Expression<bool> ladderNightsRefs(
    Expression<bool> Function($$LadderNightsTableFilterComposer f) f,
  ) {
    final $$LadderNightsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.ladderNights,
      getReferencedColumn: (t) => t.teamId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LadderNightsTableFilterComposer(
            $db: $db,
            $table: $db.ladderNights,
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

  Expression<T> ladderNightsRefs<T extends Object>(
    Expression<T> Function($$LadderNightsTableAnnotationComposer a) f,
  ) {
    final $$LadderNightsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.ladderNights,
      getReferencedColumn: (t) => t.teamId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LadderNightsTableAnnotationComposer(
            $db: $db,
            $table: $db.ladderNights,
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
            bool ladderNightsRefs,
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
              ({
                showdownPointsRefs = false,
                teamPlayersRefs = false,
                ladderNightsRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (showdownPointsRefs) db.showdownPoints,
                    if (teamPlayersRefs) db.teamPlayers,
                    if (ladderNightsRefs) db.ladderNights,
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
                      if (ladderNightsRefs)
                        await $_getPrefetchedData<
                          ShowdownTeam,
                          $ShowdownTeamsTable,
                          LadderNight
                        >(
                          currentTable: table,
                          referencedTable: $$ShowdownTeamsTableReferences
                              ._ladderNightsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ShowdownTeamsTableReferences(
                                db,
                                table,
                                p0,
                              ).ladderNightsRefs,
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
      PrefetchHooks Function({
        bool showdownPointsRefs,
        bool teamPlayersRefs,
        bool ladderNightsRefs,
      })
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

  static MultiTypedResultKey<$GamePointsTable, List<GamePoint>>
  _gamePointsRefsTable(_$LadderDatabase db) => MultiTypedResultKey.fromTable(
    db.gamePoints,
    aliasName: $_aliasNameGenerator(
      db.showdownPoints.id,
      db.gamePoints.pointId,
    ),
  );

  $$GamePointsTableProcessedTableManager get gamePointsRefs {
    final manager = $$GamePointsTableTableManager(
      $_db,
      $_db.gamePoints,
    ).filter((f) => f.pointId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_gamePointsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
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

  Expression<bool> gamePointsRefs(
    Expression<bool> Function($$GamePointsTableFilterComposer f) f,
  ) {
    final $$GamePointsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.gamePoints,
      getReferencedColumn: (t) => t.pointId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GamePointsTableFilterComposer(
            $db: $db,
            $table: $db.gamePoints,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
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

  Expression<T> gamePointsRefs<T extends Object>(
    Expression<T> Function($$GamePointsTableAnnotationComposer a) f,
  ) {
    final $$GamePointsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.gamePoints,
      getReferencedColumn: (t) => t.pointId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GamePointsTableAnnotationComposer(
            $db: $db,
            $table: $db.gamePoints,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
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
          PrefetchHooks Function({bool teamId, bool gamePointsRefs})
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
          prefetchHooksCallback: ({teamId = false, gamePointsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (gamePointsRefs) db.gamePoints],
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
                return [
                  if (gamePointsRefs)
                    await $_getPrefetchedData<
                      ShowdownPoint,
                      $ShowdownPointsTable,
                      GamePoint
                    >(
                      currentTable: table,
                      referencedTable: $$ShowdownPointsTableReferences
                          ._gamePointsRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$ShowdownPointsTableReferences(
                            db,
                            table,
                            p0,
                          ).gamePointsRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.pointId == item.id),
                      typedResults: items,
                    ),
                ];
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
      PrefetchHooks Function({bool teamId, bool gamePointsRefs})
    >;
typedef $$TeamPlayersTableCreateCompanionBuilder =
    TeamPlayersCompanion Function({
      Value<int> id,
      required String name,
      Value<DateTime> createdAt,
      Value<String> emailAddress,
      required int teamId,
      Value<int> points,
    });
typedef $$TeamPlayersTableUpdateCompanionBuilder =
    TeamPlayersCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<DateTime> createdAt,
      Value<String> emailAddress,
      Value<int> teamId,
      Value<int> points,
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

  static MultiTypedResultKey<$ShowdownGamesTable, List<ShowdownGame>>
  _gamesAsFirstPlayerTable(_$LadderDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.showdownGames,
        aliasName: $_aliasNameGenerator(
          db.teamPlayers.id,
          db.showdownGames.firstPlayerId,
        ),
      );

  $$ShowdownGamesTableProcessedTableManager get gamesAsFirstPlayer {
    final manager = $$ShowdownGamesTableTableManager(
      $_db,
      $_db.showdownGames,
    ).filter((f) => f.firstPlayerId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_gamesAsFirstPlayerTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$ShowdownGamesTable, List<ShowdownGame>>
  _gamesAsSecondPlayerTable(_$LadderDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.showdownGames,
        aliasName: $_aliasNameGenerator(
          db.teamPlayers.id,
          db.showdownGames.secondPlayerId,
        ),
      );

  $$ShowdownGamesTableProcessedTableManager get gamesAsSecondPlayer {
    final manager = $$ShowdownGamesTableTableManager(
      $_db,
      $_db.showdownGames,
    ).filter((f) => f.secondPlayerId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _gamesAsSecondPlayerTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$ShowdownChallengesTable, List<ShowdownChallenge>>
  _challengesAsFirstPlayerTable(_$LadderDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.showdownChallenges,
        aliasName: $_aliasNameGenerator(
          db.teamPlayers.id,
          db.showdownChallenges.firstPlayerId,
        ),
      );

  $$ShowdownChallengesTableProcessedTableManager get challengesAsFirstPlayer {
    final manager = $$ShowdownChallengesTableTableManager(
      $_db,
      $_db.showdownChallenges,
    ).filter((f) => f.firstPlayerId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _challengesAsFirstPlayerTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$ShowdownChallengesTable, List<ShowdownChallenge>>
  _challengesAsSecondPlayerTable(_$LadderDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.showdownChallenges,
        aliasName: $_aliasNameGenerator(
          db.teamPlayers.id,
          db.showdownChallenges.secondPlayerId,
        ),
      );

  $$ShowdownChallengesTableProcessedTableManager get challengesAsSecondPlayer {
    final manager = $$ShowdownChallengesTableTableManager(
      $_db,
      $_db.showdownChallenges,
    ).filter((f) => f.secondPlayerId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _challengesAsSecondPlayerTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$GamePointsTable, List<GamePoint>>
  _gamePointsRefsTable(_$LadderDatabase db) => MultiTypedResultKey.fromTable(
    db.gamePoints,
    aliasName: $_aliasNameGenerator(db.teamPlayers.id, db.gamePoints.playerId),
  );

  $$GamePointsTableProcessedTableManager get gamePointsRefs {
    final manager = $$GamePointsTableTableManager(
      $_db,
      $_db.gamePoints,
    ).filter((f) => f.playerId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_gamePointsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
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

  ColumnFilters<int> get points => $composableBuilder(
    column: $table.points,
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

  Expression<bool> gamesAsFirstPlayer(
    Expression<bool> Function($$ShowdownGamesTableFilterComposer f) f,
  ) {
    final $$ShowdownGamesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.showdownGames,
      getReferencedColumn: (t) => t.firstPlayerId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ShowdownGamesTableFilterComposer(
            $db: $db,
            $table: $db.showdownGames,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> gamesAsSecondPlayer(
    Expression<bool> Function($$ShowdownGamesTableFilterComposer f) f,
  ) {
    final $$ShowdownGamesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.showdownGames,
      getReferencedColumn: (t) => t.secondPlayerId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ShowdownGamesTableFilterComposer(
            $db: $db,
            $table: $db.showdownGames,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> challengesAsFirstPlayer(
    Expression<bool> Function($$ShowdownChallengesTableFilterComposer f) f,
  ) {
    final $$ShowdownChallengesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.showdownChallenges,
      getReferencedColumn: (t) => t.firstPlayerId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ShowdownChallengesTableFilterComposer(
            $db: $db,
            $table: $db.showdownChallenges,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> challengesAsSecondPlayer(
    Expression<bool> Function($$ShowdownChallengesTableFilterComposer f) f,
  ) {
    final $$ShowdownChallengesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.showdownChallenges,
      getReferencedColumn: (t) => t.secondPlayerId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ShowdownChallengesTableFilterComposer(
            $db: $db,
            $table: $db.showdownChallenges,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> gamePointsRefs(
    Expression<bool> Function($$GamePointsTableFilterComposer f) f,
  ) {
    final $$GamePointsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.gamePoints,
      getReferencedColumn: (t) => t.playerId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GamePointsTableFilterComposer(
            $db: $db,
            $table: $db.gamePoints,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
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

  ColumnOrderings<int> get points => $composableBuilder(
    column: $table.points,
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

  GeneratedColumn<int> get points =>
      $composableBuilder(column: $table.points, builder: (column) => column);

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

  Expression<T> gamesAsFirstPlayer<T extends Object>(
    Expression<T> Function($$ShowdownGamesTableAnnotationComposer a) f,
  ) {
    final $$ShowdownGamesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.showdownGames,
      getReferencedColumn: (t) => t.firstPlayerId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ShowdownGamesTableAnnotationComposer(
            $db: $db,
            $table: $db.showdownGames,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> gamesAsSecondPlayer<T extends Object>(
    Expression<T> Function($$ShowdownGamesTableAnnotationComposer a) f,
  ) {
    final $$ShowdownGamesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.showdownGames,
      getReferencedColumn: (t) => t.secondPlayerId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ShowdownGamesTableAnnotationComposer(
            $db: $db,
            $table: $db.showdownGames,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> challengesAsFirstPlayer<T extends Object>(
    Expression<T> Function($$ShowdownChallengesTableAnnotationComposer a) f,
  ) {
    final $$ShowdownChallengesTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.showdownChallenges,
          getReferencedColumn: (t) => t.firstPlayerId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ShowdownChallengesTableAnnotationComposer(
                $db: $db,
                $table: $db.showdownChallenges,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> challengesAsSecondPlayer<T extends Object>(
    Expression<T> Function($$ShowdownChallengesTableAnnotationComposer a) f,
  ) {
    final $$ShowdownChallengesTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.showdownChallenges,
          getReferencedColumn: (t) => t.secondPlayerId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ShowdownChallengesTableAnnotationComposer(
                $db: $db,
                $table: $db.showdownChallenges,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> gamePointsRefs<T extends Object>(
    Expression<T> Function($$GamePointsTableAnnotationComposer a) f,
  ) {
    final $$GamePointsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.gamePoints,
      getReferencedColumn: (t) => t.playerId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GamePointsTableAnnotationComposer(
            $db: $db,
            $table: $db.gamePoints,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
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
          PrefetchHooks Function({
            bool teamId,
            bool gamesAsFirstPlayer,
            bool gamesAsSecondPlayer,
            bool challengesAsFirstPlayer,
            bool challengesAsSecondPlayer,
            bool gamePointsRefs,
          })
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
                Value<int> points = const Value.absent(),
              }) => TeamPlayersCompanion(
                id: id,
                name: name,
                createdAt: createdAt,
                emailAddress: emailAddress,
                teamId: teamId,
                points: points,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                Value<DateTime> createdAt = const Value.absent(),
                Value<String> emailAddress = const Value.absent(),
                required int teamId,
                Value<int> points = const Value.absent(),
              }) => TeamPlayersCompanion.insert(
                id: id,
                name: name,
                createdAt: createdAt,
                emailAddress: emailAddress,
                teamId: teamId,
                points: points,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$TeamPlayersTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                teamId = false,
                gamesAsFirstPlayer = false,
                gamesAsSecondPlayer = false,
                challengesAsFirstPlayer = false,
                challengesAsSecondPlayer = false,
                gamePointsRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (gamesAsFirstPlayer) db.showdownGames,
                    if (gamesAsSecondPlayer) db.showdownGames,
                    if (challengesAsFirstPlayer) db.showdownChallenges,
                    if (challengesAsSecondPlayer) db.showdownChallenges,
                    if (gamePointsRefs) db.gamePoints,
                  ],
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
                                    referencedTable:
                                        $$TeamPlayersTableReferences
                                            ._teamIdTable(db),
                                    referencedColumn:
                                        $$TeamPlayersTableReferences
                                            ._teamIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (gamesAsFirstPlayer)
                        await $_getPrefetchedData<
                          TeamPlayer,
                          $TeamPlayersTable,
                          ShowdownGame
                        >(
                          currentTable: table,
                          referencedTable: $$TeamPlayersTableReferences
                              ._gamesAsFirstPlayerTable(db),
                          managerFromTypedResult: (p0) =>
                              $$TeamPlayersTableReferences(
                                db,
                                table,
                                p0,
                              ).gamesAsFirstPlayer,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.firstPlayerId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (gamesAsSecondPlayer)
                        await $_getPrefetchedData<
                          TeamPlayer,
                          $TeamPlayersTable,
                          ShowdownGame
                        >(
                          currentTable: table,
                          referencedTable: $$TeamPlayersTableReferences
                              ._gamesAsSecondPlayerTable(db),
                          managerFromTypedResult: (p0) =>
                              $$TeamPlayersTableReferences(
                                db,
                                table,
                                p0,
                              ).gamesAsSecondPlayer,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.secondPlayerId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (challengesAsFirstPlayer)
                        await $_getPrefetchedData<
                          TeamPlayer,
                          $TeamPlayersTable,
                          ShowdownChallenge
                        >(
                          currentTable: table,
                          referencedTable: $$TeamPlayersTableReferences
                              ._challengesAsFirstPlayerTable(db),
                          managerFromTypedResult: (p0) =>
                              $$TeamPlayersTableReferences(
                                db,
                                table,
                                p0,
                              ).challengesAsFirstPlayer,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.firstPlayerId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (challengesAsSecondPlayer)
                        await $_getPrefetchedData<
                          TeamPlayer,
                          $TeamPlayersTable,
                          ShowdownChallenge
                        >(
                          currentTable: table,
                          referencedTable: $$TeamPlayersTableReferences
                              ._challengesAsSecondPlayerTable(db),
                          managerFromTypedResult: (p0) =>
                              $$TeamPlayersTableReferences(
                                db,
                                table,
                                p0,
                              ).challengesAsSecondPlayer,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.secondPlayerId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (gamePointsRefs)
                        await $_getPrefetchedData<
                          TeamPlayer,
                          $TeamPlayersTable,
                          GamePoint
                        >(
                          currentTable: table,
                          referencedTable: $$TeamPlayersTableReferences
                              ._gamePointsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$TeamPlayersTableReferences(
                                db,
                                table,
                                p0,
                              ).gamePointsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.playerId == item.id,
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
      PrefetchHooks Function({
        bool teamId,
        bool gamesAsFirstPlayer,
        bool gamesAsSecondPlayer,
        bool challengesAsFirstPlayer,
        bool challengesAsSecondPlayer,
        bool gamePointsRefs,
      })
    >;
typedef $$LadderNightsTableCreateCompanionBuilder =
    LadderNightsCompanion Function({
      Value<int> id,
      Value<DateTime> createdAt,
      required int teamId,
    });
typedef $$LadderNightsTableUpdateCompanionBuilder =
    LadderNightsCompanion Function({
      Value<int> id,
      Value<DateTime> createdAt,
      Value<int> teamId,
    });

final class $$LadderNightsTableReferences
    extends BaseReferences<_$LadderDatabase, $LadderNightsTable, LadderNight> {
  $$LadderNightsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $ShowdownTeamsTable _teamIdTable(_$LadderDatabase db) =>
      db.showdownTeams.createAlias(
        $_aliasNameGenerator(db.ladderNights.teamId, db.showdownTeams.id),
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

  static MultiTypedResultKey<$ShowdownGamesTable, List<ShowdownGame>>
  _showdownGamesRefsTable(_$LadderDatabase db) => MultiTypedResultKey.fromTable(
    db.showdownGames,
    aliasName: $_aliasNameGenerator(
      db.ladderNights.id,
      db.showdownGames.ladderNightId,
    ),
  );

  $$ShowdownGamesTableProcessedTableManager get showdownGamesRefs {
    final manager = $$ShowdownGamesTableTableManager(
      $_db,
      $_db.showdownGames,
    ).filter((f) => f.ladderNightId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_showdownGamesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$LadderNightsTableFilterComposer
    extends Composer<_$LadderDatabase, $LadderNightsTable> {
  $$LadderNightsTableFilterComposer({
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

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
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

  Expression<bool> showdownGamesRefs(
    Expression<bool> Function($$ShowdownGamesTableFilterComposer f) f,
  ) {
    final $$ShowdownGamesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.showdownGames,
      getReferencedColumn: (t) => t.ladderNightId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ShowdownGamesTableFilterComposer(
            $db: $db,
            $table: $db.showdownGames,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$LadderNightsTableOrderingComposer
    extends Composer<_$LadderDatabase, $LadderNightsTable> {
  $$LadderNightsTableOrderingComposer({
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

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
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

class $$LadderNightsTableAnnotationComposer
    extends Composer<_$LadderDatabase, $LadderNightsTable> {
  $$LadderNightsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

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

  Expression<T> showdownGamesRefs<T extends Object>(
    Expression<T> Function($$ShowdownGamesTableAnnotationComposer a) f,
  ) {
    final $$ShowdownGamesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.showdownGames,
      getReferencedColumn: (t) => t.ladderNightId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ShowdownGamesTableAnnotationComposer(
            $db: $db,
            $table: $db.showdownGames,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$LadderNightsTableTableManager
    extends
        RootTableManager<
          _$LadderDatabase,
          $LadderNightsTable,
          LadderNight,
          $$LadderNightsTableFilterComposer,
          $$LadderNightsTableOrderingComposer,
          $$LadderNightsTableAnnotationComposer,
          $$LadderNightsTableCreateCompanionBuilder,
          $$LadderNightsTableUpdateCompanionBuilder,
          (LadderNight, $$LadderNightsTableReferences),
          LadderNight,
          PrefetchHooks Function({bool teamId, bool showdownGamesRefs})
        > {
  $$LadderNightsTableTableManager(_$LadderDatabase db, $LadderNightsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LadderNightsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LadderNightsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LadderNightsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> teamId = const Value.absent(),
              }) => LadderNightsCompanion(
                id: id,
                createdAt: createdAt,
                teamId: teamId,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                required int teamId,
              }) => LadderNightsCompanion.insert(
                id: id,
                createdAt: createdAt,
                teamId: teamId,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$LadderNightsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({teamId = false, showdownGamesRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (showdownGamesRefs) db.showdownGames,
              ],
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
                                referencedTable: $$LadderNightsTableReferences
                                    ._teamIdTable(db),
                                referencedColumn: $$LadderNightsTableReferences
                                    ._teamIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (showdownGamesRefs)
                    await $_getPrefetchedData<
                      LadderNight,
                      $LadderNightsTable,
                      ShowdownGame
                    >(
                      currentTable: table,
                      referencedTable: $$LadderNightsTableReferences
                          ._showdownGamesRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$LadderNightsTableReferences(
                            db,
                            table,
                            p0,
                          ).showdownGamesRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where(
                            (e) => e.ladderNightId == item.id,
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

typedef $$LadderNightsTableProcessedTableManager =
    ProcessedTableManager<
      _$LadderDatabase,
      $LadderNightsTable,
      LadderNight,
      $$LadderNightsTableFilterComposer,
      $$LadderNightsTableOrderingComposer,
      $$LadderNightsTableAnnotationComposer,
      $$LadderNightsTableCreateCompanionBuilder,
      $$LadderNightsTableUpdateCompanionBuilder,
      (LadderNight, $$LadderNightsTableReferences),
      LadderNight,
      PrefetchHooks Function({bool teamId, bool showdownGamesRefs})
    >;
typedef $$ShowdownGamesTableCreateCompanionBuilder =
    ShowdownGamesCompanion Function({
      Value<int> id,
      required int ladderNightId,
      required int firstPlayerId,
      required int secondPlayerId,
    });
typedef $$ShowdownGamesTableUpdateCompanionBuilder =
    ShowdownGamesCompanion Function({
      Value<int> id,
      Value<int> ladderNightId,
      Value<int> firstPlayerId,
      Value<int> secondPlayerId,
    });

final class $$ShowdownGamesTableReferences
    extends
        BaseReferences<_$LadderDatabase, $ShowdownGamesTable, ShowdownGame> {
  $$ShowdownGamesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $LadderNightsTable _ladderNightIdTable(_$LadderDatabase db) =>
      db.ladderNights.createAlias(
        $_aliasNameGenerator(
          db.showdownGames.ladderNightId,
          db.ladderNights.id,
        ),
      );

  $$LadderNightsTableProcessedTableManager get ladderNightId {
    final $_column = $_itemColumn<int>('ladder_night_id')!;

    final manager = $$LadderNightsTableTableManager(
      $_db,
      $_db.ladderNights,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_ladderNightIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $TeamPlayersTable _firstPlayerIdTable(_$LadderDatabase db) =>
      db.teamPlayers.createAlias(
        $_aliasNameGenerator(db.showdownGames.firstPlayerId, db.teamPlayers.id),
      );

  $$TeamPlayersTableProcessedTableManager get firstPlayerId {
    final $_column = $_itemColumn<int>('first_player_id')!;

    final manager = $$TeamPlayersTableTableManager(
      $_db,
      $_db.teamPlayers,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_firstPlayerIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $TeamPlayersTable _secondPlayerIdTable(_$LadderDatabase db) =>
      db.teamPlayers.createAlias(
        $_aliasNameGenerator(
          db.showdownGames.secondPlayerId,
          db.teamPlayers.id,
        ),
      );

  $$TeamPlayersTableProcessedTableManager get secondPlayerId {
    final $_column = $_itemColumn<int>('second_player_id')!;

    final manager = $$TeamPlayersTableTableManager(
      $_db,
      $_db.teamPlayers,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_secondPlayerIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$GamePointsTable, List<GamePoint>>
  _gamePointsRefsTable(_$LadderDatabase db) => MultiTypedResultKey.fromTable(
    db.gamePoints,
    aliasName: $_aliasNameGenerator(db.showdownGames.id, db.gamePoints.gameId),
  );

  $$GamePointsTableProcessedTableManager get gamePointsRefs {
    final manager = $$GamePointsTableTableManager(
      $_db,
      $_db.gamePoints,
    ).filter((f) => f.gameId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_gamePointsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ShowdownGamesTableFilterComposer
    extends Composer<_$LadderDatabase, $ShowdownGamesTable> {
  $$ShowdownGamesTableFilterComposer({
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

  $$LadderNightsTableFilterComposer get ladderNightId {
    final $$LadderNightsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.ladderNightId,
      referencedTable: $db.ladderNights,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LadderNightsTableFilterComposer(
            $db: $db,
            $table: $db.ladderNights,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$TeamPlayersTableFilterComposer get firstPlayerId {
    final $$TeamPlayersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.firstPlayerId,
      referencedTable: $db.teamPlayers,
      getReferencedColumn: (t) => t.id,
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
    return composer;
  }

  $$TeamPlayersTableFilterComposer get secondPlayerId {
    final $$TeamPlayersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.secondPlayerId,
      referencedTable: $db.teamPlayers,
      getReferencedColumn: (t) => t.id,
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
    return composer;
  }

  Expression<bool> gamePointsRefs(
    Expression<bool> Function($$GamePointsTableFilterComposer f) f,
  ) {
    final $$GamePointsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.gamePoints,
      getReferencedColumn: (t) => t.gameId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GamePointsTableFilterComposer(
            $db: $db,
            $table: $db.gamePoints,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ShowdownGamesTableOrderingComposer
    extends Composer<_$LadderDatabase, $ShowdownGamesTable> {
  $$ShowdownGamesTableOrderingComposer({
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

  $$LadderNightsTableOrderingComposer get ladderNightId {
    final $$LadderNightsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.ladderNightId,
      referencedTable: $db.ladderNights,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LadderNightsTableOrderingComposer(
            $db: $db,
            $table: $db.ladderNights,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$TeamPlayersTableOrderingComposer get firstPlayerId {
    final $$TeamPlayersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.firstPlayerId,
      referencedTable: $db.teamPlayers,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TeamPlayersTableOrderingComposer(
            $db: $db,
            $table: $db.teamPlayers,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$TeamPlayersTableOrderingComposer get secondPlayerId {
    final $$TeamPlayersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.secondPlayerId,
      referencedTable: $db.teamPlayers,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TeamPlayersTableOrderingComposer(
            $db: $db,
            $table: $db.teamPlayers,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ShowdownGamesTableAnnotationComposer
    extends Composer<_$LadderDatabase, $ShowdownGamesTable> {
  $$ShowdownGamesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  $$LadderNightsTableAnnotationComposer get ladderNightId {
    final $$LadderNightsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.ladderNightId,
      referencedTable: $db.ladderNights,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LadderNightsTableAnnotationComposer(
            $db: $db,
            $table: $db.ladderNights,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$TeamPlayersTableAnnotationComposer get firstPlayerId {
    final $$TeamPlayersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.firstPlayerId,
      referencedTable: $db.teamPlayers,
      getReferencedColumn: (t) => t.id,
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
    return composer;
  }

  $$TeamPlayersTableAnnotationComposer get secondPlayerId {
    final $$TeamPlayersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.secondPlayerId,
      referencedTable: $db.teamPlayers,
      getReferencedColumn: (t) => t.id,
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
    return composer;
  }

  Expression<T> gamePointsRefs<T extends Object>(
    Expression<T> Function($$GamePointsTableAnnotationComposer a) f,
  ) {
    final $$GamePointsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.gamePoints,
      getReferencedColumn: (t) => t.gameId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GamePointsTableAnnotationComposer(
            $db: $db,
            $table: $db.gamePoints,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ShowdownGamesTableTableManager
    extends
        RootTableManager<
          _$LadderDatabase,
          $ShowdownGamesTable,
          ShowdownGame,
          $$ShowdownGamesTableFilterComposer,
          $$ShowdownGamesTableOrderingComposer,
          $$ShowdownGamesTableAnnotationComposer,
          $$ShowdownGamesTableCreateCompanionBuilder,
          $$ShowdownGamesTableUpdateCompanionBuilder,
          (ShowdownGame, $$ShowdownGamesTableReferences),
          ShowdownGame,
          PrefetchHooks Function({
            bool ladderNightId,
            bool firstPlayerId,
            bool secondPlayerId,
            bool gamePointsRefs,
          })
        > {
  $$ShowdownGamesTableTableManager(
    _$LadderDatabase db,
    $ShowdownGamesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ShowdownGamesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ShowdownGamesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ShowdownGamesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> ladderNightId = const Value.absent(),
                Value<int> firstPlayerId = const Value.absent(),
                Value<int> secondPlayerId = const Value.absent(),
              }) => ShowdownGamesCompanion(
                id: id,
                ladderNightId: ladderNightId,
                firstPlayerId: firstPlayerId,
                secondPlayerId: secondPlayerId,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int ladderNightId,
                required int firstPlayerId,
                required int secondPlayerId,
              }) => ShowdownGamesCompanion.insert(
                id: id,
                ladderNightId: ladderNightId,
                firstPlayerId: firstPlayerId,
                secondPlayerId: secondPlayerId,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ShowdownGamesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                ladderNightId = false,
                firstPlayerId = false,
                secondPlayerId = false,
                gamePointsRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [if (gamePointsRefs) db.gamePoints],
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
                        if (ladderNightId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.ladderNightId,
                                    referencedTable:
                                        $$ShowdownGamesTableReferences
                                            ._ladderNightIdTable(db),
                                    referencedColumn:
                                        $$ShowdownGamesTableReferences
                                            ._ladderNightIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (firstPlayerId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.firstPlayerId,
                                    referencedTable:
                                        $$ShowdownGamesTableReferences
                                            ._firstPlayerIdTable(db),
                                    referencedColumn:
                                        $$ShowdownGamesTableReferences
                                            ._firstPlayerIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (secondPlayerId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.secondPlayerId,
                                    referencedTable:
                                        $$ShowdownGamesTableReferences
                                            ._secondPlayerIdTable(db),
                                    referencedColumn:
                                        $$ShowdownGamesTableReferences
                                            ._secondPlayerIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (gamePointsRefs)
                        await $_getPrefetchedData<
                          ShowdownGame,
                          $ShowdownGamesTable,
                          GamePoint
                        >(
                          currentTable: table,
                          referencedTable: $$ShowdownGamesTableReferences
                              ._gamePointsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ShowdownGamesTableReferences(
                                db,
                                table,
                                p0,
                              ).gamePointsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.gameId == item.id,
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

typedef $$ShowdownGamesTableProcessedTableManager =
    ProcessedTableManager<
      _$LadderDatabase,
      $ShowdownGamesTable,
      ShowdownGame,
      $$ShowdownGamesTableFilterComposer,
      $$ShowdownGamesTableOrderingComposer,
      $$ShowdownGamesTableAnnotationComposer,
      $$ShowdownGamesTableCreateCompanionBuilder,
      $$ShowdownGamesTableUpdateCompanionBuilder,
      (ShowdownGame, $$ShowdownGamesTableReferences),
      ShowdownGame,
      PrefetchHooks Function({
        bool ladderNightId,
        bool firstPlayerId,
        bool secondPlayerId,
        bool gamePointsRefs,
      })
    >;
typedef $$ShowdownChallengesTableCreateCompanionBuilder =
    ShowdownChallengesCompanion Function({
      Value<int> id,
      Value<DateTime> createdAt,
      required int firstPlayerId,
      required int secondPlayerId,
    });
typedef $$ShowdownChallengesTableUpdateCompanionBuilder =
    ShowdownChallengesCompanion Function({
      Value<int> id,
      Value<DateTime> createdAt,
      Value<int> firstPlayerId,
      Value<int> secondPlayerId,
    });

final class $$ShowdownChallengesTableReferences
    extends
        BaseReferences<
          _$LadderDatabase,
          $ShowdownChallengesTable,
          ShowdownChallenge
        > {
  $$ShowdownChallengesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $TeamPlayersTable _firstPlayerIdTable(_$LadderDatabase db) =>
      db.teamPlayers.createAlias(
        $_aliasNameGenerator(
          db.showdownChallenges.firstPlayerId,
          db.teamPlayers.id,
        ),
      );

  $$TeamPlayersTableProcessedTableManager get firstPlayerId {
    final $_column = $_itemColumn<int>('first_player_id')!;

    final manager = $$TeamPlayersTableTableManager(
      $_db,
      $_db.teamPlayers,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_firstPlayerIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $TeamPlayersTable _secondPlayerIdTable(_$LadderDatabase db) =>
      db.teamPlayers.createAlias(
        $_aliasNameGenerator(
          db.showdownChallenges.secondPlayerId,
          db.teamPlayers.id,
        ),
      );

  $$TeamPlayersTableProcessedTableManager get secondPlayerId {
    final $_column = $_itemColumn<int>('second_player_id')!;

    final manager = $$TeamPlayersTableTableManager(
      $_db,
      $_db.teamPlayers,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_secondPlayerIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ShowdownChallengesTableFilterComposer
    extends Composer<_$LadderDatabase, $ShowdownChallengesTable> {
  $$ShowdownChallengesTableFilterComposer({
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

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  $$TeamPlayersTableFilterComposer get firstPlayerId {
    final $$TeamPlayersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.firstPlayerId,
      referencedTable: $db.teamPlayers,
      getReferencedColumn: (t) => t.id,
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
    return composer;
  }

  $$TeamPlayersTableFilterComposer get secondPlayerId {
    final $$TeamPlayersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.secondPlayerId,
      referencedTable: $db.teamPlayers,
      getReferencedColumn: (t) => t.id,
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
    return composer;
  }
}

class $$ShowdownChallengesTableOrderingComposer
    extends Composer<_$LadderDatabase, $ShowdownChallengesTable> {
  $$ShowdownChallengesTableOrderingComposer({
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

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$TeamPlayersTableOrderingComposer get firstPlayerId {
    final $$TeamPlayersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.firstPlayerId,
      referencedTable: $db.teamPlayers,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TeamPlayersTableOrderingComposer(
            $db: $db,
            $table: $db.teamPlayers,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$TeamPlayersTableOrderingComposer get secondPlayerId {
    final $$TeamPlayersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.secondPlayerId,
      referencedTable: $db.teamPlayers,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TeamPlayersTableOrderingComposer(
            $db: $db,
            $table: $db.teamPlayers,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ShowdownChallengesTableAnnotationComposer
    extends Composer<_$LadderDatabase, $ShowdownChallengesTable> {
  $$ShowdownChallengesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$TeamPlayersTableAnnotationComposer get firstPlayerId {
    final $$TeamPlayersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.firstPlayerId,
      referencedTable: $db.teamPlayers,
      getReferencedColumn: (t) => t.id,
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
    return composer;
  }

  $$TeamPlayersTableAnnotationComposer get secondPlayerId {
    final $$TeamPlayersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.secondPlayerId,
      referencedTable: $db.teamPlayers,
      getReferencedColumn: (t) => t.id,
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
    return composer;
  }
}

class $$ShowdownChallengesTableTableManager
    extends
        RootTableManager<
          _$LadderDatabase,
          $ShowdownChallengesTable,
          ShowdownChallenge,
          $$ShowdownChallengesTableFilterComposer,
          $$ShowdownChallengesTableOrderingComposer,
          $$ShowdownChallengesTableAnnotationComposer,
          $$ShowdownChallengesTableCreateCompanionBuilder,
          $$ShowdownChallengesTableUpdateCompanionBuilder,
          (ShowdownChallenge, $$ShowdownChallengesTableReferences),
          ShowdownChallenge,
          PrefetchHooks Function({bool firstPlayerId, bool secondPlayerId})
        > {
  $$ShowdownChallengesTableTableManager(
    _$LadderDatabase db,
    $ShowdownChallengesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ShowdownChallengesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ShowdownChallengesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ShowdownChallengesTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> firstPlayerId = const Value.absent(),
                Value<int> secondPlayerId = const Value.absent(),
              }) => ShowdownChallengesCompanion(
                id: id,
                createdAt: createdAt,
                firstPlayerId: firstPlayerId,
                secondPlayerId: secondPlayerId,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                required int firstPlayerId,
                required int secondPlayerId,
              }) => ShowdownChallengesCompanion.insert(
                id: id,
                createdAt: createdAt,
                firstPlayerId: firstPlayerId,
                secondPlayerId: secondPlayerId,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ShowdownChallengesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({firstPlayerId = false, secondPlayerId = false}) {
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
                        if (firstPlayerId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.firstPlayerId,
                                    referencedTable:
                                        $$ShowdownChallengesTableReferences
                                            ._firstPlayerIdTable(db),
                                    referencedColumn:
                                        $$ShowdownChallengesTableReferences
                                            ._firstPlayerIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (secondPlayerId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.secondPlayerId,
                                    referencedTable:
                                        $$ShowdownChallengesTableReferences
                                            ._secondPlayerIdTable(db),
                                    referencedColumn:
                                        $$ShowdownChallengesTableReferences
                                            ._secondPlayerIdTable(db)
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

typedef $$ShowdownChallengesTableProcessedTableManager =
    ProcessedTableManager<
      _$LadderDatabase,
      $ShowdownChallengesTable,
      ShowdownChallenge,
      $$ShowdownChallengesTableFilterComposer,
      $$ShowdownChallengesTableOrderingComposer,
      $$ShowdownChallengesTableAnnotationComposer,
      $$ShowdownChallengesTableCreateCompanionBuilder,
      $$ShowdownChallengesTableUpdateCompanionBuilder,
      (ShowdownChallenge, $$ShowdownChallengesTableReferences),
      ShowdownChallenge,
      PrefetchHooks Function({bool firstPlayerId, bool secondPlayerId})
    >;
typedef $$GamePointsTableCreateCompanionBuilder =
    GamePointsCompanion Function({
      Value<int> id,
      required int playerId,
      required int gameId,
      required int pointId,
    });
typedef $$GamePointsTableUpdateCompanionBuilder =
    GamePointsCompanion Function({
      Value<int> id,
      Value<int> playerId,
      Value<int> gameId,
      Value<int> pointId,
    });

final class $$GamePointsTableReferences
    extends BaseReferences<_$LadderDatabase, $GamePointsTable, GamePoint> {
  $$GamePointsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $TeamPlayersTable _playerIdTable(_$LadderDatabase db) =>
      db.teamPlayers.createAlias(
        $_aliasNameGenerator(db.gamePoints.playerId, db.teamPlayers.id),
      );

  $$TeamPlayersTableProcessedTableManager get playerId {
    final $_column = $_itemColumn<int>('player_id')!;

    final manager = $$TeamPlayersTableTableManager(
      $_db,
      $_db.teamPlayers,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_playerIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $ShowdownGamesTable _gameIdTable(_$LadderDatabase db) =>
      db.showdownGames.createAlias(
        $_aliasNameGenerator(db.gamePoints.gameId, db.showdownGames.id),
      );

  $$ShowdownGamesTableProcessedTableManager get gameId {
    final $_column = $_itemColumn<int>('game_id')!;

    final manager = $$ShowdownGamesTableTableManager(
      $_db,
      $_db.showdownGames,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_gameIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $ShowdownPointsTable _pointIdTable(_$LadderDatabase db) =>
      db.showdownPoints.createAlias(
        $_aliasNameGenerator(db.gamePoints.pointId, db.showdownPoints.id),
      );

  $$ShowdownPointsTableProcessedTableManager get pointId {
    final $_column = $_itemColumn<int>('point_id')!;

    final manager = $$ShowdownPointsTableTableManager(
      $_db,
      $_db.showdownPoints,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_pointIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$GamePointsTableFilterComposer
    extends Composer<_$LadderDatabase, $GamePointsTable> {
  $$GamePointsTableFilterComposer({
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

  $$TeamPlayersTableFilterComposer get playerId {
    final $$TeamPlayersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.playerId,
      referencedTable: $db.teamPlayers,
      getReferencedColumn: (t) => t.id,
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
    return composer;
  }

  $$ShowdownGamesTableFilterComposer get gameId {
    final $$ShowdownGamesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.gameId,
      referencedTable: $db.showdownGames,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ShowdownGamesTableFilterComposer(
            $db: $db,
            $table: $db.showdownGames,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ShowdownPointsTableFilterComposer get pointId {
    final $$ShowdownPointsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.pointId,
      referencedTable: $db.showdownPoints,
      getReferencedColumn: (t) => t.id,
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
    return composer;
  }
}

class $$GamePointsTableOrderingComposer
    extends Composer<_$LadderDatabase, $GamePointsTable> {
  $$GamePointsTableOrderingComposer({
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

  $$TeamPlayersTableOrderingComposer get playerId {
    final $$TeamPlayersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.playerId,
      referencedTable: $db.teamPlayers,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TeamPlayersTableOrderingComposer(
            $db: $db,
            $table: $db.teamPlayers,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ShowdownGamesTableOrderingComposer get gameId {
    final $$ShowdownGamesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.gameId,
      referencedTable: $db.showdownGames,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ShowdownGamesTableOrderingComposer(
            $db: $db,
            $table: $db.showdownGames,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ShowdownPointsTableOrderingComposer get pointId {
    final $$ShowdownPointsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.pointId,
      referencedTable: $db.showdownPoints,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ShowdownPointsTableOrderingComposer(
            $db: $db,
            $table: $db.showdownPoints,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$GamePointsTableAnnotationComposer
    extends Composer<_$LadderDatabase, $GamePointsTable> {
  $$GamePointsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  $$TeamPlayersTableAnnotationComposer get playerId {
    final $$TeamPlayersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.playerId,
      referencedTable: $db.teamPlayers,
      getReferencedColumn: (t) => t.id,
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
    return composer;
  }

  $$ShowdownGamesTableAnnotationComposer get gameId {
    final $$ShowdownGamesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.gameId,
      referencedTable: $db.showdownGames,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ShowdownGamesTableAnnotationComposer(
            $db: $db,
            $table: $db.showdownGames,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ShowdownPointsTableAnnotationComposer get pointId {
    final $$ShowdownPointsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.pointId,
      referencedTable: $db.showdownPoints,
      getReferencedColumn: (t) => t.id,
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
    return composer;
  }
}

class $$GamePointsTableTableManager
    extends
        RootTableManager<
          _$LadderDatabase,
          $GamePointsTable,
          GamePoint,
          $$GamePointsTableFilterComposer,
          $$GamePointsTableOrderingComposer,
          $$GamePointsTableAnnotationComposer,
          $$GamePointsTableCreateCompanionBuilder,
          $$GamePointsTableUpdateCompanionBuilder,
          (GamePoint, $$GamePointsTableReferences),
          GamePoint,
          PrefetchHooks Function({bool playerId, bool gameId, bool pointId})
        > {
  $$GamePointsTableTableManager(_$LadderDatabase db, $GamePointsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$GamePointsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$GamePointsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$GamePointsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> playerId = const Value.absent(),
                Value<int> gameId = const Value.absent(),
                Value<int> pointId = const Value.absent(),
              }) => GamePointsCompanion(
                id: id,
                playerId: playerId,
                gameId: gameId,
                pointId: pointId,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int playerId,
                required int gameId,
                required int pointId,
              }) => GamePointsCompanion.insert(
                id: id,
                playerId: playerId,
                gameId: gameId,
                pointId: pointId,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$GamePointsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({playerId = false, gameId = false, pointId = false}) {
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
                        if (playerId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.playerId,
                                    referencedTable: $$GamePointsTableReferences
                                        ._playerIdTable(db),
                                    referencedColumn:
                                        $$GamePointsTableReferences
                                            ._playerIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (gameId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.gameId,
                                    referencedTable: $$GamePointsTableReferences
                                        ._gameIdTable(db),
                                    referencedColumn:
                                        $$GamePointsTableReferences
                                            ._gameIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (pointId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.pointId,
                                    referencedTable: $$GamePointsTableReferences
                                        ._pointIdTable(db),
                                    referencedColumn:
                                        $$GamePointsTableReferences
                                            ._pointIdTable(db)
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

typedef $$GamePointsTableProcessedTableManager =
    ProcessedTableManager<
      _$LadderDatabase,
      $GamePointsTable,
      GamePoint,
      $$GamePointsTableFilterComposer,
      $$GamePointsTableOrderingComposer,
      $$GamePointsTableAnnotationComposer,
      $$GamePointsTableCreateCompanionBuilder,
      $$GamePointsTableUpdateCompanionBuilder,
      (GamePoint, $$GamePointsTableReferences),
      GamePoint,
      PrefetchHooks Function({bool playerId, bool gameId, bool pointId})
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
  $$LadderNightsTableTableManager get ladderNights =>
      $$LadderNightsTableTableManager(_db, _db.ladderNights);
  $$ShowdownGamesTableTableManager get showdownGames =>
      $$ShowdownGamesTableTableManager(_db, _db.showdownGames);
  $$ShowdownChallengesTableTableManager get showdownChallenges =>
      $$ShowdownChallengesTableTableManager(_db, _db.showdownChallenges);
  $$GamePointsTableTableManager get gamePoints =>
      $$GamePointsTableTableManager(_db, _db.gamePoints);
}
