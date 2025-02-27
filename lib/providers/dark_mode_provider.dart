import 'package:flutter/material.dart';

class DarkModeProvider extends ChangeNotifier {

  bool _darkMode = false;
  bool get isDark => _darkMode;

  ThemeMode getDarkMode(){
    ThemeMode theme;
    isDark ? theme = ThemeMode.dark : theme = ThemeMode.light;
    return theme;
  }

  void setDarkMode(){
    _darkMode = !_darkMode;
    notifyListeners();
  }

}