import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class LocalizationsDelegates {
  static final List<LocalizationsDelegate<void>> locations = <LocalizationsDelegate<void>>[
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ];
}
