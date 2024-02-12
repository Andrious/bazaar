import 'package:bazaar/src/controller.dart' as c;

import 'package:bazaar/src/view.dart' show Login;

import 'package:fluttery_framework/view.dart';

///
class MyApp extends AppStatefulWidget {
  ///
  MyApp({Key? key}) : super(key: key);
  @override
  AppState createAppState() => _BazaarAppState();
}

///
class _BazaarAppState extends AppState {
  ///
  _BazaarAppState()
      : super(
          title: 'e-Bazaar',
          debugShowCheckedModeBanner: false,
          controller: c.BazaarApp(),
          controllers: [
            c.ThemeChanger(),
          ],
          allowChangeTheme: true,
          allowChangeLocale: true,
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
