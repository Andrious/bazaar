import 'package:bazaar/src/controller.dart' as c;

import 'package:bazaar/src/view.dart' show Login;

import 'package:mvc_application/view.dart';

///
class BazaarApp extends AppState {
  ///
  BazaarApp()
      : super(
          con: c.BazaarApp(),
          title: 'e-Bazaar',
          debugShowCheckedModeBanner: false,
          home: const Login(),
          controllers: [
            c.ThemeChanger(),
          ],
        );
}
