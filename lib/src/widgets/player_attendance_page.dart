import 'package:backstreets_widgets/extensions.dart';
import 'package:backstreets_widgets/shortcuts.dart';
import 'package:backstreets_widgets/widgets.dart';
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
          return PerformableActionsListTile(
            autofocus: index == 0,
            actions: [
              PerformableAction(
                name: 'Copy Invite',
                activator: copyShortcut,
                invoke: () async {
                  final night = await ref.read(
                    ladderNightProvider(ladderNightId).future,
                  );
                  final buffer = StringBuffer()
                    ..writeln('Hi ${player.name},')
                    ..writeln(
                      // ignore: lines_longer_than_80_chars
                      "The next ladder night will be held ${dateFormat.format(night.createdAt)}. Please let me know if you won't be able to make it.",
                    )
                    ..writeln()
                    ..writeln('Your points: ${player.points}.')
                    ..writeln()
                    ..writeln('The players you can challenge this week are:');
                  final possibles = await ref.read(
                    challengeablePlayersProvider(
                      player.id,
                      ladderNightId,
                    ).future,
                  );
                  for (final possible in possibles) {
                    buffer.writeln('• ${possible.name} (${possible.points})');
                  }
                  buffer
                    ..writeln()
                    ..write(
                      // ignore: lines_longer_than_80_chars
                      'Please let me know who you would like to challenge as soon as possible so I can sort out the schedule.',
                    );
                  buffer.toString().copyToClipboard();
                },
              ),
            ],
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
