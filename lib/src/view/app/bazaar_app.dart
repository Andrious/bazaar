import 'package:bazaar/src/controller.dart' as c;

import 'package:bazaar/src/view.dart' show Login;

import 'package:fluttery_framework/view.dart';

///
class BazaarApp extends AppState {
  ///
  BazaarApp()
      : super(
          title: 'e-Bazaar',
          debugShowCheckedModeBanner: false,
          controller: c.BazaarApp(),
          controllers: [
            c.ThemeChanger(),
          ],
          locale: const Locale('en', 'CA'),
          supportedLocales: const [
            Locale('en', 'US'),
            Locale('en', 'GB'),
            Locale('en', 'AU'),
          ],
          localizationsDelegates: const [
            GlobalCupertinoLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          home: const Login(),
        );
}
