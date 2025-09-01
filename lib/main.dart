import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ladder/ladder.dart';

/// The main function is the entry point of the application.
void main() {
  runApp(const ProviderScope(child: MyApp()));
}

/// The top-level app class.
class MyApp extends StatelessWidget {
  /// Create an instance.
  const MyApp({super.key});

  /// Build the widget.
  @override
  Widget build(final BuildContext context) => MaterialApp(
    title: 'Ladder',
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    ),
    home: const _HomeScreen(),
  );
}

class _HomeScreen extends ConsumerStatefulWidget {
  /// Create an instance.
  const _HomeScreen();

  /// Create state for this widget.
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

/// State for [_HomeScreen].
class _HomeScreenState extends ConsumerState<_HomeScreen> {
  /// The database to use.
  late LadderDatabase _database;

  /// Dispose of the widget.
  @override
  void dispose() {
    super.dispose();
    _database.close();
  }

  /// Build a widget.
  @override
  Widget build(final BuildContext context) {
    _database = ref.watch(databaseProvider);
    if (kIsWeb) {
      RendererBinding.instance.ensureSemantics();
      if (kDebugMode) {
        print(
          // ignore: lines_longer_than_80_chars
          'Forcing semantics on web. Target platform: ${defaultTargetPlatform.name}.',
        );
      }
    }
    return const TeamsScreen();
  }
}
