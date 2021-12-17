import 'package:shared_preferences/shared_preferences.dart';

class DarkThemePreferences {
  static const DARK_THEME_KEY = "dark_theme_preference";

  setDarkTheme(bool isEnable) async {
    final pefers = await SharedPreferences.getInstance();
    pefers.setBool(DARK_THEME_KEY, isEnable);
  }

  Future<bool> getDarkTheme() async {
    final prefers = await SharedPreferences.getInstance();
    return prefers.getBool(DARK_THEME_KEY) ?? false;
  }
}
