// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

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

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
