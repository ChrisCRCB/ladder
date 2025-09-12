import 'package:backstreets_widgets/screens.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:drift/drift.dart' hide Column;
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ladder/ladder.dart';

/// The number of the coach to edit.
enum CoachNumber {
  /// First coach.
  first,

  /// Second coach.
  second,
}

/// A screen for editing a coach.
class EditCoachScreen extends ConsumerWidget {
  /// Create an instance.
  const EditCoachScreen({
    required this.gameId,
    required this.coachNumber,
    super.key,
  });

  /// The ID of the game to edit.
  final int gameId;

  /// The coach to edit.
  final CoachNumber coachNumber;

  /// Build the widget.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    const formFieldName = 'coach';
    final database = ref.watch(databaseProvider);
    final query = database.managers.showdownGames.filter(
      (final f) => f.id.equals(gameId),
    );
    final value = ref.watch(gameProvider(gameId));
    final key = GlobalKey<FormBuilderState>();
    return Cancel(
      child: PopScope(
        onPopInvokedWithResult: (_, _) async {
          key.currentState?.save();
          final value = key.currentState?.value[formFieldName] as String?;
          await query.update((final o) {
            switch (coachNumber) {
              case CoachNumber.first:
                return o(firstPlayerCoachName: Value(value));
              case CoachNumber.second:
                return o(secondPlayerCoachName: Value(value));
            }
          });
          ref.invalidate(gameProvider(gameId));
          final game = await ref.read(gameProvider(gameId).future);
          ref.invalidate(gamesProvider(game.ladderNightId));
        },
        child: SimpleScaffold(
          title: 'Edit Coach',
          body: value.simpleWhen(
            (final game) => FormBuilder(
              key: key,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FormBuilderTextField(
                    name: formFieldName,
                    autofocus: true,
                    decoration: const InputDecoration(
                      label: CustomText(text: 'Coach name'),
                    ),
                    initialValue: game.getCoachName(coachNumber),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
