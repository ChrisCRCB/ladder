import 'package:backstreets_widgets/extensions.dart';
import 'package:backstreets_widgets/screens.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ladder/ladder.dart';
import 'package:time/time.dart';

/// A screen showing the details of a ladder night.
class LadderNightScreen extends ConsumerWidget {
  /// Create an instance.
  const LadderNightScreen({required this.ladderNightId, super.key});

  /// The ID of the ladder night to show.
  final int ladderNightId;

  /// Build the widget.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) =>
      FontShortcuts(
        child: Cancel(
          child: TabbedScaffold(
            tabs: [
              TabbedScaffoldTab(
                title: 'Games',
                icon: const Icon(Icons.emoji_events),
                child: CommonShortcuts(
                  child: GamesPage(ladderNightId: ladderNightId),
                  newCallback: () => _createGame(ref),
                ),
                floatingActionButton: NewButton(
                  onPressed: () => _createGame(ref),
                  tooltip: 'New game',
                ),
              ),
              TabbedScaffoldTab(
                title: 'Players',
                icon: const Icon(Icons.group),
                child: PlayerAttendancePage(ladderNightId: ladderNightId),
              ),
            ],
          ),
        ),
      );

  /// Create a new game.
  Future<void> _createGame(final WidgetRef ref) async {
    final night = await ref.read(ladderNightProvider(ladderNightId).future);
    final team = await ref.read(showdownTeamProvider(night.teamId).future);
    final games = await ref.read(gamesProvider(ladderNightId).future);
    final DateTime gameStart;
    if (games.isEmpty) {
      gameStart = night.createdAt;
    } else {
      gameStart = games.last.createdAt + team.gameLength.minutes;
    }
    final context = ref.context;
    if (context.mounted) {
      await context.pushWidgetBuilder(
        (_) => CreateGameScreen(
          ladderNightId: ladderNightId,
          gameStartTime: gameStart,
          excludedPlayer1Ids: games.map((final game) => game.firstPlayerId),
        ),
      );
    }
  }
}
