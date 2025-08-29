import 'package:backstreets_widgets/extensions.dart';
import 'package:backstreets_widgets/screens.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ladder/ladder.dart';

/// The screen for showing a single showdown team.
class TeamScreen extends ConsumerWidget {
  /// Create an instance.
  const TeamScreen({required this.teamId, super.key});

  /// The ID of the team to show.
  final int teamId;

  /// Build the widget.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) => Cancel(
    child: FontShortcuts(
      child: TabbedScaffold(
        tabs: [
          TabbedScaffoldTab(
            title: 'Ladder Nights',
            icon: const Icon(Icons.calendar_month),
            child: CommonShortcuts(
              child: LadderNightsPage(teamId: teamId),
              newCallback: () => _createLadderNight(ref),
            ),
            floatingActionButton: NewButton(
              onPressed: () => _createLadderNight(ref),
              tooltip: 'New ladder night',
            ),
          ),
          TabbedScaffoldTab(
            title: 'Players',
            icon: const Icon(Icons.people),
            child: CommonShortcuts(
              child: PlayersPage(teamId: teamId),
              newCallback: () => _createPlayer(ref),
            ),
            floatingActionButton: NewButton(
              onPressed: () => _createPlayer(ref),
              tooltip: 'New player',
            ),
          ),
          TabbedScaffoldTab(
            title: 'Points',
            icon: const Icon(Icons.score),
            child: CommonShortcuts(
              child: PointsPage(teamId: teamId),
              newCallback: () => _createPoint(ref),
            ),
            floatingActionButton: NewButton(
              onPressed: () => _createPoint(ref),
              tooltip: 'Create point',
            ),
          ),
        ],
      ),
    ),
  );

  /// Create a new player.
  Future<void> _createPlayer(final WidgetRef ref) =>
      ref.context.pushWidgetBuilder(
        (final innerContext) => GetText(
          onDone: (final value) async {
            innerContext.pop();
            final database = ref.read(databaseProvider);
            await database.managers.teamPlayers.create(
              (final o) => o(name: value, teamId: teamId),
            );
            ref.invalidate(teamPlayersProvider(teamId));
          },
          labelText: 'Player name',
          title: 'Create Player',
        ),
      );

  /// Create a new point.
  Future<void> _createPoint(final WidgetRef ref) =>
      ref.context.pushWidgetBuilder(
        (final innerContext) => GetText(
          onDone: (final value) async {
            innerContext.pop();
            final database = ref.read(databaseProvider);
            await database.managers.showdownPoints.create(
              (final o) => o(name: value, teamId: teamId, value: -1),
            );
            ref.invalidate(showdownPointsProvider(teamId));
          },
        ),
      );

  /// Create a new ladder night.
  Future<void> _createLadderNight(final WidgetRef ref) async {
    final database = ref.read(databaseProvider);
    final now = DateTime.now();
    final night = await database.managers.ladderNights.createReturning(
      (final o) => o(
        teamId: teamId,
        createdAt: Value(DateTime(now.year, now.month, now.day, 18)),
      ),
    );
    ref.invalidate(ladderNightsProvider(teamId));
    final context = ref.context;
    if (context.mounted) {
      await context.pushWidgetBuilder(
        (_) => LadderNightScreen(ladderNightId: night.id),
      );
    }
  }
}
