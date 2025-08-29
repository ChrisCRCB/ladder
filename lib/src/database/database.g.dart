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
  static const VerificationMeta _gameLengthMeta = const VerificationMeta(
    'gameLength',
  );
  @override
  late final GeneratedColumn<int> gameLength = GeneratedColumn<int>(
    'game_length',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(30),
  );
  static const VerificationMeta _challengePointsMeta = const VerificationMeta(
    'challengePoints',
  );
  @override
  late final GeneratedColumn<int> challengePoints = GeneratedColumn<int>(
    'challenge_points',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(5),
  );
  static const VerificationMeta _winningPointsMeta = const VerificationMeta(
    'winningPoints',
  );
  @override
  late final GeneratedColumn<int> winningPoints = GeneratedColumn<int>(
    'winning_points',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(11),
  );
  static const VerificationMeta _clearPointsMeta = const VerificationMeta(
    'clearPoints',
  );
  @override
  late final GeneratedColumn<int> clearPoints = GeneratedColumn<int>(
    'clear_points',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(2),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    createdAt,
    emailAddress,
    lastAccessed,
    gameLength,
    challengePoints,
    winningPoints,
    clearPoints,
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
    if (data.containsKey('game_length')) {
      context.handle(
        _gameLengthMeta,
        gameLength.isAcceptableOrUnknown(data['game_length']!, _gameLengthMeta),
      );
    }
    if (data.containsKey('challenge_points')) {
      context.handle(
        _challengePointsMeta,
        challengePoints.isAcceptableOrUnknown(
          data['challenge_points']!,
          _challengePointsMeta,
        ),
      );
    }
    if (data.containsKey('winning_points')) {
      context.handle(
        _winningPointsMeta,
        winningPoints.isAcceptableOrUnknown(
          data['winning_points']!,
          _winningPointsMeta,
        ),
      );
    }
    if (data.containsKey('clear_points')) {
      context.handle(
        _clearPointsMeta,
        clearPoints.isAcceptableOrUnknown(
          data['clear_points']!,
          _clearPointsMeta,
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
      gameLength: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}game_length'],
      )!,
      challengePoints: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}challenge_points'],
      )!,
      winningPoints: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}winning_points'],
      )!,
      clearPoints: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}clear_points'],
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

  /// How many minutes long should each game be.
  final int gameLength;

  /// The points difference before a challenge can be made.
  final int challengePoints;

  /// The number of points to win a game.
  final int winningPoints;

  /// The number of clear points.
  final int clearPoints;
  const ShowdownTeam({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.emailAddress,
    required this.lastAccessed,
    required this.gameLength,
    required this.challengePoints,
    required this.winningPoints,
    required this.clearPoints,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['email_address'] = Variable<String>(emailAddress);
    map['last_accessed'] = Variable<DateTime>(lastAccessed);
    map['game_length'] = Variable<int>(gameLength);
    map['challenge_points'] = Variable<int>(challengePoints);
    map['winning_points'] = Variable<int>(winningPoints);
    map['clear_points'] = Variable<int>(clearPoints);
    return map;
  }

  ShowdownTeamsCompanion toCompanion(bool nullToAbsent) {
    return ShowdownTeamsCompanion(
      id: Value(id),
      name: Value(name),
      createdAt: Value(createdAt),
      emailAddress: Value(emailAddress),
      lastAccessed: Value(lastAccessed),
      gameLength: Value(gameLength),
      challengePoints: Value(challengePoints),
      winningPoints: Value(winningPoints),
      clearPoints: Value(clearPoints),
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
      gameLength: serializer.fromJson<int>(json['gameLength']),
      challengePoints: serializer.fromJson<int>(json['challengePoints']),
      winningPoints: serializer.fromJson<int>(json['winningPoints']),
      clearPoints: serializer.fromJson<int>(json['clearPoints']),
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
      'gameLength': serializer.toJson<int>(gameLength),
      'challengePoints': serializer.toJson<int>(challengePoints),
      'winningPoints': serializer.toJson<int>(winningPoints),
      'clearPoints': serializer.toJson<int>(clearPoints),
    };
  }

  ShowdownTeam copyWith({
    int? id,
    String? name,
    DateTime? createdAt,
    String? emailAddress,
    DateTime? lastAccessed,
    int? gameLength,
    int? challengePoints,
    int? winningPoints,
    int? clearPoints,
  }) => ShowdownTeam(
    id: id ?? this.id,
    name: name ?? this.name,
    createdAt: createdAt ?? this.createdAt,
    emailAddress: emailAddress ?? this.emailAddress,
    lastAccessed: lastAccessed ?? this.lastAccessed,
    gameLength: gameLength ?? this.gameLength,
    challengePoints: challengePoints ?? this.challengePoints,
    winningPoints: winningPoints ?? this.winningPoints,
    clearPoints: clearPoints ?? this.clearPoints,
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
      gameLength: data.gameLength.present
          ? data.gameLength.value
          : this.gameLength,
      challengePoints: data.challengePoints.present
          ? data.challengePoints.value
          : this.challengePoints,
      winningPoints: data.winningPoints.present
          ? data.winningPoints.value
          : this.winningPoints,
      clearPoints: data.clearPoints.present
          ? data.clearPoints.value
          : this.clearPoints,
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
          ..write('gameLength: $gameLength, ')
          ..write('challengePoints: $challengePoints, ')
          ..write('winningPoints: $winningPoints, ')
          ..write('clearPoints: $clearPoints')
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
    gameLength,
    challengePoints,
    winningPoints,
    clearPoints,
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
          other.gameLength == this.gameLength &&
          other.challengePoints == this.challengePoints &&
          other.winningPoints == this.winningPoints &&
          other.clearPoints == this.clearPoints);
}

class ShowdownTeamsCompanion extends UpdateCompanion<ShowdownTeam> {
  final Value<int> id;
  final Value<String> name;
  final Value<DateTime> createdAt;
  final Value<String> emailAddress;
  final Value<DateTime> lastAccessed;
  final Value<int> gameLength;
  final Value<int> challengePoints;
  final Value<int> winningPoints;
  final Value<int> clearPoints;
  const ShowdownTeamsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.emailAddress = const Value.absent(),
    this.lastAccessed = const Value.absent(),
    this.gameLength = const Value.absent(),
    this.challengePoints = const Value.absent(),
    this.winningPoints = const Value.absent(),
    this.clearPoints = const Value.absent(),
  });
  ShowdownTeamsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.createdAt = const Value.absent(),
    this.emailAddress = const Value.absent(),
    this.lastAccessed = const Value.absent(),
    this.gameLength = const Value.absent(),
    this.challengePoints = const Value.absent(),
    this.winningPoints = const Value.absent(),
    this.clearPoints = const Value.absent(),
  }) : name = Value(name);
  static Insertable<ShowdownTeam> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<DateTime>? createdAt,
    Expression<String>? emailAddress,
    Expression<DateTime>? lastAccessed,
    Expression<int>? gameLength,
    Expression<int>? challengePoints,
    Expression<int>? winningPoints,
    Expression<int>? clearPoints,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (createdAt != null) 'created_at': createdAt,
      if (emailAddress != null) 'email_address': emailAddress,
      if (lastAccessed != null) 'last_accessed': lastAccessed,
      if (gameLength != null) 'game_length': gameLength,
      if (challengePoints != null) 'challenge_points': challengePoints,
      if (winningPoints != null) 'winning_points': winningPoints,
      if (clearPoints != null) 'clear_points': clearPoints,
    });
  }

  ShowdownTeamsCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<DateTime>? createdAt,
    Value<String>? emailAddress,
    Value<DateTime>? lastAccessed,
    Value<int>? gameLength,
    Value<int>? challengePoints,
    Value<int>? winningPoints,
    Value<int>? clearPoints,
  }) {
    return ShowdownTeamsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      createdAt: createdAt ?? this.createdAt,
      emailAddress: emailAddress ?? this.emailAddress,
      lastAccessed: lastAccessed ?? this.lastAccessed,
      gameLength: gameLength ?? this.gameLength,
      challengePoints: challengePoints ?? this.challengePoints,
      winningPoints: winningPoints ?? this.winningPoints,
      clearPoints: clearPoints ?? this.clearPoints,
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
    if (gameLength.present) {
      map['game_length'] = Variable<int>(gameLength.value);
    }
    if (challengePoints.present) {
      map['challenge_points'] = Variable<int>(challengePoints.value);
    }
    if (winningPoints.present) {
      map['winning_points'] = Variable<int>(winningPoints.value);
    }
    if (clearPoints.present) {
      map['clear_points'] = Variable<int>(clearPoints.value);
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
          ..write('gameLength: $gameLength, ')
          ..write('challengePoints: $challengePoints, ')
          ..write('winningPoints: $winningPoints, ')
          ..write('clearPoints: $clearPoints')
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
  static const VerificationMeta _lockedOnMeta = const VerificationMeta(
    'lockedOn',
  );
  @override
  late final GeneratedColumn<DateTime> lockedOn = GeneratedColumn<DateTime>(
    'locked_on',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    createdAt,
    ladderNightId,
    firstPlayerId,
    secondPlayerId,
    lockedOn,
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
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
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
    if (data.containsKey('locked_on')) {
      context.handle(
        _lockedOnMeta,
        lockedOn.isAcceptableOrUnknown(data['locked_on']!, _lockedOnMeta),
      );
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
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
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
      lockedOn: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}locked_on'],
      ),
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

  /// The date and time this row was created.
  final DateTime createdAt;

  /// The ID of the night this game belongs to.
  final int ladderNightId;

  /// The ID of the first player.
  ///
  /// The first player is the one who initiated the challenge.
  final int firstPlayerId;

  /// The ID of the second player.
  final int secondPlayerId;

  /// The date this game was locked on.
  final DateTime? lockedOn;
  const ShowdownGame({
    required this.id,
    required this.createdAt,
    required this.ladderNightId,
    required this.firstPlayerId,
    required this.secondPlayerId,
    this.lockedOn,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['ladder_night_id'] = Variable<int>(ladderNightId);
    map['first_player_id'] = Variable<int>(firstPlayerId);
    map['second_player_id'] = Variable<int>(secondPlayerId);
    if (!nullToAbsent || lockedOn != null) {
      map['locked_on'] = Variable<DateTime>(lockedOn);
    }
    return map;
  }

  ShowdownGamesCompanion toCompanion(bool nullToAbsent) {
    return ShowdownGamesCompanion(
      id: Value(id),
      createdAt: Value(createdAt),
      ladderNightId: Value(ladderNightId),
      firstPlayerId: Value(firstPlayerId),
      secondPlayerId: Value(secondPlayerId),
      lockedOn: lockedOn == null && nullToAbsent
          ? const Value.absent()
          : Value(lockedOn),
    );
  }

  factory ShowdownGame.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ShowdownGame(
      id: serializer.fromJson<int>(json['id']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      ladderNightId: serializer.fromJson<int>(json['ladderNightId']),
      firstPlayerId: serializer.fromJson<int>(json['firstPlayerId']),
      secondPlayerId: serializer.fromJson<int>(json['secondPlayerId']),
      lockedOn: serializer.fromJson<DateTime?>(json['lockedOn']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'ladderNightId': serializer.toJson<int>(ladderNightId),
      'firstPlayerId': serializer.toJson<int>(firstPlayerId),
      'secondPlayerId': serializer.toJson<int>(secondPlayerId),
      'lockedOn': serializer.toJson<DateTime?>(lockedOn),
    };
  }

  ShowdownGame copyWith({
    int? id,
    DateTime? createdAt,
    int? ladderNightId,
    int? firstPlayerId,
    int? secondPlayerId,
    Value<DateTime?> lockedOn = const Value.absent(),
  }) => ShowdownGame(
    id: id ?? this.id,
    createdAt: createdAt ?? this.createdAt,
    ladderNightId: ladderNightId ?? this.ladderNightId,
    firstPlayerId: firstPlayerId ?? this.firstPlayerId,
    secondPlayerId: secondPlayerId ?? this.secondPlayerId,
    lockedOn: lockedOn.present ? lockedOn.value : this.lockedOn,
  );
  ShowdownGame copyWithCompanion(ShowdownGamesCompanion data) {
    return ShowdownGame(
      id: data.id.present ? data.id.value : this.id,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      ladderNightId: data.ladderNightId.present
          ? data.ladderNightId.value
          : this.ladderNightId,
      firstPlayerId: data.firstPlayerId.present
          ? data.firstPlayerId.value
          : this.firstPlayerId,
      secondPlayerId: data.secondPlayerId.present
          ? data.secondPlayerId.value
          : this.secondPlayerId,
      lockedOn: data.lockedOn.present ? data.lockedOn.value : this.lockedOn,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ShowdownGame(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('ladderNightId: $ladderNightId, ')
          ..write('firstPlayerId: $firstPlayerId, ')
          ..write('secondPlayerId: $secondPlayerId, ')
          ..write('lockedOn: $lockedOn')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    createdAt,
    ladderNightId,
    firstPlayerId,
    secondPlayerId,
    lockedOn,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ShowdownGame &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.ladderNightId == this.ladderNightId &&
          other.firstPlayerId == this.firstPlayerId &&
          other.secondPlayerId == this.secondPlayerId &&
          other.lockedOn == this.lockedOn);
}

class ShowdownGamesCompanion extends UpdateCompanion<ShowdownGame> {
  final Value<int> id;
  final Value<DateTime> createdAt;
  final Value<int> ladderNightId;
  final Value<int> firstPlayerId;
  final Value<int> secondPlayerId;
  final Value<DateTime?> lockedOn;
  const ShowdownGamesCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.ladderNightId = const Value.absent(),
    this.firstPlayerId = const Value.absent(),
    this.secondPlayerId = const Value.absent(),
    this.lockedOn = const Value.absent(),
  });
  ShowdownGamesCompanion.insert({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    required int ladderNightId,
    required int firstPlayerId,
    required int secondPlayerId,
    this.lockedOn = const Value.absent(),
  }) : ladderNightId = Value(ladderNightId),
       firstPlayerId = Value(firstPlayerId),
       secondPlayerId = Value(secondPlayerId);
  static Insertable<ShowdownGame> custom({
    Expression<int>? id,
    Expression<DateTime>? createdAt,
    Expression<int>? ladderNightId,
    Expression<int>? firstPlayerId,
    Expression<int>? secondPlayerId,
    Expression<DateTime>? lockedOn,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (ladderNightId != null) 'ladder_night_id': ladderNightId,
      if (firstPlayerId != null) 'first_player_id': firstPlayerId,
      if (secondPlayerId != null) 'second_player_id': secondPlayerId,
      if (lockedOn != null) 'locked_on': lockedOn,
    });
  }

  ShowdownGamesCompanion copyWith({
    Value<int>? id,
    Value<DateTime>? createdAt,
    Value<int>? ladderNightId,
    Value<int>? firstPlayerId,
    Value<int>? secondPlayerId,
    Value<DateTime?>? lockedOn,
  }) {
    return ShowdownGamesCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      ladderNightId: ladderNightId ?? this.ladderNightId,
      firstPlayerId: firstPlayerId ?? this.firstPlayerId,
      secondPlayerId: secondPlayerId ?? this.secondPlayerId,
      lockedOn: lockedOn ?? this.lockedOn,
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
    if (ladderNightId.present) {
      map['ladder_night_id'] = Variable<int>(ladderNightId.value);
    }
    if (firstPlayerId.present) {
      map['first_player_id'] = Variable<int>(firstPlayerId.value);
    }
    if (secondPlayerId.present) {
      map['second_player_id'] = Variable<int>(secondPlayerId.value);
    }
    if (lockedOn.present) {
      map['locked_on'] = Variable<DateTime>(lockedOn.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ShowdownGamesCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('ladderNightId: $ladderNightId, ')
          ..write('firstPlayerId: $firstPlayerId, ')
          ..write('secondPlayerId: $secondPlayerId, ')
          ..write('lockedOn: $lockedOn')
          ..write(')'))
        .toString();
  }
}

class $GameSetsTable extends GameSets with TableInfo<$GameSetsTable, GameSet> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GameSetsTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _startingPlayerIdMeta = const VerificationMeta(
    'startingPlayerId',
  );
  @override
  late final GeneratedColumn<int> startingPlayerId = GeneratedColumn<int>(
    'starting_player_id',
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
  @override
  List<GeneratedColumn> get $columns => [id, startingPlayerId, gameId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'game_sets';
  @override
  VerificationContext validateIntegrity(
    Insertable<GameSet> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('starting_player_id')) {
      context.handle(
        _startingPlayerIdMeta,
        startingPlayerId.isAcceptableOrUnknown(
          data['starting_player_id']!,
          _startingPlayerIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_startingPlayerIdMeta);
    }
    if (data.containsKey('game_id')) {
      context.handle(
        _gameIdMeta,
        gameId.isAcceptableOrUnknown(data['game_id']!, _gameIdMeta),
      );
    } else if (isInserting) {
      context.missing(_gameIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  GameSet map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return GameSet(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      startingPlayerId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}starting_player_id'],
      )!,
      gameId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}game_id'],
      )!,
    );
  }

  @override
  $GameSetsTable createAlias(String alias) {
    return $GameSetsTable(attachedDatabase, alias);
  }
}

class GameSet extends DataClass implements Insertable<GameSet> {
  /// The primary key.
  final int id;

  /// The ID of the first player to serve.
  final int startingPlayerId;

  /// The ID of the game which this set is part of.
  final int gameId;
  const GameSet({
    required this.id,
    required this.startingPlayerId,
    required this.gameId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['starting_player_id'] = Variable<int>(startingPlayerId);
    map['game_id'] = Variable<int>(gameId);
    return map;
  }

  GameSetsCompanion toCompanion(bool nullToAbsent) {
    return GameSetsCompanion(
      id: Value(id),
      startingPlayerId: Value(startingPlayerId),
      gameId: Value(gameId),
    );
  }

  factory GameSet.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return GameSet(
      id: serializer.fromJson<int>(json['id']),
      startingPlayerId: serializer.fromJson<int>(json['startingPlayerId']),
      gameId: serializer.fromJson<int>(json['gameId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'startingPlayerId': serializer.toJson<int>(startingPlayerId),
      'gameId': serializer.toJson<int>(gameId),
    };
  }

  GameSet copyWith({int? id, int? startingPlayerId, int? gameId}) => GameSet(
    id: id ?? this.id,
    startingPlayerId: startingPlayerId ?? this.startingPlayerId,
    gameId: gameId ?? this.gameId,
  );
  GameSet copyWithCompanion(GameSetsCompanion data) {
    return GameSet(
      id: data.id.present ? data.id.value : this.id,
      startingPlayerId: data.startingPlayerId.present
          ? data.startingPlayerId.value
          : this.startingPlayerId,
      gameId: data.gameId.present ? data.gameId.value : this.gameId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('GameSet(')
          ..write('id: $id, ')
          ..write('startingPlayerId: $startingPlayerId, ')
          ..write('gameId: $gameId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, startingPlayerId, gameId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GameSet &&
          other.id == this.id &&
          other.startingPlayerId == this.startingPlayerId &&
          other.gameId == this.gameId);
}

class GameSetsCompanion extends UpdateCompanion<GameSet> {
  final Value<int> id;
  final Value<int> startingPlayerId;
  final Value<int> gameId;
  const GameSetsCompanion({
    this.id = const Value.absent(),
    this.startingPlayerId = const Value.absent(),
    this.gameId = const Value.absent(),
  });
  GameSetsCompanion.insert({
    this.id = const Value.absent(),
    required int startingPlayerId,
    required int gameId,
  }) : startingPlayerId = Value(startingPlayerId),
       gameId = Value(gameId);
  static Insertable<GameSet> custom({
    Expression<int>? id,
    Expression<int>? startingPlayerId,
    Expression<int>? gameId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (startingPlayerId != null) 'starting_player_id': startingPlayerId,
      if (gameId != null) 'game_id': gameId,
    });
  }

  GameSetsCompanion copyWith({
    Value<int>? id,
    Value<int>? startingPlayerId,
    Value<int>? gameId,
  }) {
    return GameSetsCompanion(
      id: id ?? this.id,
      startingPlayerId: startingPlayerId ?? this.startingPlayerId,
      gameId: gameId ?? this.gameId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (startingPlayerId.present) {
      map['starting_player_id'] = Variable<int>(startingPlayerId.value);
    }
    if (gameId.present) {
      map['game_id'] = Variable<int>(gameId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GameSetsCompanion(')
          ..write('id: $id, ')
          ..write('startingPlayerId: $startingPlayerId, ')
          ..write('gameId: $gameId')
          ..write(')'))
        .toString();
  }
}

class $SetPointsTable extends SetPoints
    with TableInfo<$SetPointsTable, SetPoint> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SetPointsTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _gameSetIdMeta = const VerificationMeta(
    'gameSetId',
  );
  @override
  late final GeneratedColumn<int> gameSetId = GeneratedColumn<int>(
    'game_set_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES game_sets (id) ON DELETE CASCADE',
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
  List<GeneratedColumn> get $columns => [
    id,
    createdAt,
    playerId,
    gameSetId,
    pointId,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'set_points';
  @override
  VerificationContext validateIntegrity(
    Insertable<SetPoint> instance, {
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
    if (data.containsKey('player_id')) {
      context.handle(
        _playerIdMeta,
        playerId.isAcceptableOrUnknown(data['player_id']!, _playerIdMeta),
      );
    } else if (isInserting) {
      context.missing(_playerIdMeta);
    }
    if (data.containsKey('game_set_id')) {
      context.handle(
        _gameSetIdMeta,
        gameSetId.isAcceptableOrUnknown(data['game_set_id']!, _gameSetIdMeta),
      );
    } else if (isInserting) {
      context.missing(_gameSetIdMeta);
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
  SetPoint map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SetPoint(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      playerId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}player_id'],
      )!,
      gameSetId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}game_set_id'],
      )!,
      pointId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}point_id'],
      )!,
    );
  }

  @override
  $SetPointsTable createAlias(String alias) {
    return $SetPointsTable(attachedDatabase, alias);
  }
}

class SetPoint extends DataClass implements Insertable<SetPoint> {
  /// The primary key.
  final int id;

  /// The date and time this row was created.
  final DateTime createdAt;

  /// The ID of the player who was awarded the points.
  final int playerId;

  /// The ID of the [GameSet] in which the points were awarded.
  final int gameSetId;

  /// The ID of the point that was awarded.
  final int pointId;
  const SetPoint({
    required this.id,
    required this.createdAt,
    required this.playerId,
    required this.gameSetId,
    required this.pointId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['player_id'] = Variable<int>(playerId);
    map['game_set_id'] = Variable<int>(gameSetId);
    map['point_id'] = Variable<int>(pointId);
    return map;
  }

  SetPointsCompanion toCompanion(bool nullToAbsent) {
    return SetPointsCompanion(
      id: Value(id),
      createdAt: Value(createdAt),
      playerId: Value(playerId),
      gameSetId: Value(gameSetId),
      pointId: Value(pointId),
    );
  }

  factory SetPoint.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SetPoint(
      id: serializer.fromJson<int>(json['id']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      playerId: serializer.fromJson<int>(json['playerId']),
      gameSetId: serializer.fromJson<int>(json['gameSetId']),
      pointId: serializer.fromJson<int>(json['pointId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'playerId': serializer.toJson<int>(playerId),
      'gameSetId': serializer.toJson<int>(gameSetId),
      'pointId': serializer.toJson<int>(pointId),
    };
  }

  SetPoint copyWith({
    int? id,
    DateTime? createdAt,
    int? playerId,
    int? gameSetId,
    int? pointId,
  }) => SetPoint(
    id: id ?? this.id,
    createdAt: createdAt ?? this.createdAt,
    playerId: playerId ?? this.playerId,
    gameSetId: gameSetId ?? this.gameSetId,
    pointId: pointId ?? this.pointId,
  );
  SetPoint copyWithCompanion(SetPointsCompanion data) {
    return SetPoint(
      id: data.id.present ? data.id.value : this.id,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      playerId: data.playerId.present ? data.playerId.value : this.playerId,
      gameSetId: data.gameSetId.present ? data.gameSetId.value : this.gameSetId,
      pointId: data.pointId.present ? data.pointId.value : this.pointId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SetPoint(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('playerId: $playerId, ')
          ..write('gameSetId: $gameSetId, ')
          ..write('pointId: $pointId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, createdAt, playerId, gameSetId, pointId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SetPoint &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.playerId == this.playerId &&
          other.gameSetId == this.gameSetId &&
          other.pointId == this.pointId);
}

class SetPointsCompanion extends UpdateCompanion<SetPoint> {
  final Value<int> id;
  final Value<DateTime> createdAt;
  final Value<int> playerId;
  final Value<int> gameSetId;
  final Value<int> pointId;
  const SetPointsCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.playerId = const Value.absent(),
    this.gameSetId = const Value.absent(),
    this.pointId = const Value.absent(),
  });
  SetPointsCompanion.insert({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    required int playerId,
    required int gameSetId,
    required int pointId,
  }) : playerId = Value(playerId),
       gameSetId = Value(gameSetId),
       pointId = Value(pointId);
  static Insertable<SetPoint> custom({
    Expression<int>? id,
    Expression<DateTime>? createdAt,
    Expression<int>? playerId,
    Expression<int>? gameSetId,
    Expression<int>? pointId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (playerId != null) 'player_id': playerId,
      if (gameSetId != null) 'game_set_id': gameSetId,
      if (pointId != null) 'point_id': pointId,
    });
  }

  SetPointsCompanion copyWith({
    Value<int>? id,
    Value<DateTime>? createdAt,
    Value<int>? playerId,
    Value<int>? gameSetId,
    Value<int>? pointId,
  }) {
    return SetPointsCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      playerId: playerId ?? this.playerId,
      gameSetId: gameSetId ?? this.gameSetId,
      pointId: pointId ?? this.pointId,
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
    if (playerId.present) {
      map['player_id'] = Variable<int>(playerId.value);
    }
    if (gameSetId.present) {
      map['game_set_id'] = Variable<int>(gameSetId.value);
    }
    if (pointId.present) {
      map['point_id'] = Variable<int>(pointId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SetPointsCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('playerId: $playerId, ')
          ..write('gameSetId: $gameSetId, ')
          ..write('pointId: $pointId')
          ..write(')'))
        .toString();
  }
}

class $LadderNightAbsencesTable extends LadderNightAbsences
    with TableInfo<$LadderNightAbsencesTable, LadderNightAbsence> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LadderNightAbsencesTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _teamPlayerIdMeta = const VerificationMeta(
    'teamPlayerId',
  );
  @override
  late final GeneratedColumn<int> teamPlayerId = GeneratedColumn<int>(
    'team_player_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES team_players (id) ON DELETE CASCADE',
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
  @override
  List<GeneratedColumn> get $columns => [id, teamPlayerId, ladderNightId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'ladder_night_absences';
  @override
  VerificationContext validateIntegrity(
    Insertable<LadderNightAbsence> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('team_player_id')) {
      context.handle(
        _teamPlayerIdMeta,
        teamPlayerId.isAcceptableOrUnknown(
          data['team_player_id']!,
          _teamPlayerIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_teamPlayerIdMeta);
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
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LadderNightAbsence map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LadderNightAbsence(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      teamPlayerId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}team_player_id'],
      )!,
      ladderNightId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}ladder_night_id'],
      )!,
    );
  }

  @override
  $LadderNightAbsencesTable createAlias(String alias) {
    return $LadderNightAbsencesTable(attachedDatabase, alias);
  }
}

class LadderNightAbsence extends DataClass
    implements Insertable<LadderNightAbsence> {
  /// The primary key.
  final int id;

  /// The ID of the player whose absence will be recorded.
  final int teamPlayerId;

  /// The ID of the ladder night when the player will be absent.
  final int ladderNightId;
  const LadderNightAbsence({
    required this.id,
    required this.teamPlayerId,
    required this.ladderNightId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['team_player_id'] = Variable<int>(teamPlayerId);
    map['ladder_night_id'] = Variable<int>(ladderNightId);
    return map;
  }

  LadderNightAbsencesCompanion toCompanion(bool nullToAbsent) {
    return LadderNightAbsencesCompanion(
      id: Value(id),
      teamPlayerId: Value(teamPlayerId),
      ladderNightId: Value(ladderNightId),
    );
  }

  factory LadderNightAbsence.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LadderNightAbsence(
      id: serializer.fromJson<int>(json['id']),
      teamPlayerId: serializer.fromJson<int>(json['teamPlayerId']),
      ladderNightId: serializer.fromJson<int>(json['ladderNightId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'teamPlayerId': serializer.toJson<int>(teamPlayerId),
      'ladderNightId': serializer.toJson<int>(ladderNightId),
    };
  }

  LadderNightAbsence copyWith({
    int? id,
    int? teamPlayerId,
    int? ladderNightId,
  }) => LadderNightAbsence(
    id: id ?? this.id,
    teamPlayerId: teamPlayerId ?? this.teamPlayerId,
    ladderNightId: ladderNightId ?? this.ladderNightId,
  );
  LadderNightAbsence copyWithCompanion(LadderNightAbsencesCompanion data) {
    return LadderNightAbsence(
      id: data.id.present ? data.id.value : this.id,
      teamPlayerId: data.teamPlayerId.present
          ? data.teamPlayerId.value
          : this.teamPlayerId,
      ladderNightId: data.ladderNightId.present
          ? data.ladderNightId.value
          : this.ladderNightId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LadderNightAbsence(')
          ..write('id: $id, ')
          ..write('teamPlayerId: $teamPlayerId, ')
          ..write('ladderNightId: $ladderNightId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, teamPlayerId, ladderNightId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LadderNightAbsence &&
          other.id == this.id &&
          other.teamPlayerId == this.teamPlayerId &&
          other.ladderNightId == this.ladderNightId);
}

class LadderNightAbsencesCompanion extends UpdateCompanion<LadderNightAbsence> {
  final Value<int> id;
  final Value<int> teamPlayerId;
  final Value<int> ladderNightId;
  const LadderNightAbsencesCompanion({
    this.id = const Value.absent(),
    this.teamPlayerId = const Value.absent(),
    this.ladderNightId = const Value.absent(),
  });
  LadderNightAbsencesCompanion.insert({
    this.id = const Value.absent(),
    required int teamPlayerId,
    required int ladderNightId,
  }) : teamPlayerId = Value(teamPlayerId),
       ladderNightId = Value(ladderNightId);
  static Insertable<LadderNightAbsence> custom({
    Expression<int>? id,
    Expression<int>? teamPlayerId,
    Expression<int>? ladderNightId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (teamPlayerId != null) 'team_player_id': teamPlayerId,
      if (ladderNightId != null) 'ladder_night_id': ladderNightId,
    });
  }

  LadderNightAbsencesCompanion copyWith({
    Value<int>? id,
    Value<int>? teamPlayerId,
    Value<int>? ladderNightId,
  }) {
    return LadderNightAbsencesCompanion(
      id: id ?? this.id,
      teamPlayerId: teamPlayerId ?? this.teamPlayerId,
      ladderNightId: ladderNightId ?? this.ladderNightId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (teamPlayerId.present) {
      map['team_player_id'] = Variable<int>(teamPlayerId.value);
    }
    if (ladderNightId.present) {
      map['ladder_night_id'] = Variable<int>(ladderNightId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LadderNightAbsencesCompanion(')
          ..write('id: $id, ')
          ..write('teamPlayerId: $teamPlayerId, ')
          ..write('ladderNightId: $ladderNightId')
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
  late final $GameSetsTable gameSets = $GameSetsTable(this);
  late final $SetPointsTable setPoints = $SetPointsTable(this);
  late final $LadderNightAbsencesTable ladderNightAbsences =
      $LadderNightAbsencesTable(this);
  late final Index absenceIndex = Index(
    'absence_index',
    'CREATE UNIQUE INDEX absence_index ON ladder_night_absences (team_player_id, ladder_night_id)',
  );
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
    gameSets,
    setPoints,
    ladderNightAbsences,
    absenceIndex,
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
      result: [TableUpdate('game_sets', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'showdown_games',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('game_sets', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'team_players',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('set_points', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'game_sets',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('set_points', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'showdown_points',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('set_points', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'team_players',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('ladder_night_absences', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'ladder_nights',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('ladder_night_absences', kind: UpdateKind.delete)],
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
      Value<int> gameLength,
      Value<int> challengePoints,
      Value<int> winningPoints,
      Value<int> clearPoints,
    });
typedef $$ShowdownTeamsTableUpdateCompanionBuilder =
    ShowdownTeamsCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<DateTime> createdAt,
      Value<String> emailAddress,
      Value<DateTime> lastAccessed,
      Value<int> gameLength,
      Value<int> challengePoints,
      Value<int> winningPoints,
      Value<int> clearPoints,
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

  ColumnFilters<int> get gameLength => $composableBuilder(
    column: $table.gameLength,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get challengePoints => $composableBuilder(
    column: $table.challengePoints,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get winningPoints => $composableBuilder(
    column: $table.winningPoints,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get clearPoints => $composableBuilder(
    column: $table.clearPoints,
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

  ColumnOrderings<int> get gameLength => $composableBuilder(
    column: $table.gameLength,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get challengePoints => $composableBuilder(
    column: $table.challengePoints,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get winningPoints => $composableBuilder(
    column: $table.winningPoints,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get clearPoints => $composableBuilder(
    column: $table.clearPoints,
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

  GeneratedColumn<int> get gameLength => $composableBuilder(
    column: $table.gameLength,
    builder: (column) => column,
  );

  GeneratedColumn<int> get challengePoints => $composableBuilder(
    column: $table.challengePoints,
    builder: (column) => column,
  );

  GeneratedColumn<int> get winningPoints => $composableBuilder(
    column: $table.winningPoints,
    builder: (column) => column,
  );

  GeneratedColumn<int> get clearPoints => $composableBuilder(
    column: $table.clearPoints,
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
                Value<int> gameLength = const Value.absent(),
                Value<int> challengePoints = const Value.absent(),
                Value<int> winningPoints = const Value.absent(),
                Value<int> clearPoints = const Value.absent(),
              }) => ShowdownTeamsCompanion(
                id: id,
                name: name,
                createdAt: createdAt,
                emailAddress: emailAddress,
                lastAccessed: lastAccessed,
                gameLength: gameLength,
                challengePoints: challengePoints,
                winningPoints: winningPoints,
                clearPoints: clearPoints,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                Value<DateTime> createdAt = const Value.absent(),
                Value<String> emailAddress = const Value.absent(),
                Value<DateTime> lastAccessed = const Value.absent(),
                Value<int> gameLength = const Value.absent(),
                Value<int> challengePoints = const Value.absent(),
                Value<int> winningPoints = const Value.absent(),
                Value<int> clearPoints = const Value.absent(),
              }) => ShowdownTeamsCompanion.insert(
                id: id,
                name: name,
                createdAt: createdAt,
                emailAddress: emailAddress,
                lastAccessed: lastAccessed,
                gameLength: gameLength,
                challengePoints: challengePoints,
                winningPoints: winningPoints,
                clearPoints: clearPoints,
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

  static MultiTypedResultKey<$SetPointsTable, List<SetPoint>>
  _setPointsRefsTable(_$LadderDatabase db) => MultiTypedResultKey.fromTable(
    db.setPoints,
    aliasName: $_aliasNameGenerator(db.showdownPoints.id, db.setPoints.pointId),
  );

  $$SetPointsTableProcessedTableManager get setPointsRefs {
    final manager = $$SetPointsTableTableManager(
      $_db,
      $_db.setPoints,
    ).filter((f) => f.pointId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_setPointsRefsTable($_db));
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

  Expression<bool> setPointsRefs(
    Expression<bool> Function($$SetPointsTableFilterComposer f) f,
  ) {
    final $$SetPointsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.setPoints,
      getReferencedColumn: (t) => t.pointId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SetPointsTableFilterComposer(
            $db: $db,
            $table: $db.setPoints,
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

  Expression<T> setPointsRefs<T extends Object>(
    Expression<T> Function($$SetPointsTableAnnotationComposer a) f,
  ) {
    final $$SetPointsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.setPoints,
      getReferencedColumn: (t) => t.pointId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SetPointsTableAnnotationComposer(
            $db: $db,
            $table: $db.setPoints,
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
          PrefetchHooks Function({bool teamId, bool setPointsRefs})
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
          prefetchHooksCallback: ({teamId = false, setPointsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (setPointsRefs) db.setPoints],
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
                  if (setPointsRefs)
                    await $_getPrefetchedData<
                      ShowdownPoint,
                      $ShowdownPointsTable,
                      SetPoint
                    >(
                      currentTable: table,
                      referencedTable: $$ShowdownPointsTableReferences
                          ._setPointsRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$ShowdownPointsTableReferences(
                            db,
                            table,
                            p0,
                          ).setPointsRefs,
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
      PrefetchHooks Function({bool teamId, bool setPointsRefs})
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

  static MultiTypedResultKey<$GameSetsTable, List<GameSet>> _gameSetsRefsTable(
    _$LadderDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.gameSets,
    aliasName: $_aliasNameGenerator(
      db.teamPlayers.id,
      db.gameSets.startingPlayerId,
    ),
  );

  $$GameSetsTableProcessedTableManager get gameSetsRefs {
    final manager = $$GameSetsTableTableManager(
      $_db,
      $_db.gameSets,
    ).filter((f) => f.startingPlayerId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_gameSetsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$SetPointsTable, List<SetPoint>>
  _setPointsRefsTable(_$LadderDatabase db) => MultiTypedResultKey.fromTable(
    db.setPoints,
    aliasName: $_aliasNameGenerator(db.teamPlayers.id, db.setPoints.playerId),
  );

  $$SetPointsTableProcessedTableManager get setPointsRefs {
    final manager = $$SetPointsTableTableManager(
      $_db,
      $_db.setPoints,
    ).filter((f) => f.playerId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_setPointsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $LadderNightAbsencesTable,
    List<LadderNightAbsence>
  >
  _ladderNightAbsencesRefsTable(_$LadderDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.ladderNightAbsences,
        aliasName: $_aliasNameGenerator(
          db.teamPlayers.id,
          db.ladderNightAbsences.teamPlayerId,
        ),
      );

  $$LadderNightAbsencesTableProcessedTableManager get ladderNightAbsencesRefs {
    final manager = $$LadderNightAbsencesTableTableManager(
      $_db,
      $_db.ladderNightAbsences,
    ).filter((f) => f.teamPlayerId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _ladderNightAbsencesRefsTable($_db),
    );
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

  Expression<bool> gameSetsRefs(
    Expression<bool> Function($$GameSetsTableFilterComposer f) f,
  ) {
    final $$GameSetsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.gameSets,
      getReferencedColumn: (t) => t.startingPlayerId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GameSetsTableFilterComposer(
            $db: $db,
            $table: $db.gameSets,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> setPointsRefs(
    Expression<bool> Function($$SetPointsTableFilterComposer f) f,
  ) {
    final $$SetPointsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.setPoints,
      getReferencedColumn: (t) => t.playerId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SetPointsTableFilterComposer(
            $db: $db,
            $table: $db.setPoints,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> ladderNightAbsencesRefs(
    Expression<bool> Function($$LadderNightAbsencesTableFilterComposer f) f,
  ) {
    final $$LadderNightAbsencesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.ladderNightAbsences,
      getReferencedColumn: (t) => t.teamPlayerId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LadderNightAbsencesTableFilterComposer(
            $db: $db,
            $table: $db.ladderNightAbsences,
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

  Expression<T> gameSetsRefs<T extends Object>(
    Expression<T> Function($$GameSetsTableAnnotationComposer a) f,
  ) {
    final $$GameSetsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.gameSets,
      getReferencedColumn: (t) => t.startingPlayerId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GameSetsTableAnnotationComposer(
            $db: $db,
            $table: $db.gameSets,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> setPointsRefs<T extends Object>(
    Expression<T> Function($$SetPointsTableAnnotationComposer a) f,
  ) {
    final $$SetPointsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.setPoints,
      getReferencedColumn: (t) => t.playerId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SetPointsTableAnnotationComposer(
            $db: $db,
            $table: $db.setPoints,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> ladderNightAbsencesRefs<T extends Object>(
    Expression<T> Function($$LadderNightAbsencesTableAnnotationComposer a) f,
  ) {
    final $$LadderNightAbsencesTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.ladderNightAbsences,
          getReferencedColumn: (t) => t.teamPlayerId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$LadderNightAbsencesTableAnnotationComposer(
                $db: $db,
                $table: $db.ladderNightAbsences,
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
            bool gameSetsRefs,
            bool setPointsRefs,
            bool ladderNightAbsencesRefs,
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
                gameSetsRefs = false,
                setPointsRefs = false,
                ladderNightAbsencesRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (gamesAsFirstPlayer) db.showdownGames,
                    if (gamesAsSecondPlayer) db.showdownGames,
                    if (gameSetsRefs) db.gameSets,
                    if (setPointsRefs) db.setPoints,
                    if (ladderNightAbsencesRefs) db.ladderNightAbsences,
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
                      if (gameSetsRefs)
                        await $_getPrefetchedData<
                          TeamPlayer,
                          $TeamPlayersTable,
                          GameSet
                        >(
                          currentTable: table,
                          referencedTable: $$TeamPlayersTableReferences
                              ._gameSetsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$TeamPlayersTableReferences(
                                db,
                                table,
                                p0,
                              ).gameSetsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.startingPlayerId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (setPointsRefs)
                        await $_getPrefetchedData<
                          TeamPlayer,
                          $TeamPlayersTable,
                          SetPoint
                        >(
                          currentTable: table,
                          referencedTable: $$TeamPlayersTableReferences
                              ._setPointsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$TeamPlayersTableReferences(
                                db,
                                table,
                                p0,
                              ).setPointsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.playerId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (ladderNightAbsencesRefs)
                        await $_getPrefetchedData<
                          TeamPlayer,
                          $TeamPlayersTable,
                          LadderNightAbsence
                        >(
                          currentTable: table,
                          referencedTable: $$TeamPlayersTableReferences
                              ._ladderNightAbsencesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$TeamPlayersTableReferences(
                                db,
                                table,
                                p0,
                              ).ladderNightAbsencesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.teamPlayerId == item.id,
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
        bool gameSetsRefs,
        bool setPointsRefs,
        bool ladderNightAbsencesRefs,
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

  static MultiTypedResultKey<
    $LadderNightAbsencesTable,
    List<LadderNightAbsence>
  >
  _ladderNightAbsencesRefsTable(_$LadderDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.ladderNightAbsences,
        aliasName: $_aliasNameGenerator(
          db.ladderNights.id,
          db.ladderNightAbsences.ladderNightId,
        ),
      );

  $$LadderNightAbsencesTableProcessedTableManager get ladderNightAbsencesRefs {
    final manager = $$LadderNightAbsencesTableTableManager(
      $_db,
      $_db.ladderNightAbsences,
    ).filter((f) => f.ladderNightId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _ladderNightAbsencesRefsTable($_db),
    );
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

  Expression<bool> ladderNightAbsencesRefs(
    Expression<bool> Function($$LadderNightAbsencesTableFilterComposer f) f,
  ) {
    final $$LadderNightAbsencesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.ladderNightAbsences,
      getReferencedColumn: (t) => t.ladderNightId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LadderNightAbsencesTableFilterComposer(
            $db: $db,
            $table: $db.ladderNightAbsences,
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

  Expression<T> ladderNightAbsencesRefs<T extends Object>(
    Expression<T> Function($$LadderNightAbsencesTableAnnotationComposer a) f,
  ) {
    final $$LadderNightAbsencesTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.ladderNightAbsences,
          getReferencedColumn: (t) => t.ladderNightId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$LadderNightAbsencesTableAnnotationComposer(
                $db: $db,
                $table: $db.ladderNightAbsences,
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
          PrefetchHooks Function({
            bool teamId,
            bool showdownGamesRefs,
            bool ladderNightAbsencesRefs,
          })
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
          prefetchHooksCallback:
              ({
                teamId = false,
                showdownGamesRefs = false,
                ladderNightAbsencesRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (showdownGamesRefs) db.showdownGames,
                    if (ladderNightAbsencesRefs) db.ladderNightAbsences,
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
                                        $$LadderNightsTableReferences
                                            ._teamIdTable(db),
                                    referencedColumn:
                                        $$LadderNightsTableReferences
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
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.ladderNightId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (ladderNightAbsencesRefs)
                        await $_getPrefetchedData<
                          LadderNight,
                          $LadderNightsTable,
                          LadderNightAbsence
                        >(
                          currentTable: table,
                          referencedTable: $$LadderNightsTableReferences
                              ._ladderNightAbsencesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$LadderNightsTableReferences(
                                db,
                                table,
                                p0,
                              ).ladderNightAbsencesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
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
      PrefetchHooks Function({
        bool teamId,
        bool showdownGamesRefs,
        bool ladderNightAbsencesRefs,
      })
    >;
typedef $$ShowdownGamesTableCreateCompanionBuilder =
    ShowdownGamesCompanion Function({
      Value<int> id,
      Value<DateTime> createdAt,
      required int ladderNightId,
      required int firstPlayerId,
      required int secondPlayerId,
      Value<DateTime?> lockedOn,
    });
typedef $$ShowdownGamesTableUpdateCompanionBuilder =
    ShowdownGamesCompanion Function({
      Value<int> id,
      Value<DateTime> createdAt,
      Value<int> ladderNightId,
      Value<int> firstPlayerId,
      Value<int> secondPlayerId,
      Value<DateTime?> lockedOn,
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

  static MultiTypedResultKey<$GameSetsTable, List<GameSet>> _gameSetsRefsTable(
    _$LadderDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.gameSets,
    aliasName: $_aliasNameGenerator(db.showdownGames.id, db.gameSets.gameId),
  );

  $$GameSetsTableProcessedTableManager get gameSetsRefs {
    final manager = $$GameSetsTableTableManager(
      $_db,
      $_db.gameSets,
    ).filter((f) => f.gameId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_gameSetsRefsTable($_db));
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

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lockedOn => $composableBuilder(
    column: $table.lockedOn,
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

  Expression<bool> gameSetsRefs(
    Expression<bool> Function($$GameSetsTableFilterComposer f) f,
  ) {
    final $$GameSetsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.gameSets,
      getReferencedColumn: (t) => t.gameId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GameSetsTableFilterComposer(
            $db: $db,
            $table: $db.gameSets,
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

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lockedOn => $composableBuilder(
    column: $table.lockedOn,
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

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get lockedOn =>
      $composableBuilder(column: $table.lockedOn, builder: (column) => column);

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

  Expression<T> gameSetsRefs<T extends Object>(
    Expression<T> Function($$GameSetsTableAnnotationComposer a) f,
  ) {
    final $$GameSetsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.gameSets,
      getReferencedColumn: (t) => t.gameId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GameSetsTableAnnotationComposer(
            $db: $db,
            $table: $db.gameSets,
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
            bool gameSetsRefs,
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
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> ladderNightId = const Value.absent(),
                Value<int> firstPlayerId = const Value.absent(),
                Value<int> secondPlayerId = const Value.absent(),
                Value<DateTime?> lockedOn = const Value.absent(),
              }) => ShowdownGamesCompanion(
                id: id,
                createdAt: createdAt,
                ladderNightId: ladderNightId,
                firstPlayerId: firstPlayerId,
                secondPlayerId: secondPlayerId,
                lockedOn: lockedOn,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                required int ladderNightId,
                required int firstPlayerId,
                required int secondPlayerId,
                Value<DateTime?> lockedOn = const Value.absent(),
              }) => ShowdownGamesCompanion.insert(
                id: id,
                createdAt: createdAt,
                ladderNightId: ladderNightId,
                firstPlayerId: firstPlayerId,
                secondPlayerId: secondPlayerId,
                lockedOn: lockedOn,
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
                gameSetsRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [if (gameSetsRefs) db.gameSets],
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
                      if (gameSetsRefs)
                        await $_getPrefetchedData<
                          ShowdownGame,
                          $ShowdownGamesTable,
                          GameSet
                        >(
                          currentTable: table,
                          referencedTable: $$ShowdownGamesTableReferences
                              ._gameSetsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ShowdownGamesTableReferences(
                                db,
                                table,
                                p0,
                              ).gameSetsRefs,
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
        bool gameSetsRefs,
      })
    >;
typedef $$GameSetsTableCreateCompanionBuilder =
    GameSetsCompanion Function({
      Value<int> id,
      required int startingPlayerId,
      required int gameId,
    });
typedef $$GameSetsTableUpdateCompanionBuilder =
    GameSetsCompanion Function({
      Value<int> id,
      Value<int> startingPlayerId,
      Value<int> gameId,
    });

final class $$GameSetsTableReferences
    extends BaseReferences<_$LadderDatabase, $GameSetsTable, GameSet> {
  $$GameSetsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $TeamPlayersTable _startingPlayerIdTable(_$LadderDatabase db) =>
      db.teamPlayers.createAlias(
        $_aliasNameGenerator(db.gameSets.startingPlayerId, db.teamPlayers.id),
      );

  $$TeamPlayersTableProcessedTableManager get startingPlayerId {
    final $_column = $_itemColumn<int>('starting_player_id')!;

    final manager = $$TeamPlayersTableTableManager(
      $_db,
      $_db.teamPlayers,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_startingPlayerIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $ShowdownGamesTable _gameIdTable(_$LadderDatabase db) =>
      db.showdownGames.createAlias(
        $_aliasNameGenerator(db.gameSets.gameId, db.showdownGames.id),
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

  static MultiTypedResultKey<$SetPointsTable, List<SetPoint>>
  _setPointsRefsTable(_$LadderDatabase db) => MultiTypedResultKey.fromTable(
    db.setPoints,
    aliasName: $_aliasNameGenerator(db.gameSets.id, db.setPoints.gameSetId),
  );

  $$SetPointsTableProcessedTableManager get setPointsRefs {
    final manager = $$SetPointsTableTableManager(
      $_db,
      $_db.setPoints,
    ).filter((f) => f.gameSetId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_setPointsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$GameSetsTableFilterComposer
    extends Composer<_$LadderDatabase, $GameSetsTable> {
  $$GameSetsTableFilterComposer({
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

  $$TeamPlayersTableFilterComposer get startingPlayerId {
    final $$TeamPlayersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.startingPlayerId,
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

  Expression<bool> setPointsRefs(
    Expression<bool> Function($$SetPointsTableFilterComposer f) f,
  ) {
    final $$SetPointsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.setPoints,
      getReferencedColumn: (t) => t.gameSetId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SetPointsTableFilterComposer(
            $db: $db,
            $table: $db.setPoints,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$GameSetsTableOrderingComposer
    extends Composer<_$LadderDatabase, $GameSetsTable> {
  $$GameSetsTableOrderingComposer({
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

  $$TeamPlayersTableOrderingComposer get startingPlayerId {
    final $$TeamPlayersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.startingPlayerId,
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
}

class $$GameSetsTableAnnotationComposer
    extends Composer<_$LadderDatabase, $GameSetsTable> {
  $$GameSetsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  $$TeamPlayersTableAnnotationComposer get startingPlayerId {
    final $$TeamPlayersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.startingPlayerId,
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

  Expression<T> setPointsRefs<T extends Object>(
    Expression<T> Function($$SetPointsTableAnnotationComposer a) f,
  ) {
    final $$SetPointsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.setPoints,
      getReferencedColumn: (t) => t.gameSetId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SetPointsTableAnnotationComposer(
            $db: $db,
            $table: $db.setPoints,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$GameSetsTableTableManager
    extends
        RootTableManager<
          _$LadderDatabase,
          $GameSetsTable,
          GameSet,
          $$GameSetsTableFilterComposer,
          $$GameSetsTableOrderingComposer,
          $$GameSetsTableAnnotationComposer,
          $$GameSetsTableCreateCompanionBuilder,
          $$GameSetsTableUpdateCompanionBuilder,
          (GameSet, $$GameSetsTableReferences),
          GameSet,
          PrefetchHooks Function({
            bool startingPlayerId,
            bool gameId,
            bool setPointsRefs,
          })
        > {
  $$GameSetsTableTableManager(_$LadderDatabase db, $GameSetsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$GameSetsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$GameSetsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$GameSetsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> startingPlayerId = const Value.absent(),
                Value<int> gameId = const Value.absent(),
              }) => GameSetsCompanion(
                id: id,
                startingPlayerId: startingPlayerId,
                gameId: gameId,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int startingPlayerId,
                required int gameId,
              }) => GameSetsCompanion.insert(
                id: id,
                startingPlayerId: startingPlayerId,
                gameId: gameId,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$GameSetsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                startingPlayerId = false,
                gameId = false,
                setPointsRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [if (setPointsRefs) db.setPoints],
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
                        if (startingPlayerId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.startingPlayerId,
                                    referencedTable: $$GameSetsTableReferences
                                        ._startingPlayerIdTable(db),
                                    referencedColumn: $$GameSetsTableReferences
                                        ._startingPlayerIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }
                        if (gameId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.gameId,
                                    referencedTable: $$GameSetsTableReferences
                                        ._gameIdTable(db),
                                    referencedColumn: $$GameSetsTableReferences
                                        ._gameIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (setPointsRefs)
                        await $_getPrefetchedData<
                          GameSet,
                          $GameSetsTable,
                          SetPoint
                        >(
                          currentTable: table,
                          referencedTable: $$GameSetsTableReferences
                              ._setPointsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$GameSetsTableReferences(
                                db,
                                table,
                                p0,
                              ).setPointsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.gameSetId == item.id,
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

typedef $$GameSetsTableProcessedTableManager =
    ProcessedTableManager<
      _$LadderDatabase,
      $GameSetsTable,
      GameSet,
      $$GameSetsTableFilterComposer,
      $$GameSetsTableOrderingComposer,
      $$GameSetsTableAnnotationComposer,
      $$GameSetsTableCreateCompanionBuilder,
      $$GameSetsTableUpdateCompanionBuilder,
      (GameSet, $$GameSetsTableReferences),
      GameSet,
      PrefetchHooks Function({
        bool startingPlayerId,
        bool gameId,
        bool setPointsRefs,
      })
    >;
typedef $$SetPointsTableCreateCompanionBuilder =
    SetPointsCompanion Function({
      Value<int> id,
      Value<DateTime> createdAt,
      required int playerId,
      required int gameSetId,
      required int pointId,
    });
typedef $$SetPointsTableUpdateCompanionBuilder =
    SetPointsCompanion Function({
      Value<int> id,
      Value<DateTime> createdAt,
      Value<int> playerId,
      Value<int> gameSetId,
      Value<int> pointId,
    });

final class $$SetPointsTableReferences
    extends BaseReferences<_$LadderDatabase, $SetPointsTable, SetPoint> {
  $$SetPointsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $TeamPlayersTable _playerIdTable(_$LadderDatabase db) =>
      db.teamPlayers.createAlias(
        $_aliasNameGenerator(db.setPoints.playerId, db.teamPlayers.id),
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

  static $GameSetsTable _gameSetIdTable(_$LadderDatabase db) =>
      db.gameSets.createAlias(
        $_aliasNameGenerator(db.setPoints.gameSetId, db.gameSets.id),
      );

  $$GameSetsTableProcessedTableManager get gameSetId {
    final $_column = $_itemColumn<int>('game_set_id')!;

    final manager = $$GameSetsTableTableManager(
      $_db,
      $_db.gameSets,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_gameSetIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $ShowdownPointsTable _pointIdTable(_$LadderDatabase db) =>
      db.showdownPoints.createAlias(
        $_aliasNameGenerator(db.setPoints.pointId, db.showdownPoints.id),
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

class $$SetPointsTableFilterComposer
    extends Composer<_$LadderDatabase, $SetPointsTable> {
  $$SetPointsTableFilterComposer({
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

  $$GameSetsTableFilterComposer get gameSetId {
    final $$GameSetsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.gameSetId,
      referencedTable: $db.gameSets,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GameSetsTableFilterComposer(
            $db: $db,
            $table: $db.gameSets,
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

class $$SetPointsTableOrderingComposer
    extends Composer<_$LadderDatabase, $SetPointsTable> {
  $$SetPointsTableOrderingComposer({
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

  $$GameSetsTableOrderingComposer get gameSetId {
    final $$GameSetsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.gameSetId,
      referencedTable: $db.gameSets,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GameSetsTableOrderingComposer(
            $db: $db,
            $table: $db.gameSets,
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

class $$SetPointsTableAnnotationComposer
    extends Composer<_$LadderDatabase, $SetPointsTable> {
  $$SetPointsTableAnnotationComposer({
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

  $$GameSetsTableAnnotationComposer get gameSetId {
    final $$GameSetsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.gameSetId,
      referencedTable: $db.gameSets,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GameSetsTableAnnotationComposer(
            $db: $db,
            $table: $db.gameSets,
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

class $$SetPointsTableTableManager
    extends
        RootTableManager<
          _$LadderDatabase,
          $SetPointsTable,
          SetPoint,
          $$SetPointsTableFilterComposer,
          $$SetPointsTableOrderingComposer,
          $$SetPointsTableAnnotationComposer,
          $$SetPointsTableCreateCompanionBuilder,
          $$SetPointsTableUpdateCompanionBuilder,
          (SetPoint, $$SetPointsTableReferences),
          SetPoint,
          PrefetchHooks Function({bool playerId, bool gameSetId, bool pointId})
        > {
  $$SetPointsTableTableManager(_$LadderDatabase db, $SetPointsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SetPointsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SetPointsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SetPointsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> playerId = const Value.absent(),
                Value<int> gameSetId = const Value.absent(),
                Value<int> pointId = const Value.absent(),
              }) => SetPointsCompanion(
                id: id,
                createdAt: createdAt,
                playerId: playerId,
                gameSetId: gameSetId,
                pointId: pointId,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                required int playerId,
                required int gameSetId,
                required int pointId,
              }) => SetPointsCompanion.insert(
                id: id,
                createdAt: createdAt,
                playerId: playerId,
                gameSetId: gameSetId,
                pointId: pointId,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$SetPointsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({playerId = false, gameSetId = false, pointId = false}) {
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
                                    referencedTable: $$SetPointsTableReferences
                                        ._playerIdTable(db),
                                    referencedColumn: $$SetPointsTableReferences
                                        ._playerIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }
                        if (gameSetId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.gameSetId,
                                    referencedTable: $$SetPointsTableReferences
                                        ._gameSetIdTable(db),
                                    referencedColumn: $$SetPointsTableReferences
                                        ._gameSetIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }
                        if (pointId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.pointId,
                                    referencedTable: $$SetPointsTableReferences
                                        ._pointIdTable(db),
                                    referencedColumn: $$SetPointsTableReferences
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

typedef $$SetPointsTableProcessedTableManager =
    ProcessedTableManager<
      _$LadderDatabase,
      $SetPointsTable,
      SetPoint,
      $$SetPointsTableFilterComposer,
      $$SetPointsTableOrderingComposer,
      $$SetPointsTableAnnotationComposer,
      $$SetPointsTableCreateCompanionBuilder,
      $$SetPointsTableUpdateCompanionBuilder,
      (SetPoint, $$SetPointsTableReferences),
      SetPoint,
      PrefetchHooks Function({bool playerId, bool gameSetId, bool pointId})
    >;
typedef $$LadderNightAbsencesTableCreateCompanionBuilder =
    LadderNightAbsencesCompanion Function({
      Value<int> id,
      required int teamPlayerId,
      required int ladderNightId,
    });
typedef $$LadderNightAbsencesTableUpdateCompanionBuilder =
    LadderNightAbsencesCompanion Function({
      Value<int> id,
      Value<int> teamPlayerId,
      Value<int> ladderNightId,
    });

final class $$LadderNightAbsencesTableReferences
    extends
        BaseReferences<
          _$LadderDatabase,
          $LadderNightAbsencesTable,
          LadderNightAbsence
        > {
  $$LadderNightAbsencesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $TeamPlayersTable _teamPlayerIdTable(_$LadderDatabase db) =>
      db.teamPlayers.createAlias(
        $_aliasNameGenerator(
          db.ladderNightAbsences.teamPlayerId,
          db.teamPlayers.id,
        ),
      );

  $$TeamPlayersTableProcessedTableManager get teamPlayerId {
    final $_column = $_itemColumn<int>('team_player_id')!;

    final manager = $$TeamPlayersTableTableManager(
      $_db,
      $_db.teamPlayers,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_teamPlayerIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $LadderNightsTable _ladderNightIdTable(_$LadderDatabase db) =>
      db.ladderNights.createAlias(
        $_aliasNameGenerator(
          db.ladderNightAbsences.ladderNightId,
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
}

class $$LadderNightAbsencesTableFilterComposer
    extends Composer<_$LadderDatabase, $LadderNightAbsencesTable> {
  $$LadderNightAbsencesTableFilterComposer({
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

  $$TeamPlayersTableFilterComposer get teamPlayerId {
    final $$TeamPlayersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.teamPlayerId,
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
}

class $$LadderNightAbsencesTableOrderingComposer
    extends Composer<_$LadderDatabase, $LadderNightAbsencesTable> {
  $$LadderNightAbsencesTableOrderingComposer({
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

  $$TeamPlayersTableOrderingComposer get teamPlayerId {
    final $$TeamPlayersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.teamPlayerId,
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
}

class $$LadderNightAbsencesTableAnnotationComposer
    extends Composer<_$LadderDatabase, $LadderNightAbsencesTable> {
  $$LadderNightAbsencesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  $$TeamPlayersTableAnnotationComposer get teamPlayerId {
    final $$TeamPlayersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.teamPlayerId,
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
}

class $$LadderNightAbsencesTableTableManager
    extends
        RootTableManager<
          _$LadderDatabase,
          $LadderNightAbsencesTable,
          LadderNightAbsence,
          $$LadderNightAbsencesTableFilterComposer,
          $$LadderNightAbsencesTableOrderingComposer,
          $$LadderNightAbsencesTableAnnotationComposer,
          $$LadderNightAbsencesTableCreateCompanionBuilder,
          $$LadderNightAbsencesTableUpdateCompanionBuilder,
          (LadderNightAbsence, $$LadderNightAbsencesTableReferences),
          LadderNightAbsence,
          PrefetchHooks Function({bool teamPlayerId, bool ladderNightId})
        > {
  $$LadderNightAbsencesTableTableManager(
    _$LadderDatabase db,
    $LadderNightAbsencesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LadderNightAbsencesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LadderNightAbsencesTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$LadderNightAbsencesTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> teamPlayerId = const Value.absent(),
                Value<int> ladderNightId = const Value.absent(),
              }) => LadderNightAbsencesCompanion(
                id: id,
                teamPlayerId: teamPlayerId,
                ladderNightId: ladderNightId,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int teamPlayerId,
                required int ladderNightId,
              }) => LadderNightAbsencesCompanion.insert(
                id: id,
                teamPlayerId: teamPlayerId,
                ladderNightId: ladderNightId,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$LadderNightAbsencesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({teamPlayerId = false, ladderNightId = false}) {
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
                        if (teamPlayerId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.teamPlayerId,
                                    referencedTable:
                                        $$LadderNightAbsencesTableReferences
                                            ._teamPlayerIdTable(db),
                                    referencedColumn:
                                        $$LadderNightAbsencesTableReferences
                                            ._teamPlayerIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (ladderNightId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.ladderNightId,
                                    referencedTable:
                                        $$LadderNightAbsencesTableReferences
                                            ._ladderNightIdTable(db),
                                    referencedColumn:
                                        $$LadderNightAbsencesTableReferences
                                            ._ladderNightIdTable(db)
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

typedef $$LadderNightAbsencesTableProcessedTableManager =
    ProcessedTableManager<
      _$LadderDatabase,
      $LadderNightAbsencesTable,
      LadderNightAbsence,
      $$LadderNightAbsencesTableFilterComposer,
      $$LadderNightAbsencesTableOrderingComposer,
      $$LadderNightAbsencesTableAnnotationComposer,
      $$LadderNightAbsencesTableCreateCompanionBuilder,
      $$LadderNightAbsencesTableUpdateCompanionBuilder,
      (LadderNightAbsence, $$LadderNightAbsencesTableReferences),
      LadderNightAbsence,
      PrefetchHooks Function({bool teamPlayerId, bool ladderNightId})
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
  $$GameSetsTableTableManager get gameSets =>
      $$GameSetsTableTableManager(_db, _db.gameSets);
  $$SetPointsTableTableManager get setPoints =>
      $$SetPointsTableTableManager(_db, _db.setPoints);
  $$LadderNightAbsencesTableTableManager get ladderNightAbsences =>
      $$LadderNightAbsencesTableTableManager(_db, _db.ladderNightAbsences);
}
