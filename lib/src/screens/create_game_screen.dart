import 'package:backstreets_widgets/extensions.dart';
import 'package:backstreets_widgets/screens.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ladder/ladder.dart';

/// A screen for creating a new game.
class CreateGameScreen extends ConsumerStatefulWidget {
  /// Create an instance.
  const CreateGameScreen({required this.ladderNightId, super.key});

  /// The ID of the night this game will be part of.
  final int ladderNightId;

  /// Create state for this widget.
  @override
  CreateGameScreenState createState() => CreateGameScreenState();
}

/// State for [CreateGameScreen].
class CreateGameScreenState extends ConsumerState<CreateGameScreen> {
  /// The ID of the first player.
  int? _firstPlayerId;

  /// Build a widget.
  @override
  Widget build(final BuildContext context) {
    final database = ref.watch(databaseProvider);
    final value = ref.watch(ladderNightProvider(widget.ladderNightId));
    final firstPlayerId = _firstPlayerId;
    return value.when(
      data: (final night) {
        if (firstPlayerId == null) {
          final value = ref.watch(teamPlayersProvider(night.teamId));
          return FontShortcuts(
            child: Cancel(
              child: SimpleScaffold(
                title: 'Select First Player',
                body: value.simpleWhen((final players) {
                  if (players.isEmpty) {
                    return const CustomCenterText(
                      text: 'This team has no players.',
                    );
                  }
                  return ListView.builder(
                    itemBuilder: (final context, final index) {
                      final player = players[index];
                      return ListTile(
                        autofocus: index == 0,
                        title: CustomText(text: player.name),
                        onTap: () => setState(() => _firstPlayerId = player.id),
                      );
                    },
                    itemCount: players.length,
                    shrinkWrap: true,
                  );
                }),
              ),
            ),
          );
        }
        final value = ref.watch(challengeablePlayersProvider(firstPlayerId));
        return FontShortcuts(
          child: Cancel(
            child: value.simpleWhen((final players) {
              if (players.isEmpty) {
                return const CustomCenterText(
                  text: 'There are no players which can be challenged.',
                );
              }
              return ListView.builder(
                itemBuilder: (final context, final index) {
                  final player = players[index];
                  return ListTile(
                    autofocus: index == 0,
                    title: CustomText(text: player.name),
                    onTap: () async {
                      context.pop();
                      final night = await ref.read(
                        ladderNightProvider(widget.ladderNightId).future,
                      );
                      await database.managers.showdownGames.create(
                        (final o) => o(
                          firstPlayerId: firstPlayerId,
                          secondPlayerId: player.id,
                          ladderNightId: widget.ladderNightId,
                          createdAt: Value(night.createdAt),
                        ),
                      );
                    },
                  );
                },
                itemCount: players.length,
                shrinkWrap: true,
              );
            }),
          ),
        );
      },
      error: ErrorScreen.withPositional,
      loading: LoadingScreen.new,
    );
  }
}
