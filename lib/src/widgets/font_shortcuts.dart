import 'package:backstreets_widgets/extensions.dart';
import 'package:backstreets_widgets/shortcuts.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ladder/ladder.dart';

/// A widget which allows changing the font size used by the application.
class FontShortcuts extends ConsumerWidget {
  /// Create an instance.
  const FontShortcuts({required this.child, super.key});

  /// The widget below this widget in the tree.
  final Widget child;

  /// Build the widget.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final value = ref.watch(applicationSettingsProvider);
    return value.when(
      data: (final preferences) {
        void changeFontSize(final double amount) {
          preferences.fontSize = (preferences.fontSize + amount).clamp(8, 500);
          context.announce('Font size ${preferences.fontSize.floor()}');
          preferences.save(ref);
        }

        return CallbackShortcuts(
          bindings: {
            CrossPlatformSingleActivator(LogicalKeyboardKey.equal): () =>
                changeFontSize(2.0),
            CrossPlatformSingleActivator(LogicalKeyboardKey.minus): () =>
                changeFontSize(-2.0),
          },
          child: child,
        );
      },
      error: ErrorListView.withPositional,
      loading: () => child,
    );
  }
}
