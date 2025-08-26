// import 'package:backstreets_widgets/extensions.dart';
// import 'package:backstreets_widgets/screens.dart';
// import 'package:backstreets_widgets/shortcuts.dart';
// import 'package:backstreets_widgets/widgets.dart';
// import 'package:drift/drift.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:ladder/ladder.dart';

// /// The players page.
// class PlayersPage extends ConsumerWidget {
//   /// Create an instance.
//   const PlayersPage({required this.teamId, super.key});

//   /// The ID of the team whose players will be shown.
//   final int teamId;

//   /// Build the widget.
//   @override
//   Widget build(final BuildContext context, final WidgetRef ref) {
//     final database = ref.watch(databaseProvider);
//     final value = ref.watch(teamPlayersProvider(teamId));
//     return value.simpleWhen((final players) {
//       if (players.isEmpty) {
//         return const CustomCenterText(text: 'There are no players to show.');
//       }
//       return ListView.builder(
//         itemBuilder: (final context, final index) {
//           final player = players[index];
//           final query = database.managers.teamPlayers.filter(
//             (final f) => f.id.equals(player.id),
//           );
//           return PerformableActionsListTile(
//             actions: [
//               PerformableAction(
//                 name: 'Rename',
//                 activator: renameShortcut,
//                 invoke: () => context.pushWidgetBuilder(
//                   (final innerContext) => GetText(
//                     onDone: (final value) async {
//                       innerContext.pop();
//                       await query.update((final o) => o(name: Value(value)));
//                       ref.invalidate(teamPlayersProvider(teamId));
//                     },
//                     labelText: 'Team name',
//                     text: player.name,
//                     title: 'Rename Team',
//                   ),
//                 ),
//               ),
//               PerformableAction(
//                 name: 'Change Email',
//                 activator: changeEmailAddressShortcut,
//                 invoke: () => context.pushWidgetBuilder(
//                   (final innerContext) => GetText(
//                     onDone: (final value) async {
//                       innerContext.pop();
//                       await query.update(
//                         (final o) => o(emailAddress: Value(value)),
//                       );
//                       ref.invalidate(teamPlayersProvider(teamId));
//                     },
//                     labelText: 'Email address',
//                     text: player.emailAddress,
//                     title: 'Change Email Address',
//                   ),
//                 ),
//               ),
//               PerformableAction(
//                 name: 'Delete',
//                 activator: deleteShortcut,
//                 invoke: () => context.showConfirmMessage(
//                   message: 'Really delete ${player.name}?',
//                   title: deleteConfirmationTitle,
//                   yesCallback: () async {
//                     await query.delete();
//                     ref.invalidate(teamPlayersProvider(teamId));
//                   },
//                 ),
//               ),
//             ],
//             title: CustomText(text: player.name),
//           );
//         },
//         itemCount: players.length,
//         shrinkWrap: true,
//       );
//     });
//   }
// }
