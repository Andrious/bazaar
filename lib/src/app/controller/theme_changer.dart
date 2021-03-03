import 'package:flutter/material.dart' show ChangeNotifier, ThemeData;

import 'package:bazaar/src/controller.dart' show ControllerMVC, Prefs;

// Provider State management to change between themes(Light and Dark).

class ThemeChanger01 extends ChangeNotifier {
  ThemeChanger01(this.themeData);
  ThemeData themeData;

  ThemeData getTheme() => themeData;

  void setTheme(ThemeData theme) {
    themeData = theme;
    notifyListeners();
  }
}

class ThemeChanger extends ControllerMVC {
  factory ThemeChanger() => _this ??= ThemeChanger._();
  ThemeChanger._();
  static ThemeChanger _this;

  ThemeData themeData;
  bool _darkmode;

  @override
  void initState() {
    _darkmode = Prefs.getBool('darkmode');
    setDarkMode(dark: darkMode);
  }

  bool get darkMode => _darkmode;

  bool setDarkMode({bool dark}) {
    if (dark == null) {
      return false;
    }
    _darkmode = dark;
    Prefs.setBool('darkmode', _darkmode);
    setTheme();
    return true;
  }

  ThemeData getTheme() => themeData;

  void setTheme([ThemeData theme]) {
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
