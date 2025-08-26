import 'package:drift/drift.dart';
import 'package:ladder/ladder.dart';

/// The team players table.
class TeamPlayers extends Table
    with IdMixin, NameMixin, CreatedAtMixin, EmailAddressMixin, TeamIdMixin {}
