import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:shopping_cart/src/blocs/themeChanger.dart';

import 'package:shopping_cart/src/login/view/loginPage.dart';

import 'package:mvc_application/mvc.dart' show App, AppView, Controllers;

void main() {
  runApp(MyApp());
}

class MyApp extends App {
  @override
  createView() => BazaarApp();
}

class BazaarApp extends AppView {
  BazaarApp()
      : super(
          title: "e-Bazaar",
          debugShowCheckedModeBanner: false,
          home: Login(),
          controllers: [
            ThemeChanger(ThemeData.light()),
          ],
        );

  ThemeData onTheme() => Controllers.of<ThemeChanger>()?.getTheme();
}

