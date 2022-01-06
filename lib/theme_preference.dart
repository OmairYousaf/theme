import 'package:shared_preferences/shared_preferences.dart';

class ThemePreferences {
  static const PREF_KEY = 'pref_key';

  setTheme(bool value) async {
    SharedPreferences sharedPrefrences = await SharedPreferences.getInstance();
    sharedPrefrences.setBool(PREF_KEY, value);
  }

  getTheme() async {
    SharedPreferences sharedPrefrences = await SharedPreferences.getInstance();
    return sharedPrefrences.getBool(PREF_KEY);
  }
}
