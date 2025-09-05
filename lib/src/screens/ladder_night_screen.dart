import 'dart:math';

import 'package:backstreets_widgets/extensions.dart';
import 'package:backstreets_widgets/screens.dart';
import 'package:backstreets_widgets/shortcuts.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ladder/ladder.dart';

/// A screen showing the details of a ladder night.
class LadderNightScreen extends ConsumerWidget {
  /// Create an instance.
  const LadderNightScreen({required this.ladderNightId, super.key});

  /// The ID of the ladder night to show.
  final int ladderNightId;

  /// Build the widget.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final gamesActionsContext = PerformableActionsContext.fromActions([
      PerformableAction(
        name: 'Copy scheduled',
        activator: CrossPlatformSingleActivator(
          LogicalKeyboardKey.keyC,
          shift: true,
        ),
        invoke: () async {
          final night = await ref.read(
            ladderNightProvider(ladderNightId).future,
          );
          final games = await ref.read(gamesProvider(ladderNightId).future);
          final buffer = StringBuffer()
            ..writeln('Schedule for ${dateFormat.format(night.createdAt)}:');
          for (final game in games) {
            final startTime = night.getStartTime(game);
            buffer.write('• ${timeFormat.format(startTime)}: ');
            final firstPlayer = await ref.read(
              teamPlayerProvider(game.firstPlayerId).future,
            );
            final secondPlayer = await ref.read(
              teamPlayerProvider(game.secondPlayerId).future,
            );
            buffer.writeln('${firstPlayer.name} vs ${secondPlayer.name}');
          }
          buffer.toString().copyToClipboard();
        },
      ),
      PerformableAction(
        name: 'Randomise Games',
        activator: CrossPlatformSingleActivator(
          LogicalKeyboardKey.keyR,
          shift: true,
        ),
        invoke: () => _randomiseGames(ref),
      ),
    ]);
    return FontShortcuts(
      child: Cancel(
        child: TabbedScaffold(
          tabs: [
            TabbedScaffoldTab(
              actions: [
                Semantics(
                  customSemanticsActions:
                      gamesActionsContext.customSemanticActions,
                  child: MenuAnchor(
                    menuChildren: gamesActionsContext.menuChildren,
                    builder: (_, final controller, _) => IconButton(
                      onPressed: controller.toggle,
                      icon: const Icon(Icons.more_vert),
                      tooltip: 'Menu',
                    ),
                  ),
                ),
              ],
              title: 'Games',
              icon: const Icon(Icons.emoji_events),
              child: CommonShortcuts(
                child: CallbackShortcuts(
                  bindings: gamesActionsContext.bindings,
                  child: GamesPage(ladderNightId: ladderNightId),
                ),
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
              child: CommonShortcuts(
                newCallback: () => _createPlayer(ref),
                child: PlayerAttendancePage(ladderNightId: ladderNightId),
              ),
              floatingActionButton: NewButton(
                onPressed: () => _createPlayer(ref),
                tooltip: 'New player',
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Create a new game.
  Future<void> _createGame(final WidgetRef ref) async {
    final night = await ref.read(ladderNightProvider(ladderNightId).future);
    final team = await ref.read(showdownTeamProvider(night.teamId).future);
    final games = await ref.read(gamesProvider(ladderNightId).future);
    final int startAfter;
    if (games.isEmpty) {
      startAfter = 0;
    } else {
      startAfter = games.last.startAfter + team.gameLength;
    }
    final context = ref.context;
    if (context.mounted) {
      await context.pushWidgetBuilder(
        (_) => CreateGameScreen(
          ladderNightId: ladderNightId,
          startAfter: startAfter,
          excludedPlayer1Ids: games.map((final game) => game.firstPlayerId),
        ),
      );
    }
  }

  /// Create a new player from inside the night screen.
  Future<void> _createPlayer(final WidgetRef ref) =>
      ref.context.pushWidgetBuilder(
        (final innerContext) => GetText(
          onDone: (final name) async {
            innerContext.pop();
            final database = ref.read(databaseProvider);
            final night = await ref.read(
              ladderNightProvider(ladderNightId).future,
            );
            await database.managers.teamPlayers.create(
              (final o) => o(name: name, teamId: night.teamId),
            );
            ref
              ..invalidate(teamPlayersProvider(night.teamId))
              ..invalidate(ladderNightProvider(ladderNightId));
          },
          labelText: 'Player name',
          title: 'Create Player',
        ),
      );

  /// Create randomised games for this night.
  Future<void> _randomiseGames(final WidgetRef ref) async {
    final database = ref.read(databaseProvider);
    final night = await ref.read(ladderNightProvider(ladderNightId).future);
    final gamesManager = database.managers.showdownGames;
    final context = ref.context;
    final players = await ref.read(
      attendingTeamPlayersProvider(night.id).future,
    );
    final numberOfPlayers = players.length;
    if (numberOfPlayers < 2) {
      if (context.mounted) {
        await context.showMessage(
          message:
              // ignore: lines_longer_than_80_chars
              'You can only randomise games if you have at least 2 players attending.',
        );
      }
      return;
    }
    if ((await gamesManager
            .filter((final f) => f.ladderNightId.id.equals(night.id))
            .count()) >
        0) {
      if (context.mounted) {
        await context.showMessage(
          message:
              // ignore: lines_longer_than_80_chars
              'You can only randomise games for nights with no scheduled games.',
        );
      }
      return;
    }
    final random = Random();
    players.shuffle(random);
    final extraPlayer = numberOfPlayers.isOdd ? players.removeAt(0) : null;
    final games = <ShowdownGame>[];
    final team = await ref.read(showdownTeamProvider(night.teamId).future);
    var startAfter = 0;
    while (players.isNotEmpty) {
      final firstPlayer = players.removeAt(0);
      final secondPlayer = players.removeAt(0);
      games.add(
        await gamesManager.createReturning(
          (final f) => f(
            firstPlayerId: firstPlayer.id,
            secondPlayerId: secondPlayer.id,
            ladderNightId: night.id,
            startAfter: Value(startAfter),
          ),
        ),
      );
      startAfter += team.gameLength;
    }
    if (extraPlayer != null) {
      await gamesManager.create((final f) {
        final game = games[random.nextInt(games.length)];
        final playerIds = [game.firstPlayerId, game.secondPlayerId];
        return f(
          firstPlayerId: extraPlayer.id,
          secondPlayerId: playerIds[random.nextInt(playerIds.length)],
          ladderNightId: night.id,
          startAfter: Value(startAfter),
        );
      });
    }
    ref.invalidate(gamesProvider(night.id));
  }
}
