import 'package:drift/drift.dart';
import 'package:ladder/ladder.dart' show GameSet, LadderNight, ShowdownGame;
import 'package:ladder/src/database/_DATABASE.dart'
    show GameSet, LadderNight, ShowdownGame;
import 'package:ladder/src/database/_database.dart'
    show GameSet, LadderNight, ShowdownGame;
import 'package:ladder/src/database/database.dart'
    show GameSet, LadderNight, ShowdownGame;

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

  /// How many minutes long should each game be.
  late final gameLength = integer().withDefault(const Constant(30))();

  /// The points difference before a challenge can be made.
  late final challengePoints = integer().withDefault(const Constant(5))();

  /// The number of points to win a game.
  late final winningPoints = integer().withDefault(const Constant(11))();

  /// The number of clear points.
  late final clearPoints = integer().withDefault(const Constant(2))();
}

/// The team players table.
class TeamPlayers extends Table
    with IdMixin, NameMixin, CreatedAtMixin, EmailAddressMixin, TeamIdMixin {
  /// How many points this player has.
  late final points = integer().withDefault(const Constant(0))();
}

/// A single ladder night.
///
/// Each [LadderNight] can have multiple [ShowdownGame]s.
class LadderNights extends Table with IdMixin, CreatedAtMixin, TeamIdMixin {}

/// A game in a [LadderNight].
class ShowdownGames extends Table with IdMixin, CreatedAtMixin {
  /// The ID of the night this game belongs to.
  late final ladderNightId = integer().references(
    LadderNights,
    #id,
    onDelete: KeyAction.cascade,
  )();

  /// The ID of the first player.
  ///
  /// The first player is the one who initiated the challenge.
  @ReferenceName('gamesAsFirstPlayer')
  late final firstPlayerId = integer().references(
    TeamPlayers,
    #id,
    onDelete: KeyAction.cascade,
  )();

  /// The ID of the second player.
  @ReferenceName('gamesAsSecondPlayer')
  late final secondPlayerId = integer().references(
    TeamPlayers,
    #id,
    onDelete: KeyAction.cascade,
  )();

  /// The date this game was locked on.
  late final lockedOn = dateTime().nullable()();
}

/// A set in a [ShowdownGame].
class GameSets extends Table with IdMixin {
  /// The ID of the first player to serve.
  late final startingPlayerId = integer().references(
    TeamPlayers,
    #id,
    onDelete: KeyAction.cascade,
  )();

  /// The ID of the game which this set is part of.
  late final gameId = integer().references(
    ShowdownGames,
    #id,
    onDelete: KeyAction.cascade,
  )();
}

/// A point which has been awarded in a [GameSet].
class SetPoints extends Table with IdMixin, CreatedAtMixin {
  /// The ID of the player who was awarded the points.
  late final playerId = integer().references(
    TeamPlayers,
    #id,
    onDelete: KeyAction.cascade,
  )();

  /// The ID of the [GameSet] in which the points were awarded.
  late final gameSetId = integer().references(
    GameSets,
    #id,
    onDelete: KeyAction.cascade,
  )();

  /// The ID of the point that was awarded.
  late final pointId = integer().references(
    ShowdownPoints,
    #id,
    onDelete: KeyAction.cascade,
  )();
}

/// The ladder night absences table.
@TableIndex(
  name: 'absence_index',
  columns: {#teamPlayerId, #ladderNightId},
  unique: true,
)
class LadderNightAbsences extends Table with IdMixin {
  /// The ID of the player whose absence will be recorded.
  late final teamPlayerId = integer().references(
    TeamPlayers,
    #id,
    onDelete: KeyAction.cascade,
  )();

  /// The ID of the ladder night when the player will be absent.
  late final ladderNightId = integer().references(
    LadderNights,
    #id,
    onDelete: KeyAction.cascade,
  )();
}
