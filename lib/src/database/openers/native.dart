import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:ladder/ladder.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

/// Open a native database.
LadderDatabase openDatabase() => LadderDatabase(
  LazyDatabase(() async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File(path.join(directory.path, 'ladder.sqlite3'));
    return NativeDatabase(file);
  }),
);
