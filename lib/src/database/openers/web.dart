import 'package:drift/drift.dart';
import 'package:drift/wasm.dart' show WasmDatabase;
import 'package:flutter/foundation.dart';
import 'package:ladder/src/database/_database.dart';

/// Open a web database.
LadderDatabase openDatabase() => LadderDatabase(_connectOnWeb());

/// Open a web database.
DatabaseConnection _connectOnWeb() => DatabaseConnection.delayed(
  Future(() async {
    final result = await WasmDatabase.open(
      databaseName: 'my_app_db', // prefer to only use valid identifiers here
      sqlite3Uri: Uri.parse('sqlite3.wasm'),
      driftWorkerUri: Uri.parse('drift_worker.dart.js'),
    );

    if (result.missingFeatures.isNotEmpty) {
      // Depending how central local persistence is to your app, you may want
      // to show a warning to the user if only unreliable implementations
      // are available.
      if (kDebugMode) {
        print(
          'Using ${result.chosenImplementation} due to missing browser '
          'features: ${result.missingFeatures}',
        );
      }
    }

    return result.resolvedExecutor;
  }),
);
