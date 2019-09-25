import 'package:flutter/material.dart' show ChangeNotifier, ThemeData;

import 'package:bazaar/src/controller.dart' show ControllerMVC, Prefs;

// Provider State management to change between themes(Light and Dark).

class ThemeChanger01 extends ChangeNotifier {
  ThemeData themeData;
  ThemeChanger01(this.themeData);

  getTheme() => themeData;
  
  setTheme(ThemeData theme) {
    themeData = theme;
    notifyListeners();
  }
}

class ThemeChanger extends ControllerMVC {

  factory ThemeChanger() => _this ??= ThemeChanger._();
  static ThemeChanger _this;
  ThemeChanger._();

  ThemeData themeData;
  bool _darkmode;

  void initState() {
    _darkmode = Prefs.getBool("darkmode");
    setDarkMode(darkMode);
  }

  bool get darkMode => _darkmode;

  bool setDarkMode(bool darkMode) {
    if (darkMode == null) return false;
    _darkmode = darkMode;
    Prefs.setBool("darkmode", _darkmode);
    setTheme();
    return true;
  }

  getTheme() => themeData;

  setTheme([ThemeData theme]) {
    if (theme != null) {
      themeData = theme;
    } else {
      if (_darkmode) {
        themeData = ThemeData.dark();
      } else {
        themeData = ThemeData.light();
      }
    }
  }
}
