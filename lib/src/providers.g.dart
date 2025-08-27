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

String _$teamPlayersHash() => r'668532d807ac145622fcb02bf636e0d62b765781';

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

String _$ladderNightsHash() => r'965ff8f5542dbb540d3d95b982b13cb6cbe92bc8';

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

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
