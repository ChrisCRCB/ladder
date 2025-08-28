import 'package:backstreets_widgets/extensions.dart';
import 'package:backstreets_widgets/screens.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ladder/ladder.dart';

/// A screen which allows editing game sets.
class EditSetScreen extends ConsumerWidget {
  /// Create an instance.
  const EditSetScreen({
    required this.setId,
    required this.setNumber,
    super.key,
  });

  /// The ID of the set to show.
  final int setId;

  /// The number of this set.
  final int setNumber;

  /// Build the widget.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final value = ref.watch(gameSetProvider(setId));
    return Cancel(
      child: FontShortcuts(
        child: value.when(
          data: (final set) {
            final value = ref.watch(gamePlayersProvider(set.gameId));
            return SimpleScaffold(
              title: 'Set #$setNumber',
              body: value.simpleWhen((final players) {
                final value = ref.watch(setPointsProvider(setId));
                return value.when(
                  data: (final points) => ListView(
                    shrinkWrap: true,
                    children: [
                      ...players.map(
                        (final player) => ListTile(
                          autofocus: player.id == players.first.id,
                          title: PlayerCustomText(
                            playerId: player.id,
                            points: _getPoints(points, player),
                          ),
                        ),
                      ),
                      ...points.map((final point) {
                        final player = players.firstWhere(
                          (final player) => player.id == point.playerId,
                        );
                        return ListTile(
                          title: PlayerCustomText(
                            playerId: point.playerId,
                            points: _getPoints(points, player),
                          ),
                          onTap: () {},
                        );
                      }),
                    ],
                  ),
                  error: ErrorListView.withPositional,
                  loading: () => ListView.builder(
                    itemBuilder: (final context, final index) {
                      final player = players[index];
                      return ListTile(
                        autofocus: index == 0,
                        title: PlayerCustomText(playerId: player.id, points: 0),
                        onTap: () => context.pushWidgetBuilder(
                          (_) => CreateGamePointScreen(
                            setId: setId,
                            playerId: player.id,
                          ),
                        ),
                      );
                    },
                    itemCount: players.length,
                    shrinkWrap: true,
                  ),
                );
              }),
            );
          },
          error: ErrorScreen.withPositional,
          loading: LoadingScreen.new,
        ),
      ),
    );
  }

  /// Get the points for the given [player].
  int _getPoints(final List<GamePoint> points, final TeamPlayer player) {
    var i = 0;
    for (final point in points) {
      if ((point.playerId == player.id && point.value > 0) ||
          (point.playerId != player.id && point.value < 0)) {
        i += point.value;
      }
    }
    return i;
  }
}
