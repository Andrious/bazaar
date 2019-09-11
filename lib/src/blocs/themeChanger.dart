import 'package:flutter/material.dart';

import 'package:mvc_application/mvc.dart';

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
  ThemeData themeData;
  ThemeChanger(this.themeData);

  getTheme() => themeData;
  setTheme(ThemeData theme) {
    themeData = theme;
    refresh();
  }
}