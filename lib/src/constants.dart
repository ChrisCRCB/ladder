import 'package:intl/intl.dart';

/// The title to use for delete confirmation dialogues.
const deleteConfirmationTitle = 'Confirm Delete';

/// The key used for the application settings.
const applicationSettingsKey = 'ladder_application_preferences';

/// The default points to use when creating new teams.
const defaultPoints = <String, int>{
  'Goal': 2,
  'Body touch': -1,
  'Hand infringement': -1,
  'Touched shades': -2,
  'Long serve': -1,
  'Short serve': -1,
  'Centre board': -1,
  'Out': -1,
  'Illegal serve': -1,
  'Own goal': -2,
};

/// The date format to use.
final dateFormat = DateFormat('EEEE d MMMM y HH:mm');
