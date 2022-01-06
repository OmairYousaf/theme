import 'package:flutter/cupertino.dart';
import 'package:theme_project/theme_preference.dart';

class ThemeModel extends ChangeNotifier {
  bool _isDark = false;
  ThemePreferences themePreferences = ThemePreferences();
  bool get isDark => _isDark;

  ThemeModel() {
    _isDark = false;
    themePreferences = ThemePreferences();
    getPreferences();
  }

  getPreferences() async {
    _isDark = await themePreferences.getTheme();
    notifyListeners();
  }

  set isDark(bool value) {
    _isDark = value;
    themePreferences.setTheme(value);
    notifyListeners();
  }
}
