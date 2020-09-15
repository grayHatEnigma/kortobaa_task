import 'package:flutter/material.dart';

/// * This manager will be responsible of changing and preserve app localization ( selected language ) state across the entire app. *
class LocalizationManager with ChangeNotifier {
  Locale _locale;
  Locale get locale => _locale;

  void setLocale(Localization newLocale) {
    if (newLocale == Localization.En) {
      _locale = Locale('en');
      print('English is selected');
    } else if (newLocale == Localization.Ar) {
      _locale = Locale('ar');
      print('Arabic is selected');
    }
    notifyListeners();
  }
}

// ***  Localization ***
enum Localization {
  Ar,
  En,
}
