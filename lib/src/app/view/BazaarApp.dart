import 'package:flutter/material.dart' show ThemeData;

import 'package:mvc_application/view.dart' show AppView;

import 'package:bazaar/src/view.dart' show Login;

import 'package:bazaar/src/controller.dart' as c;

class BazaarApp extends AppView {
  BazaarApp()
      : super(
          con: c.BazaarApp(),
          title: "e-Bazaar",
          debugShowCheckedModeBanner: false,
          home: Login(),
          controllers: [
            c.ThemeChanger(),
          ],
        );

  ThemeData onTheme() => c.ThemeChanger()?.getTheme();
}
