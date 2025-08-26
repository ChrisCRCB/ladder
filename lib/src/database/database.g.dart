// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $ShowdownTeamsTable extends ShowdownTeams with TableInfo<$ShowdownTeamsTable, ShowdownTeam>{
@override final GeneratedDatabase attachedDatabase;
final String? _alias;
$ShowdownTeamsTable(this.attachedDatabase, [this._alias]);
static const VerificationMeta _lastAccessedMeta = const VerificationMeta('lastAccessed');
@override
late final GeneratedColumn<DateTime> lastAccessed = GeneratedColumn<DateTime>('last_accessed', aliasedName, false, type: DriftSqlType.dateTime, requiredDuringInsert: false, defaultValue: currentDateAndTime);
static const VerificationMeta _sessionsPerCycleMeta = const VerificationMeta('sessionsPerCycle');
@override
late final GeneratedColumn<int> sessionsPerCycle = GeneratedColumn<int>('sessions_per_cycle', aliasedName, false, type: DriftSqlType.int, requiredDuringInsert: false, defaultValue: const Constant(6));
@override
List<GeneratedColumn> get $columns => [lastAccessed, sessionsPerCycle];
@override
String get aliasedName => _alias ?? actualTableName;
@override
 String get actualTableName => $name;
static const String $name = 'showdown_teams';
@override
VerificationContext validateIntegrity(Insertable<ShowdownTeam> instance, {bool isInserting = false}) {
final context = VerificationContext();
final data = instance.toColumns(true);
if (data.containsKey('last_accessed')) {
context.handle(_lastAccessedMeta, lastAccessed.isAcceptableOrUnknown(data['last_accessed']!, _lastAccessedMeta));}if (data.containsKey('sessions_per_cycle')) {
context.handle(_sessionsPerCycleMeta, sessionsPerCycle.isAcceptableOrUnknown(data['sessions_per_cycle']!, _sessionsPerCycleMeta));}return context;
}
@override
Set<GeneratedColumn> get $primaryKey => const {};@override ShowdownTeam map(Map<String, dynamic> data, {String? tablePrefix})  {
final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';return ShowdownTeam(lastAccessed: attachedDatabase.typeMapping.read(DriftSqlType.dateTime, data['${effectivePrefix}last_accessed'])!, sessionsPerCycle: attachedDatabase.typeMapping.read(DriftSqlType.int, data['${effectivePrefix}sessions_per_cycle'])!, );
}
@override
$ShowdownTeamsTable createAlias(String alias) {
return $ShowdownTeamsTable(attachedDatabase, alias);}}class ShowdownTeam extends DataClass implements Insertable<ShowdownTeam> 
{
/// The last time this team was accessed.
final DateTime lastAccessed;
/// How many sessions should be taken into account when calculating stats.
final int sessionsPerCycle;
const ShowdownTeam({required this.lastAccessed, required this.sessionsPerCycle});@override
Map<String, Expression> toColumns(bool nullToAbsent) {
final map = <String, Expression> {};map['last_accessed'] = Variable<DateTime>(lastAccessed);
map['sessions_per_cycle'] = Variable<int>(sessionsPerCycle);
return map; 
}
ShowdownTeamsCompanion toCompanion(bool nullToAbsent) {
return ShowdownTeamsCompanion(lastAccessed: Value(lastAccessed),sessionsPerCycle: Value(sessionsPerCycle),);
}
factory ShowdownTeam.fromJson(Map<String, dynamic> json, {ValueSerializer? serializer}) {
serializer ??= driftRuntimeOptions.defaultSerializer;
return ShowdownTeam(lastAccessed: serializer.fromJson<DateTime>(json['lastAccessed']),sessionsPerCycle: serializer.fromJson<int>(json['sessionsPerCycle']),);}
@override Map<String, dynamic> toJson({ValueSerializer? serializer}) {
serializer ??= driftRuntimeOptions.defaultSerializer;
return <String, dynamic>{
'lastAccessed': serializer.toJson<DateTime>(lastAccessed),'sessionsPerCycle': serializer.toJson<int>(sessionsPerCycle),};}ShowdownTeam copyWith({DateTime? lastAccessed,int? sessionsPerCycle}) => ShowdownTeam(lastAccessed: lastAccessed ?? this.lastAccessed,sessionsPerCycle: sessionsPerCycle ?? this.sessionsPerCycle,);ShowdownTeam copyWithCompanion(ShowdownTeamsCompanion data) {
return ShowdownTeam(
lastAccessed: data.lastAccessed.present ? data.lastAccessed.value : this.lastAccessed,sessionsPerCycle: data.sessionsPerCycle.present ? data.sessionsPerCycle.value : this.sessionsPerCycle,);
}
@override
String toString() {return (StringBuffer('ShowdownTeam(')..write('lastAccessed: $lastAccessed, ')..write('sessionsPerCycle: $sessionsPerCycle')..write(')')).toString();}
@override
 int get hashCode => Object.hash(lastAccessed, sessionsPerCycle);@override
bool operator ==(Object other) => identical(this, other) || (other is ShowdownTeam && other.lastAccessed == this.lastAccessed && other.sessionsPerCycle == this.sessionsPerCycle);
}class ShowdownTeamsCompanion extends UpdateCompanion<ShowdownTeam> {
final Value<DateTime> lastAccessed;
final Value<int> sessionsPerCycle;
final Value<int> rowid;
const ShowdownTeamsCompanion({this.lastAccessed = const Value.absent(),this.sessionsPerCycle = const Value.absent(),this.rowid = const Value.absent(),});
ShowdownTeamsCompanion.insert({this.lastAccessed = const Value.absent(),this.sessionsPerCycle = const Value.absent(),this.rowid = const Value.absent(),});
static Insertable<ShowdownTeam> custom({Expression<DateTime>? lastAccessed, 
Expression<int>? sessionsPerCycle, 
Expression<int>? rowid, 
}) {
return RawValuesInsertable({if (lastAccessed != null)'last_accessed': lastAccessed,if (sessionsPerCycle != null)'sessions_per_cycle': sessionsPerCycle,if (rowid != null)'rowid': rowid,});
}ShowdownTeamsCompanion copyWith({Value<DateTime>? lastAccessed, Value<int>? sessionsPerCycle, Value<int>? rowid}) {
return ShowdownTeamsCompanion(lastAccessed: lastAccessed ?? this.lastAccessed,sessionsPerCycle: sessionsPerCycle ?? this.sessionsPerCycle,rowid: rowid ?? this.rowid,);
}
@override
Map<String, Expression> toColumns(bool nullToAbsent) {
final map = <String, Expression> {};if (lastAccessed.present) {
map['last_accessed'] = Variable<DateTime>(lastAccessed.value);}
if (sessionsPerCycle.present) {
map['sessions_per_cycle'] = Variable<int>(sessionsPerCycle.value);}
if (rowid.present) {
map['rowid'] = Variable<int>(rowid.value);}
return map; 
}
@override
String toString() {return (StringBuffer('ShowdownTeamsCompanion(')..write('lastAccessed: $lastAccessed, ')..write('sessionsPerCycle: $sessionsPerCycle, ')..write('rowid: $rowid')..write(')')).toString();}
}
class $ShowdownPointsTable extends ShowdownPoints with TableInfo<$ShowdownPointsTable, ShowdownPoint>{
@override final GeneratedDatabase attachedDatabase;
final String? _alias;
$ShowdownPointsTable(this.attachedDatabase, [this._alias]);
static const VerificationMeta _valueMeta = const VerificationMeta('value');
@override
late final GeneratedColumn<int> value = GeneratedColumn<int>('value', aliasedName, false, type: DriftSqlType.int, requiredDuringInsert: true);
@override
List<GeneratedColumn> get $columns => [value];
@override
String get aliasedName => _alias ?? actualTableName;
@override
 String get actualTableName => $name;
static const String $name = 'showdown_points';
@override
VerificationContext validateIntegrity(Insertable<ShowdownPoint> instance, {bool isInserting = false}) {
final context = VerificationContext();
final data = instance.toColumns(true);
if (data.containsKey('value')) {
context.handle(_valueMeta, value.isAcceptableOrUnknown(data['value']!, _valueMeta));} else if (isInserting) {
context.missing(_valueMeta);
}
return context;
}
@override
Set<GeneratedColumn> get $primaryKey => const {};@override ShowdownPoint map(Map<String, dynamic> data, {String? tablePrefix})  {
final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';return ShowdownPoint(value: attachedDatabase.typeMapping.read(DriftSqlType.int, data['${effectivePrefix}value'])!, );
}
@override
$ShowdownPointsTable createAlias(String alias) {
return $ShowdownPointsTable(attachedDatabase, alias);}}class ShowdownPoint extends DataClass implements Insertable<ShowdownPoint> 
{
/// How many points this ending is worth.
///
///  If [value] is < 0, then this ending gives the points to the opponent.
final int value;
const ShowdownPoint({required this.value});@override
Map<String, Expression> toColumns(bool nullToAbsent) {
final map = <String, Expression> {};map['value'] = Variable<int>(value);
return map; 
}
ShowdownPointsCompanion toCompanion(bool nullToAbsent) {
return ShowdownPointsCompanion(value: Value(value),);
}
factory ShowdownPoint.fromJson(Map<String, dynamic> json, {ValueSerializer? serializer}) {
serializer ??= driftRuntimeOptions.defaultSerializer;
return ShowdownPoint(value: serializer.fromJson<int>(json['value']),);}
@override Map<String, dynamic> toJson({ValueSerializer? serializer}) {
serializer ??= driftRuntimeOptions.defaultSerializer;
return <String, dynamic>{
'value': serializer.toJson<int>(value),};}ShowdownPoint copyWith({int? value}) => ShowdownPoint(value: value ?? this.value,);ShowdownPoint copyWithCompanion(ShowdownPointsCompanion data) {
return ShowdownPoint(
value: data.value.present ? data.value.value : this.value,);
}
@override
String toString() {return (StringBuffer('ShowdownPoint(')..write('value: $value')..write(')')).toString();}
@override
 int get hashCode => value.hashCode;@override
bool operator ==(Object other) => identical(this, other) || (other is ShowdownPoint && other.value == this.value);
}class ShowdownPointsCompanion extends UpdateCompanion<ShowdownPoint> {
final Value<int> value;
final Value<int> rowid;
const ShowdownPointsCompanion({this.value = const Value.absent(),this.rowid = const Value.absent(),});
ShowdownPointsCompanion.insert({required int value,this.rowid = const Value.absent(),}): value = Value(value);
static Insertable<ShowdownPoint> custom({Expression<int>? value, 
Expression<int>? rowid, 
}) {
return RawValuesInsertable({if (value != null)'value': value,if (rowid != null)'rowid': rowid,});
}ShowdownPointsCompanion copyWith({Value<int>? value, Value<int>? rowid}) {
return ShowdownPointsCompanion(value: value ?? this.value,rowid: rowid ?? this.rowid,);
}
@override
Map<String, Expression> toColumns(bool nullToAbsent) {
final map = <String, Expression> {};if (value.present) {
map['value'] = Variable<int>(value.value);}
if (rowid.present) {
map['rowid'] = Variable<int>(rowid.value);}
return map; 
}
@override
String toString() {return (StringBuffer('ShowdownPointsCompanion(')..write('value: $value, ')..write('rowid: $rowid')..write(')')).toString();}
}
class $TeamPlayersTable extends TeamPlayers with TableInfo<$TeamPlayersTable, TeamPlayer>{
@override final GeneratedDatabase attachedDatabase;
final String? _alias;
$TeamPlayersTable(this.attachedDatabase, [this._alias]);
@override
List<GeneratedColumn> get $columns => [];
@override
String get aliasedName => _alias ?? actualTableName;
@override
 String get actualTableName => $name;
static const String $name = 'team_players';
@override
Set<GeneratedColumn> get $primaryKey => const {};@override TeamPlayer map(Map<String, dynamic> data, {String? tablePrefix})  {
final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';return TeamPlayer();
}
@override
$TeamPlayersTable createAlias(String alias) {
return $TeamPlayersTable(attachedDatabase, alias);}}class TeamPlayer extends DataClass implements Insertable<TeamPlayer> 
{
const TeamPlayer({});@override
Map<String, Expression> toColumns(bool nullToAbsent) {
final map = <String, Expression> {};return map; 
}
TeamPlayersCompanion toCompanion(bool nullToAbsent) {
return TeamPlayersCompanion();
}
factory TeamPlayer.fromJson(Map<String, dynamic> json, {ValueSerializer? serializer}) {
serializer ??= driftRuntimeOptions.defaultSerializer;
return TeamPlayer();}
@override Map<String, dynamic> toJson({ValueSerializer? serializer}) {
serializer ??= driftRuntimeOptions.defaultSerializer;
return <String, dynamic>{
};}TeamPlayer copyWith({}) => TeamPlayer();TeamPlayer copyWithCompanion(TeamPlayersCompanion data) {
return TeamPlayer(
);
}
@override
String toString() {return (StringBuffer('TeamPlayer(')..write(')')).toString();}
@override
 int get hashCode => identityHashCode(this);@override
bool operator ==(Object other) => identical(this, other) || (other is TeamPlayer);
}class TeamPlayersCompanion extends UpdateCompanion<TeamPlayer> {
final Value<int> rowid;
const TeamPlayersCompanion({this.rowid = const Value.absent(),});
TeamPlayersCompanion.insert({this.rowid = const Value.absent(),});
static Insertable<TeamPlayer> custom({Expression<int>? rowid, 
}) {
return RawValuesInsertable({if (rowid != null)'rowid': rowid,});
}TeamPlayersCompanion copyWith({Value<int>? rowid}) {
return TeamPlayersCompanion(rowid: rowid ?? this.rowid,);
}
@override
Map<String, Expression> toColumns(bool nullToAbsent) {
final map = <String, Expression> {};if (rowid.present) {
map['rowid'] = Variable<int>(rowid.value);}
return map; 
}
@override
String toString() {return (StringBuffer('TeamPlayersCompanion(')..write('rowid: $rowid')..write(')')).toString();}
}
abstract class _$LadderDatabase extends GeneratedDatabase{
_$LadderDatabase(QueryExecutor e): super(e);
$LadderDatabaseManager get managers => $LadderDatabaseManager(this);
late final $ShowdownTeamsTable showdownTeams = $ShowdownTeamsTable(this);
late final $ShowdownPointsTable showdownPoints = $ShowdownPointsTable(this);
late final $TeamPlayersTable teamPlayers = $TeamPlayersTable(this);
@override
Iterable<TableInfo<Table, Object?>> get allTables => allSchemaEntities.whereType<TableInfo<Table, Object?>>();
@override
List<DatabaseSchemaEntity> get allSchemaEntities => [showdownTeams, showdownPoints, teamPlayers];
}
typedef $$ShowdownTeamsTableCreateCompanionBuilder = ShowdownTeamsCompanion Function({Value<DateTime> lastAccessed,Value<int> sessionsPerCycle,Value<int> rowid,});
typedef $$ShowdownTeamsTableUpdateCompanionBuilder = ShowdownTeamsCompanion Function({Value<DateTime> lastAccessed,Value<int> sessionsPerCycle,Value<int> rowid,});
class $$ShowdownTeamsTableFilterComposer extends Composer<
        _$LadderDatabase,
        $ShowdownTeamsTable> {
        $$ShowdownTeamsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
          ColumnFilters<DateTime> get lastAccessed => $composableBuilder(
      column: $table.lastAccessed,
      builder: (column) =>
      ColumnFilters(column));
      
ColumnFilters<int> get sessionsPerCycle => $composableBuilder(
      column: $table.sessionsPerCycle,
      builder: (column) =>
      ColumnFilters(column));
      
        }
      class $$ShowdownTeamsTableOrderingComposer extends Composer<
        _$LadderDatabase,
        $ShowdownTeamsTable> {
        $$ShowdownTeamsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
          ColumnOrderings<DateTime> get lastAccessed => $composableBuilder(
      column: $table.lastAccessed,
      builder: (column) =>
      ColumnOrderings(column));
      
ColumnOrderings<int> get sessionsPerCycle => $composableBuilder(
      column: $table.sessionsPerCycle,
      builder: (column) =>
      ColumnOrderings(column));
      
        }
      class $$ShowdownTeamsTableAnnotationComposer extends Composer<
        _$LadderDatabase,
        $ShowdownTeamsTable> {
        $$ShowdownTeamsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
          GeneratedColumn<DateTime> get lastAccessed => $composableBuilder(
      column: $table.lastAccessed,
      builder: (column) => column);
      
GeneratedColumn<int> get sessionsPerCycle => $composableBuilder(
      column: $table.sessionsPerCycle,
      builder: (column) => column);
      
        }
      class $$ShowdownTeamsTableTableManager extends RootTableManager    <_$LadderDatabase,
    $ShowdownTeamsTable,
    ShowdownTeam,
    $$ShowdownTeamsTableFilterComposer,
    $$ShowdownTeamsTableOrderingComposer,
    $$ShowdownTeamsTableAnnotationComposer,
    $$ShowdownTeamsTableCreateCompanionBuilder,
    $$ShowdownTeamsTableUpdateCompanionBuilder,
    (ShowdownTeam,BaseReferences<_$LadderDatabase,$ShowdownTeamsTable,ShowdownTeam>),
    ShowdownTeam,
    PrefetchHooks Function()
    > {
    $$ShowdownTeamsTableTableManager(_$LadderDatabase db, $ShowdownTeamsTable table) : super(
      TableManagerState(
        db: db,
        table: table,
        createFilteringComposer: () => $$ShowdownTeamsTableFilterComposer($db: db,$table:table),
        createOrderingComposer: () => $$ShowdownTeamsTableOrderingComposer($db: db,$table:table),
        createComputedFieldComposer: () => $$ShowdownTeamsTableAnnotationComposer($db: db,$table:table),
        updateCompanionCallback: ({Value<DateTime> lastAccessed = const Value.absent(),Value<int> sessionsPerCycle = const Value.absent(),Value<int> rowid = const Value.absent(),})=> ShowdownTeamsCompanion(lastAccessed: lastAccessed,sessionsPerCycle: sessionsPerCycle,rowid: rowid,),
        createCompanionCallback: ({Value<DateTime> lastAccessed = const Value.absent(),Value<int> sessionsPerCycle = const Value.absent(),Value<int> rowid = const Value.absent(),})=> ShowdownTeamsCompanion.insert(lastAccessed: lastAccessed,sessionsPerCycle: sessionsPerCycle,rowid: rowid,),
        withReferenceMapper: (p0) => p0
              .map(
                  (e) =>
                     (e.readTable(table), BaseReferences(db, table, e))
                  )
              .toList(),
        prefetchHooksCallback: null,
        ));
        }
    typedef $$ShowdownTeamsTableProcessedTableManager = ProcessedTableManager    <_$LadderDatabase,
    $ShowdownTeamsTable,
    ShowdownTeam,
    $$ShowdownTeamsTableFilterComposer,
    $$ShowdownTeamsTableOrderingComposer,
    $$ShowdownTeamsTableAnnotationComposer,
    $$ShowdownTeamsTableCreateCompanionBuilder,
    $$ShowdownTeamsTableUpdateCompanionBuilder,
    (ShowdownTeam,BaseReferences<_$LadderDatabase,$ShowdownTeamsTable,ShowdownTeam>),
    ShowdownTeam,
    PrefetchHooks Function()
    >;typedef $$ShowdownPointsTableCreateCompanionBuilder = ShowdownPointsCompanion Function({required int value,Value<int> rowid,});
typedef $$ShowdownPointsTableUpdateCompanionBuilder = ShowdownPointsCompanion Function({Value<int> value,Value<int> rowid,});
class $$ShowdownPointsTableFilterComposer extends Composer<
        _$LadderDatabase,
        $ShowdownPointsTable> {
        $$ShowdownPointsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
          ColumnFilters<int> get value => $composableBuilder(
      column: $table.value,
      builder: (column) =>
      ColumnFilters(column));
      
        }
      class $$ShowdownPointsTableOrderingComposer extends Composer<
        _$LadderDatabase,
        $ShowdownPointsTable> {
        $$ShowdownPointsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
          ColumnOrderings<int> get value => $composableBuilder(
      column: $table.value,
      builder: (column) =>
      ColumnOrderings(column));
      
        }
      class $$ShowdownPointsTableAnnotationComposer extends Composer<
        _$LadderDatabase,
        $ShowdownPointsTable> {
        $$ShowdownPointsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
          GeneratedColumn<int> get value => $composableBuilder(
      column: $table.value,
      builder: (column) => column);
      
        }
      class $$ShowdownPointsTableTableManager extends RootTableManager    <_$LadderDatabase,
    $ShowdownPointsTable,
    ShowdownPoint,
    $$ShowdownPointsTableFilterComposer,
    $$ShowdownPointsTableOrderingComposer,
    $$ShowdownPointsTableAnnotationComposer,
    $$ShowdownPointsTableCreateCompanionBuilder,
    $$ShowdownPointsTableUpdateCompanionBuilder,
    (ShowdownPoint,BaseReferences<_$LadderDatabase,$ShowdownPointsTable,ShowdownPoint>),
    ShowdownPoint,
    PrefetchHooks Function()
    > {
    $$ShowdownPointsTableTableManager(_$LadderDatabase db, $ShowdownPointsTable table) : super(
      TableManagerState(
        db: db,
        table: table,
        createFilteringComposer: () => $$ShowdownPointsTableFilterComposer($db: db,$table:table),
        createOrderingComposer: () => $$ShowdownPointsTableOrderingComposer($db: db,$table:table),
        createComputedFieldComposer: () => $$ShowdownPointsTableAnnotationComposer($db: db,$table:table),
        updateCompanionCallback: ({Value<int> value = const Value.absent(),Value<int> rowid = const Value.absent(),})=> ShowdownPointsCompanion(value: value,rowid: rowid,),
        createCompanionCallback: ({required int value,Value<int> rowid = const Value.absent(),})=> ShowdownPointsCompanion.insert(value: value,rowid: rowid,),
        withReferenceMapper: (p0) => p0
              .map(
                  (e) =>
                     (e.readTable(table), BaseReferences(db, table, e))
                  )
              .toList(),
        prefetchHooksCallback: null,
        ));
        }
    typedef $$ShowdownPointsTableProcessedTableManager = ProcessedTableManager    <_$LadderDatabase,
    $ShowdownPointsTable,
    ShowdownPoint,
    $$ShowdownPointsTableFilterComposer,
    $$ShowdownPointsTableOrderingComposer,
    $$ShowdownPointsTableAnnotationComposer,
    $$ShowdownPointsTableCreateCompanionBuilder,
    $$ShowdownPointsTableUpdateCompanionBuilder,
    (ShowdownPoint,BaseReferences<_$LadderDatabase,$ShowdownPointsTable,ShowdownPoint>),
    ShowdownPoint,
    PrefetchHooks Function()
    >;typedef $$TeamPlayersTableCreateCompanionBuilder = TeamPlayersCompanion Function({Value<int> rowid,});
typedef $$TeamPlayersTableUpdateCompanionBuilder = TeamPlayersCompanion Function({Value<int> rowid,});
class $$TeamPlayersTableFilterComposer extends Composer<
        _$LadderDatabase,
        $TeamPlayersTable> {
        $$TeamPlayersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
          
        }
      class $$TeamPlayersTableOrderingComposer extends Composer<
        _$LadderDatabase,
        $TeamPlayersTable> {
        $$TeamPlayersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
          
        }
      class $$TeamPlayersTableAnnotationComposer extends Composer<
        _$LadderDatabase,
        $TeamPlayersTable> {
        $$TeamPlayersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
          
        }
      class $$TeamPlayersTableTableManager extends RootTableManager    <_$LadderDatabase,
    $TeamPlayersTable,
    TeamPlayer,
    $$TeamPlayersTableFilterComposer,
    $$TeamPlayersTableOrderingComposer,
    $$TeamPlayersTableAnnotationComposer,
    $$TeamPlayersTableCreateCompanionBuilder,
    $$TeamPlayersTableUpdateCompanionBuilder,
    (TeamPlayer,BaseReferences<_$LadderDatabase,$TeamPlayersTable,TeamPlayer>),
    TeamPlayer,
    PrefetchHooks Function()
    > {
    $$TeamPlayersTableTableManager(_$LadderDatabase db, $TeamPlayersTable table) : super(
      TableManagerState(
        db: db,
        table: table,
        createFilteringComposer: () => $$TeamPlayersTableFilterComposer($db: db,$table:table),
        createOrderingComposer: () => $$TeamPlayersTableOrderingComposer($db: db,$table:table),
        createComputedFieldComposer: () => $$TeamPlayersTableAnnotationComposer($db: db,$table:table),
        updateCompanionCallback: ({Value<int> rowid = const Value.absent(),})=> TeamPlayersCompanion(rowid: rowid,),
        createCompanionCallback: ({Value<int> rowid = const Value.absent(),})=> TeamPlayersCompanion.insert(rowid: rowid,),
        withReferenceMapper: (p0) => p0
              .map(
                  (e) =>
                     (e.readTable(table), BaseReferences(db, table, e))
                  )
              .toList(),
        prefetchHooksCallback: null,
        ));
        }
    typedef $$TeamPlayersTableProcessedTableManager = ProcessedTableManager    <_$LadderDatabase,
    $TeamPlayersTable,
    TeamPlayer,
    $$TeamPlayersTableFilterComposer,
    $$TeamPlayersTableOrderingComposer,
    $$TeamPlayersTableAnnotationComposer,
    $$TeamPlayersTableCreateCompanionBuilder,
    $$TeamPlayersTableUpdateCompanionBuilder,
    (TeamPlayer,BaseReferences<_$LadderDatabase,$TeamPlayersTable,TeamPlayer>),
    TeamPlayer,
    PrefetchHooks Function()
    >;class $LadderDatabaseManager {
final _$LadderDatabase _db;
$LadderDatabaseManager(this._db);
$$ShowdownTeamsTableTableManager get showdownTeams => $$ShowdownTeamsTableTableManager(_db, _db.showdownTeams);
$$ShowdownPointsTableTableManager get showdownPoints => $$ShowdownPointsTableTableManager(_db, _db.showdownPoints);
$$TeamPlayersTableTableManager get teamPlayers => $$TeamPlayersTableTableManager(_db, _db.teamPlayers);
}
