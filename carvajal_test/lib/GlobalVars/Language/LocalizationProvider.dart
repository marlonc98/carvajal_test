import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalizationProvider with ChangeNotifier {
  Locale _locale = Locale('en', '');

  Locale get locale => _locale;

  set locale(Locale locale) {
    saveLocal(locale.languageCode);
    _locale = locale;
    notifyListeners();
  }

  changeLanguage(String language) {
    saveLocal(language);
    _locale = Locale(language, '');
    notifyListeners();
  }

  saveLocal(language) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('language', language);
  }

  readLocalization() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? lang = prefs.getString('language');
    _locale = Locale(lang ?? 'es', '');
    notifyListeners();
  }

  LocalizationProvider() {
    readLocalization();
  }
}
