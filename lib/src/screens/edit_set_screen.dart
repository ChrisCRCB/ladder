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
                return value.simpleWhen(
                  (final points) => ListView(
                    shrinkWrap: true,
                    children: [
                      ...players.map(
                        (final player) => ListTile(
                          autofocus: player.id == players.first.id,
                          title: PlayerCustomText(
                            playerId: player.id,
                            points: _getPoints(points, player),
                          ),
                          onTap: () => context.pushWidgetBuilder(
                            (_) => CreateGamePointScreen(
                              setId: setId,
                              playerId: player.id,
                            ),
                          ),
                        ),
                      ),
                      ...points.map((final pointContext) {
                        final playerId = pointContext.gamePoint.playerId;
                        final point = pointContext.showdownPoint;
                        return ListTile(
                          title: PlayerCustomText(
                            playerId: playerId,
                            showPoints: false,
                          ),
                          subtitle: CustomText(
                            text: '${point.name} (${point.value})',
                          ),
                          onTap: () {},
                        );
                      }),
                    ],
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
  int _getPoints(final List<GamePointContext> points, final TeamPlayer player) {
    if (points.isEmpty) {
      return 0;
    }
    return points
        .map<int>((final gamePointContext) {
          final point = gamePointContext.showdownPoint;
          final playerId = gamePointContext.gamePoint.playerId;
          if ((playerId == player.id && point.value > 0) ||
              (playerId != player.id && point.value < 0)) {
            return point.value.abs();
          }
          return 0;
        })
        .reduce((final value, final element) => value + element);
  }
}
