import 'package:mvc_application/view.dart';

import 'package:bazaar/src/view.dart' show Login;

import 'package:bazaar/src/controller.dart' as c;

class BazaarApp extends AppState {
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
