// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

/// Provide application settings.
@ProviderFor(applicationSettings)
const applicationSettingsProvider = ApplicationSettingsProvider._();

/// Provide application settings.
final class ApplicationSettingsProvider
    extends
        $FunctionalProvider<
          AsyncValue<ApplicationSettings>,
          ApplicationSettings,
          FutureOr<ApplicationSettings>
        >
    with
        $FutureModifier<ApplicationSettings>,
        $FutureProvider<ApplicationSettings> {
  /// Provide application settings.
  const ApplicationSettingsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'applicationSettingsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$applicationSettingsHash();

  @$internal
  @override
  $FutureProviderElement<ApplicationSettings> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<ApplicationSettings> create(Ref ref) {
    return applicationSettings(ref);
  }
}

String _$applicationSettingsHash() =>
    r'1ab6826ebad152db884cba8dd7643dd4188bac55';

/// Provide the database.
@ProviderFor(database)
const databaseProvider = DatabaseProvider._();

/// Provide the database.
final class DatabaseProvider
    extends $FunctionalProvider<LadderDatabase, LadderDatabase, LadderDatabase>
    with $Provider<LadderDatabase> {
  /// Provide the database.
  const DatabaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'databaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$databaseHash();

  @$internal
  @override
  $ProviderElement<LadderDatabase> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  LadderDatabase create(Ref ref) {
    return database(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LadderDatabase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LadderDatabase>(value),
    );
  }
}

String _$databaseHash() => r'9a4f1a58acff20e190eac7bfa49cd300ea8dcf2c';

/// Provide all teams in the database.
@ProviderFor(showdownTeams)
const showdownTeamsProvider = ShowdownTeamsProvider._();

/// Provide all teams in the database.
final class ShowdownTeamsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<ShowdownTeam>>,
          List<ShowdownTeam>,
          FutureOr<List<ShowdownTeam>>
        >
    with
        $FutureModifier<List<ShowdownTeam>>,
        $FutureProvider<List<ShowdownTeam>> {
  /// Provide all teams in the database.
  const ShowdownTeamsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'showdownTeamsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$showdownTeamsHash();

  @$internal
  @override
  $FutureProviderElement<List<ShowdownTeam>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<ShowdownTeam>> create(Ref ref) {
    return showdownTeams(ref);
  }
}

String _$showdownTeamsHash() => r'3e56cda7d9b2ab0ca78e811d917d8c366957f2ae';

/// Provide a single team.
@ProviderFor(showdownTeam)
const showdownTeamProvider = ShowdownTeamFamily._();

/// Provide a single team.
final class ShowdownTeamProvider
    extends
        $FunctionalProvider<
          AsyncValue<ShowdownTeam>,
          ShowdownTeam,
          FutureOr<ShowdownTeam>
        >
    with $FutureModifier<ShowdownTeam>, $FutureProvider<ShowdownTeam> {
  /// Provide a single team.
  const ShowdownTeamProvider._({
    required ShowdownTeamFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'showdownTeamProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$showdownTeamHash();

  @override
  String toString() {
    return r'showdownTeamProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<ShowdownTeam> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<ShowdownTeam> create(Ref ref) {
    final argument = this.argument as int;
    return showdownTeam(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is ShowdownTeamProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$showdownTeamHash() => r'979f9053717083892ca213918ce51be49f42a813';

/// Provide a single team.
final class ShowdownTeamFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<ShowdownTeam>, int> {
  const ShowdownTeamFamily._()
    : super(
        retry: null,
        name: r'showdownTeamProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Provide a single team.
  ShowdownTeamProvider call(int teamId) =>
      ShowdownTeamProvider._(argument: teamId, from: this);

  @override
  String toString() => r'showdownTeamProvider';
}

/// Provide all players on a team.
@ProviderFor(teamPlayers)
const teamPlayersProvider = TeamPlayersFamily._();

/// Provide all players on a team.
final class TeamPlayersProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<TeamPlayer>>,
          List<TeamPlayer>,
          FutureOr<List<TeamPlayer>>
        >
    with $FutureModifier<List<TeamPlayer>>, $FutureProvider<List<TeamPlayer>> {
  /// Provide all players on a team.
  const TeamPlayersProvider._({
    required TeamPlayersFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'teamPlayersProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$teamPlayersHash();

  @override
  String toString() {
    return r'teamPlayersProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<TeamPlayer>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<TeamPlayer>> create(Ref ref) {
    final argument = this.argument as int;
    return teamPlayers(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is TeamPlayersProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$teamPlayersHash() => r'108950794b8df711dc40b74daee05bed99a84b2c';

/// Provide all players on a team.
final class TeamPlayersFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<TeamPlayer>>, int> {
  const TeamPlayersFamily._()
    : super(
        retry: null,
        name: r'teamPlayersProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Provide all players on a team.
  TeamPlayersProvider call(int teamId) =>
      TeamPlayersProvider._(argument: teamId, from: this);

  @override
  String toString() => r'teamPlayersProvider';
}

/// Provide a single player.
@ProviderFor(teamPlayer)
const teamPlayerProvider = TeamPlayerFamily._();

/// Provide a single player.
final class TeamPlayerProvider
    extends
        $FunctionalProvider<
          AsyncValue<TeamPlayer>,
          TeamPlayer,
          FutureOr<TeamPlayer>
        >
    with $FutureModifier<TeamPlayer>, $FutureProvider<TeamPlayer> {
  /// Provide a single player.
  const TeamPlayerProvider._({
    required TeamPlayerFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'teamPlayerProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$teamPlayerHash();

  @override
  String toString() {
    return r'teamPlayerProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<TeamPlayer> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<TeamPlayer> create(Ref ref) {
    final argument = this.argument as int;
    return teamPlayer(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is TeamPlayerProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$teamPlayerHash() => r'2bacce2ef64e23e9cbaf7b5b26c6eba9bf530e76';

/// Provide a single player.
final class TeamPlayerFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<TeamPlayer>, int> {
  const TeamPlayerFamily._()
    : super(
        retry: null,
        name: r'teamPlayerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Provide a single player.
  TeamPlayerProvider call(int playerId) =>
      TeamPlayerProvider._(argument: playerId, from: this);

  @override
  String toString() => r'teamPlayerProvider';
}

/// Provide all the fouls for a given team.
@ProviderFor(showdownPoints)
const showdownPointsProvider = ShowdownPointsFamily._();

/// Provide all the fouls for a given team.
final class ShowdownPointsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<ShowdownPoint>>,
          List<ShowdownPoint>,
          FutureOr<List<ShowdownPoint>>
        >
    with
        $FutureModifier<List<ShowdownPoint>>,
        $FutureProvider<List<ShowdownPoint>> {
  /// Provide all the fouls for a given team.
  const ShowdownPointsProvider._({
    required ShowdownPointsFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'showdownPointsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$showdownPointsHash();

  @override
  String toString() {
    return r'showdownPointsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<ShowdownPoint>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<ShowdownPoint>> create(Ref ref) {
    final argument = this.argument as int;
    return showdownPoints(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is ShowdownPointsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$showdownPointsHash() => r'48fa0a6c0c61c70eba51ef7060c5ce8fc0053a12';

/// Provide all the fouls for a given team.
final class ShowdownPointsFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<ShowdownPoint>>, int> {
  const ShowdownPointsFamily._()
    : super(
        retry: null,
        name: r'showdownPointsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Provide all the fouls for a given team.
  ShowdownPointsProvider call(int teamId) =>
      ShowdownPointsProvider._(argument: teamId, from: this);

  @override
  String toString() => r'showdownPointsProvider';
}

/// Provide the recent ladder nights.
@ProviderFor(ladderNights)
const ladderNightsProvider = LadderNightsFamily._();

/// Provide the recent ladder nights.
final class LadderNightsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<LadderNight>>,
          List<LadderNight>,
          FutureOr<List<LadderNight>>
        >
    with
        $FutureModifier<List<LadderNight>>,
        $FutureProvider<List<LadderNight>> {
  /// Provide the recent ladder nights.
  const LadderNightsProvider._({
    required LadderNightsFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'ladderNightsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$ladderNightsHash();

  @override
  String toString() {
    return r'ladderNightsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<LadderNight>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<LadderNight>> create(Ref ref) {
    final argument = this.argument as int;
    return ladderNights(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is LadderNightsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$ladderNightsHash() => r'9ff53ad4f3dbb17c6da2c13533e0fa635a19a87e';

/// Provide the recent ladder nights.
final class LadderNightsFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<LadderNight>>, int> {
  const LadderNightsFamily._()
    : super(
        retry: null,
        name: r'ladderNightsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Provide the recent ladder nights.
  LadderNightsProvider call(int teamId) =>
      LadderNightsProvider._(argument: teamId, from: this);

  @override
  String toString() => r'ladderNightsProvider';
}

/// Provide a single ladder night.
@ProviderFor(ladderNight)
const ladderNightProvider = LadderNightFamily._();

/// Provide a single ladder night.
final class LadderNightProvider
    extends
        $FunctionalProvider<
          AsyncValue<LadderNight>,
          LadderNight,
          FutureOr<LadderNight>
        >
    with $FutureModifier<LadderNight>, $FutureProvider<LadderNight> {
  /// Provide a single ladder night.
  const LadderNightProvider._({
    required LadderNightFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'ladderNightProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$ladderNightHash();

  @override
  String toString() {
    return r'ladderNightProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<LadderNight> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<LadderNight> create(Ref ref) {
    final argument = this.argument as int;
    return ladderNight(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is LadderNightProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$ladderNightHash() => r'cd1a796cad120a00dda7a3d60adb0b6e8b5b966e';

/// Provide a single ladder night.
final class LadderNightFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<LadderNight>, int> {
  const LadderNightFamily._()
    : super(
        retry: null,
        name: r'ladderNightProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Provide a single ladder night.
  LadderNightProvider call(int ladderNightId) =>
      LadderNightProvider._(argument: ladderNightId, from: this);

  @override
  String toString() => r'ladderNightProvider';
}

/// Provide all the games for a given ladder night.
@ProviderFor(games)
const gamesProvider = GamesFamily._();

/// Provide all the games for a given ladder night.
final class GamesProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<ShowdownGame>>,
          List<ShowdownGame>,
          FutureOr<List<ShowdownGame>>
        >
    with
        $FutureModifier<List<ShowdownGame>>,
        $FutureProvider<List<ShowdownGame>> {
  /// Provide all the games for a given ladder night.
  const GamesProvider._({
    required GamesFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'gamesProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$gamesHash();

  @override
  String toString() {
    return r'gamesProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<ShowdownGame>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<ShowdownGame>> create(Ref ref) {
    final argument = this.argument as int;
    return games(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is GamesProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$gamesHash() => r'45fc59a7cdf7148ca4d22da2fac667e30485d31f';

/// Provide all the games for a given ladder night.
final class GamesFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<ShowdownGame>>, int> {
  const GamesFamily._()
    : super(
        retry: null,
        name: r'gamesProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Provide all the games for a given ladder night.
  GamesProvider call(int ladderNightId) =>
      GamesProvider._(argument: ladderNightId, from: this);

  @override
  String toString() => r'gamesProvider';
}

/// Provide a single game.
@ProviderFor(game)
const gameProvider = GameFamily._();

/// Provide a single game.
final class GameProvider
    extends
        $FunctionalProvider<
          AsyncValue<ShowdownGame>,
          ShowdownGame,
          FutureOr<ShowdownGame>
        >
    with $FutureModifier<ShowdownGame>, $FutureProvider<ShowdownGame> {
  /// Provide a single game.
  const GameProvider._({
    required GameFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'gameProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$gameHash();

  @override
  String toString() {
    return r'gameProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<ShowdownGame> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<ShowdownGame> create(Ref ref) {
    final argument = this.argument as int;
    return game(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is GameProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$gameHash() => r'1bc450e0263796d6d03064be8f95ce14c7dcf99b';

/// Provide a single game.
final class GameFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<ShowdownGame>, int> {
  const GameFamily._()
    : super(
        retry: null,
        name: r'gameProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Provide a single game.
  GameProvider call(int gameId) => GameProvider._(argument: gameId, from: this);

  @override
  String toString() => r'gameProvider';
}

/// Provide all the players which the given player can challenge.
@ProviderFor(challengeablePlayers)
const challengeablePlayersProvider = ChallengeablePlayersFamily._();

/// Provide all the players which the given player can challenge.
final class ChallengeablePlayersProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<TeamPlayer>>,
          List<TeamPlayer>,
          FutureOr<List<TeamPlayer>>
        >
    with $FutureModifier<List<TeamPlayer>>, $FutureProvider<List<TeamPlayer>> {
  /// Provide all the players which the given player can challenge.
  const ChallengeablePlayersProvider._({
    required ChallengeablePlayersFamily super.from,
    required (int, int) super.argument,
  }) : super(
         retry: null,
         name: r'challengeablePlayersProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$challengeablePlayersHash();

  @override
  String toString() {
    return r'challengeablePlayersProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<List<TeamPlayer>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<TeamPlayer>> create(Ref ref) {
    final argument = this.argument as (int, int);
    return challengeablePlayers(ref, argument.$1, argument.$2);
  }

  @override
  bool operator ==(Object other) {
    return other is ChallengeablePlayersProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$challengeablePlayersHash() =>
    r'c52b1c644e7c7407991841c57f749d76380f8cfc';

/// Provide all the players which the given player can challenge.
final class ChallengeablePlayersFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<TeamPlayer>>, (int, int)> {
  const ChallengeablePlayersFamily._()
    : super(
        retry: null,
        name: r'challengeablePlayersProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Provide all the players which the given player can challenge.
  ChallengeablePlayersProvider call(int playerId, int ladderNightId) =>
      ChallengeablePlayersProvider._(
        argument: (playerId, ladderNightId),
        from: this,
      );

  @override
  String toString() => r'challengeablePlayersProvider';
}

/// Provide all the points for the given set.
@ProviderFor(setPoints)
const setPointsProvider = SetPointsFamily._();

/// Provide all the points for the given set.
final class SetPointsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<SetPointContext>>,
          List<SetPointContext>,
          FutureOr<List<SetPointContext>>
        >
    with
        $FutureModifier<List<SetPointContext>>,
        $FutureProvider<List<SetPointContext>> {
  /// Provide all the points for the given set.
  const SetPointsProvider._({
    required SetPointsFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'setPointsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$setPointsHash();

  @override
  String toString() {
    return r'setPointsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<SetPointContext>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<SetPointContext>> create(Ref ref) {
    final argument = this.argument as int;
    return setPoints(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is SetPointsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$setPointsHash() => r'a25fd262e309594dadf25a650b354f8b9305fee1';

/// Provide all the points for the given set.
final class SetPointsFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<SetPointContext>>, int> {
  const SetPointsFamily._()
    : super(
        retry: null,
        name: r'setPointsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Provide all the points for the given set.
  SetPointsProvider call(int setId) =>
      SetPointsProvider._(argument: setId, from: this);

  @override
  String toString() => r'setPointsProvider';
}

/// Provide all the players who are attending the given ladder night.
@ProviderFor(attendingTeamPlayers)
const attendingTeamPlayersProvider = AttendingTeamPlayersFamily._();

/// Provide all the players who are attending the given ladder night.
final class AttendingTeamPlayersProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<TeamPlayer>>,
          List<TeamPlayer>,
          FutureOr<List<TeamPlayer>>
        >
    with $FutureModifier<List<TeamPlayer>>, $FutureProvider<List<TeamPlayer>> {
  /// Provide all the players who are attending the given ladder night.
  const AttendingTeamPlayersProvider._({
    required AttendingTeamPlayersFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'attendingTeamPlayersProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$attendingTeamPlayersHash();

  @override
  String toString() {
    return r'attendingTeamPlayersProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<TeamPlayer>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<TeamPlayer>> create(Ref ref) {
    final argument = this.argument as int;
    return attendingTeamPlayers(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is AttendingTeamPlayersProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$attendingTeamPlayersHash() =>
    r'74f3e2d92d63a83f7a6d2ff541439ca41d1677e4';

/// Provide all the players who are attending the given ladder night.
final class AttendingTeamPlayersFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<TeamPlayer>>, int> {
  const AttendingTeamPlayersFamily._()
    : super(
        retry: null,
        name: r'attendingTeamPlayersProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Provide all the players who are attending the given ladder night.
  AttendingTeamPlayersProvider call(int ladderNightId) =>
      AttendingTeamPlayersProvider._(argument: ladderNightId, from: this);

  @override
  String toString() => r'attendingTeamPlayersProvider';
}

/// Provide a list of player attendances for the given ladder night.
@ProviderFor(playerAttendance)
const playerAttendanceProvider = PlayerAttendanceFamily._();

/// Provide a list of player attendances for the given ladder night.
final class PlayerAttendanceProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<PlayerAttendance>>,
          List<PlayerAttendance>,
          FutureOr<List<PlayerAttendance>>
        >
    with
        $FutureModifier<List<PlayerAttendance>>,
        $FutureProvider<List<PlayerAttendance>> {
  /// Provide a list of player attendances for the given ladder night.
  const PlayerAttendanceProvider._({
    required PlayerAttendanceFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'playerAttendanceProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$playerAttendanceHash();

  @override
  String toString() {
    return r'playerAttendanceProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<PlayerAttendance>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<PlayerAttendance>> create(Ref ref) {
    final argument = this.argument as int;
    return playerAttendance(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is PlayerAttendanceProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$playerAttendanceHash() => r'791dcf3c1d302804494f452ea4d26648b7aae4f2';

/// Provide a list of player attendances for the given ladder night.
final class PlayerAttendanceFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<PlayerAttendance>>, int> {
  const PlayerAttendanceFamily._()
    : super(
        retry: null,
        name: r'playerAttendanceProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Provide a list of player attendances for the given ladder night.
  PlayerAttendanceProvider call(int ladderNightId) =>
      PlayerAttendanceProvider._(argument: ladderNightId, from: this);

  @override
  String toString() => r'playerAttendanceProvider';
}

/// Provide the sets in a given game.
@ProviderFor(gameSets)
const gameSetsProvider = GameSetsFamily._();

/// Provide the sets in a given game.
final class GameSetsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<GameSet>>,
          List<GameSet>,
          FutureOr<List<GameSet>>
        >
    with $FutureModifier<List<GameSet>>, $FutureProvider<List<GameSet>> {
  /// Provide the sets in a given game.
  const GameSetsProvider._({
    required GameSetsFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'gameSetsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$gameSetsHash();

  @override
  String toString() {
    return r'gameSetsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<GameSet>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<GameSet>> create(Ref ref) {
    final argument = this.argument as int;
    return gameSets(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is GameSetsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$gameSetsHash() => r'5d1093d019ad7e5976bcaf5b2b498cc6ab7bbadd';

/// Provide the sets in a given game.
final class GameSetsFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<GameSet>>, int> {
  const GameSetsFamily._()
    : super(
        retry: null,
        name: r'gameSetsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Provide the sets in a given game.
  GameSetsProvider call(int gameId) =>
      GameSetsProvider._(argument: gameId, from: this);

  @override
  String toString() => r'gameSetsProvider';
}

/// Provide a single game set.
@ProviderFor(gameSet)
const gameSetProvider = GameSetFamily._();

/// Provide a single game set.
final class GameSetProvider
    extends $FunctionalProvider<AsyncValue<GameSet>, GameSet, FutureOr<GameSet>>
    with $FutureModifier<GameSet>, $FutureProvider<GameSet> {
  /// Provide a single game set.
  const GameSetProvider._({
    required GameSetFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'gameSetProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$gameSetHash();

  @override
  String toString() {
    return r'gameSetProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<GameSet> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<GameSet> create(Ref ref) {
    final argument = this.argument as int;
    return gameSet(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is GameSetProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$gameSetHash() => r'ded36482de637a7802c8c24727f3f0fcf4948287';

/// Provide a single game set.
final class GameSetFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<GameSet>, int> {
  const GameSetFamily._()
    : super(
        retry: null,
        name: r'gameSetProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Provide a single game set.
  GameSetProvider call(int setId) =>
      GameSetProvider._(argument: setId, from: this);

  @override
  String toString() => r'gameSetProvider';
}

/// Return the players who are involved in a given game.
@ProviderFor(gamePlayers)
const gamePlayersProvider = GamePlayersFamily._();

/// Return the players who are involved in a given game.
final class GamePlayersProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<TeamPlayer>>,
          List<TeamPlayer>,
          FutureOr<List<TeamPlayer>>
        >
    with $FutureModifier<List<TeamPlayer>>, $FutureProvider<List<TeamPlayer>> {
  /// Return the players who are involved in a given game.
  const GamePlayersProvider._({
    required GamePlayersFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'gamePlayersProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$gamePlayersHash();

  @override
  String toString() {
    return r'gamePlayersProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<TeamPlayer>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<TeamPlayer>> create(Ref ref) {
    final argument = this.argument as int;
    return gamePlayers(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is GamePlayersProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$gamePlayersHash() => r'41d1761acd3fa1a8bb8bfa28f348dc2c98bb94e6';

/// Return the players who are involved in a given game.
final class GamePlayersFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<TeamPlayer>>, int> {
  const GamePlayersFamily._()
    : super(
        retry: null,
        name: r'gamePlayersProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Return the players who are involved in a given game.
  GamePlayersProvider call(int gameId) =>
      GamePlayersProvider._(argument: gameId, from: this);

  @override
  String toString() => r'gamePlayersProvider';
}

/// Provide the result of a given set.
@ProviderFor(setResults)
const setResultsProvider = SetResultsFamily._();

/// Provide the result of a given set.
final class SetResultsProvider
    extends
        $FunctionalProvider<
          AsyncValue<SetResults>,
          SetResults,
          FutureOr<SetResults>
        >
    with $FutureModifier<SetResults>, $FutureProvider<SetResults> {
  /// Provide the result of a given set.
  const SetResultsProvider._({
    required SetResultsFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'setResultsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$setResultsHash();

  @override
  String toString() {
    return r'setResultsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<SetResults> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<SetResults> create(Ref ref) {
    final argument = this.argument as int;
    return setResults(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is SetResultsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$setResultsHash() => r'4cab2c019d62ac03fd4a4b41abf15353a5f277e2';

/// Provide the result of a given set.
final class SetResultsFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<SetResults>, int> {
  const SetResultsFamily._()
    : super(
        retry: null,
        name: r'setResultsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Provide the result of a given set.
  SetResultsProvider call(int setId) =>
      SetResultsProvider._(argument: setId, from: this);

  @override
  String toString() => r'setResultsProvider';
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
