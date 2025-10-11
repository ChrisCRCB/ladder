import 'package:excel/excel.dart';
import 'package:ladder/ladder.dart';

/// Export [team] to [excel].
Sheet exportTeam({
  required final Excel excel,
  required final ShowdownTeam team,
}) {
  final sheet = excel[teamSheetName]
    ..appendRow([
      TextCellValue('ID'),
      TextCellValue('Team Name'),
      TextCellValue('Email Address'),
    ])
    ..appendRow([
      IntCellValue(team.id),
      TextCellValue(team.name),
      TextCellValue(team.emailAddress),
    ]);
  excel.setDefaultSheet(sheet.sheetName);
  return sheet;
}

/// Export [points] to [excel].
Sheet exportShowdownPoints({
  required final Excel excel,
  required final List<ShowdownPoint> points,
}) {
  final sheet = excel[showdownPointsSheetName]
    ..appendRow([
      TextCellValue('ID'),
      TextCellValue('Name'),
      TextCellValue('Value'),
      TextCellValue('Ends current point'),
    ]);
  for (final point in points) {
    sheet.appendRow([
      IntCellValue(point.id),
      TextCellValue(point.name),
      IntCellValue(point.value),
      BoolCellValue(point.endsPoint),
    ]);
  }
  return sheet;
}

/// Export [players] to [excel].
Sheet exportPlayers({
  required final Excel excel,
  required final List<TeamPlayer> players,
}) {
  final sheet = excel[playersSheetName]
    ..appendRow([
      TextCellValue('ID'),
      TextCellValue('Name'),
      TextCellValue('Points'),
      TextCellValue('Created At'),
    ]);
  for (final player in players) {
    final createdAt = player.createdAt;
    sheet.appendRow([
      IntCellValue(player.id),
      TextCellValue(player.name),
      IntCellValue(player.points),
      DateTimeCellValue(
        year: createdAt.year,
        month: createdAt.month,
        day: createdAt.day,
        hour: createdAt.hour,
        minute: createdAt.minute,
        second: createdAt.second,
      ),
    ]);
  }
  return sheet;
}

/// Export [nights] to [excel].
Sheet exportLadderNights({
  required final Excel excel,
  required final List<LadderNight> nights,
}) {
  final sheet = excel[ladderNightsSheetName]
    ..appendRow([TextCellValue('ID'), TextCellValue('Date')]);
  for (final night in nights) {
    final createdAt = night.createdAt;
    sheet.appendRow([
      IntCellValue(night.id),
      DateCellValue(
        year: createdAt.year,
        month: createdAt.month,
        day: createdAt.day,
      ),
    ]);
  }
  return sheet;
}

/// Export [games] to [excel].
///
/// The [players] are used to look up player names from their ID's.
Sheet exportGames({
  required final Excel excel,
  required final List<ShowdownGame> games,
  required final List<TeamPlayer> players,
  required final List<LadderNight> nights,
}) {
  final sheet = excel[gamesSheetName]
    ..appendRow([
      TextCellValue('ID'),
      TextCellValue('Ladder Night ID'),
      TextCellValue('Start After Minutes'),
      TextCellValue('First Player ID'),
      TextCellValue('First Player Name'),
      TextCellValue('First Player Coach Name'),
      TextCellValue('Second Player ID'),
      TextCellValue('Second Player Name'),
      TextCellValue('Second Player Coach Name'),
      TextCellValue('Start time'),
      TextCellValue('End Time'),
      TextCellValue('Running Time'),
    ]);
  for (final game in games) {
    final startTime = nights
        .firstWhere((final night) => night.id == game.ladderNightId)
        .getStartTime(game);
    final lockedOn = game.lockedOn ?? startTime;
    final subtract = lockedOn.difference(startTime);
    sheet.appendRow([
      IntCellValue(game.id),
      IntCellValue(game.ladderNightId),
      IntCellValue(game.startAfter),
      IntCellValue(game.firstPlayerId),
      TextCellValue(
        players
            .firstWhere((final player) => player.id == game.firstPlayerId)
            .name,
      ),
      TextCellValue(game.firstPlayerCoachName ?? ''),
      IntCellValue(game.secondPlayerId),
      TextCellValue(
        players
            .firstWhere((final player) => player.id == game.secondPlayerId)
            .name,
      ),
      TextCellValue(game.secondPlayerCoachName ?? ''),
      DateTimeCellValue(
        year: startTime.year,
        month: startTime.month,
        day: startTime.day,
        hour: startTime.hour,
        minute: startTime.minute,
      ),
      DateTimeCellValue(
        year: lockedOn.year,
        month: lockedOn.month,
        day: lockedOn.day,
        hour: lockedOn.hour,
        minute: lockedOn.minute,
      ),
      TextCellValue(subtract.toString()),
    ]);
  }
  return sheet;
}

/// Export [gameContexts] to [excel].
void exportGameSets({
  required final Excel excel,
  required final List<GameContext> gameContexts,
  required final List<TeamPlayer> players,
  required final List<LadderNight> nights,
  required final ShowdownTeam team,
}) {
  exportGames(
    excel: excel,
    games: gameContexts.map((final context) => context.game).toList(),
    players: players,
    nights: nights,
  );
  for (final context in gameContexts) {
    final game = context.game;
    final firstPlayer = context.firstPlayer;
    final secondPlayer = context.secondPlayer;
    final sheet =
        excel['Game #${game.id}: ${firstPlayer.name} vs ${secondPlayer.name}']
          ..appendRow([
            TextCellValue('First Player'),
            TextCellValue('Second Player'),
            TextCellValue('Toss Won'),
          ])
          ..appendRow([
            TextCellValue(firstPlayer.name),
            TextCellValue(secondPlayer.name),
            BoolCellValue(context.game.wonToss),
          ])
          ..appendRow([]);
    for (var i = 0; i < context.sets.length; i++) {
      final setContext = context.sets[i];
      final set = setContext.gameSet;
      final setPlayers = [
        if (set.startingPlayerId == firstPlayer.id)
          firstPlayer
        else
          secondPlayer,
        if (set.startingPlayerId == firstPlayer.id)
          secondPlayer
        else
          firstPlayer,
      ];
      sheet
        ..appendRow([TextCellValue('Set Number'), IntCellValue(i + 1)])
        ..appendRow([])
        ..appendRow([
          TextCellValue('Server Name'),
          TextCellValue('Server Points'),
          TextCellValue('Receiver Name'),
          TextCellValue('Receiver Points'),
          TextCellValue('Serve Number'),
          TextCellValue('Point Type'),
        ]);
      for (var j = 0; j < setContext.points.length; j++) {
        final points = setContext.points.sublist(0, j + 1);
        final includedPoints = points
            .where((final p) => p.showdownPoint.endsPoint)
            .toList();
        final totalServes = includedPoints.length;
        final serveBlock = totalServes ~/ team.servesPerPlayer;
        final currentPlayerIndex = serveBlock % players.length;
        final server = setPlayers[currentPlayerIndex];
        final receiver = setPlayers.firstWhere((final p) => p.id != server.id);
        final serveNumber = (totalServes % team.servesPerPlayer) + 1;
        final point = points[j];
        sheet.appendRow([
          TextCellValue(server.name),
          IntCellValue(getPoints(points, server)),
          TextCellValue(receiver.name),
          IntCellValue(getPoints(points, receiver)),
          IntCellValue(serveNumber),
          TextCellValue(point.showdownPoint.name),
        ]);
      }
    }
  }
}
