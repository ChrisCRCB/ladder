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

/// Provide the points for the given player.
@ProviderFor(playerPoints)
const playerPointsProvider = PlayerPointsFamily._();

/// Provide the points for the given player.
final class PlayerPointsProvider
    extends $FunctionalProvider<AsyncValue<int>, int, FutureOr<int>>
    with $FutureModifier<int>, $FutureProvider<int> {
  /// Provide the points for the given player.
  const PlayerPointsProvider._({
    required PlayerPointsFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'playerPointsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$playerPointsHash();

  @override
  String toString() {
    return r'playerPointsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<int> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<int> create(Ref ref) {
    final argument = this.argument as int;
    return playerPoints(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is PlayerPointsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$playerPointsHash() => r'a0da3a27f2535eca02e4e622246280f0dae7f225';

/// Provide the points for the given player.
final class PlayerPointsFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<int>, int> {
  const PlayerPointsFamily._()
    : super(
        retry: null,
        name: r'playerPointsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Provide the points for the given player.
  PlayerPointsProvider call(int playerId) =>
      PlayerPointsProvider._(argument: playerId, from: this);

  @override
  String toString() => r'playerPointsProvider';
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
