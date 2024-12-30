import 'package:flutter/material.dart';
import 'package:personal_project/theme/color_theme.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;
  ThemeMode get themeMode => _themeMode;
  bool get isDarkMode => _themeMode == ThemeMode.dark;

  void toggleTheme(bool isDark) {
    _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }

  Color get backgroundColor =>
      isDarkMode ? ColorTheme.darkBackground : ColorTheme.lightBackground;
}
