import 'package:bazaar/src/controller.dart' show StateXController, Prefs;

import 'package:bazaar/src/view.dart' show App;

import 'package:flutter/material.dart' show ChangeNotifier, ThemeData;

// Provider State management to change between themes(Light and Dark).

///
class ThemeChanger01 extends ChangeNotifier {
  ///
  ThemeChanger01(this.themeData);

  ///
  ThemeData themeData;

  ///
  ThemeData getTheme() => themeData;

  ///
  void setTheme(ThemeData theme) {
    themeData = theme;
    notifyListeners();
  }
}

///
class ThemeChanger extends StateXController {
  ///
  factory ThemeChanger() => _this ??= ThemeChanger._();
  ThemeChanger._();
  static ThemeChanger? _this;

  ///
  late bool _darkmode;

  @override
  void initState() {
    super.initState();
    _darkmode = Prefs.getBool('darkmode');
    setDarkMode(dark: darkMode);
  }

  ///
  bool get darkMode => _darkmode;

  ///
  bool setDarkMode({bool? dark}) {
    if (dark == null) {
      return false;
    }
    _darkmode = dark;
    Prefs.setBool('darkmode', _darkmode);
    setTheme();
    return true;
  }

  ///
  ThemeData getTheme() => App.themeData!;

  ///
  void setTheme([ThemeData? theme]) {
    if (theme != null) {
      App.themeData = theme;
    } else {
      if (_darkmode) {
        App.themeData = ThemeData.dark();
      } else {
        App.themeData = ThemeData.light();
      }
    }
    App.iOSThemeData = App.themeData;
  }
}
