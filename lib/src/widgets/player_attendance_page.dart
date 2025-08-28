import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ladder/ladder.dart';

/// The player attendance page.
class PlayerAttendancePage extends ConsumerWidget {
  /// Create an instance.
  const PlayerAttendancePage({required this.ladderNightId, super.key});

  /// The ID of the ladder night whose attendance will be shown.
  final int ladderNightId;

  /// Build the widget.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final database = ref.watch(databaseProvider);
    final absences = database.managers.ladderNightAbsences;
    final value = ref.watch(playerAttendanceProvider(ladderNightId));
    return value.simpleWhen((final players) {
      if (players.isEmpty) {
        return const CustomCenterText(text: 'There are no players to show.');
      }
      return ListView.builder(
        itemBuilder: (final context, final index) {
          final attendance = players[index];
          final player = attendance.player;
          final absence = attendance.absence;
          return ListTile(
            autofocus: index == 0,
            title: PlayerCustomText(playerId: player.id),
            subtitle: CustomText(
              text: absence == null ? 'Attending' : 'Absent',
            ),
            onTap: () async {
              if (absence == null) {
                await absences.create(
                  (final o) =>
                      o(ladderNightId: ladderNightId, teamPlayerId: player.id),
                );
              } else {
                await absences
                    .filter((final f) => f.id.equals(absence.id))
                    .delete();
              }
              ref.invalidate(playerAttendanceProvider(ladderNightId));
            },
          );
        },
        itemCount: players.length,
        shrinkWrap: true,
      );
    });
  }
}
