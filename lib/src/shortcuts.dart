import 'package:backstreets_widgets/shortcuts.dart';
import 'package:flutter/services.dart';

/// The shortcut for renaming something.
final renameShortcut = CrossPlatformSingleActivator(LogicalKeyboardKey.keyR);

/// The shortcut for changing an email address.
final changeEmailAddressShortcut = CrossPlatformSingleActivator(
  LogicalKeyboardKey.keyE,
);

/// The shortcut for exporting something.
final exportShortcut = CrossPlatformSingleActivator(
  LogicalKeyboardKey.keyX,
  shift: true,
);
