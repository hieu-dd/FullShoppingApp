import 'package:flutter/material.dart';
import 'package:full_shop_app/model/dark_theme_preferences.dart';

class DarkThemeProvider with ChangeNotifier {
  bool _darkTheme = false;
  bool _firstInit = true;
  final darkThemePrefers = DarkThemePreferences();

  bool get darkTheme {
    if (_firstInit) {
      refreshDarkTheme();
    }
    return _darkTheme;
  }

  refreshDarkTheme() async {
    final theme = await darkThemePrefers.getDarkTheme();
    _darkTheme = theme;
    notifyListeners();
    _firstInit = false;
  }

  set darkTheme(bool enable) {
    _darkTheme = enable;
    darkThemePrefers.setDarkTheme(enable);
    notifyListeners();
  }
}
