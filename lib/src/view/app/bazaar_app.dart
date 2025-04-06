import 'package:bazaar/src/controller.dart' as c;

import 'package:bazaar/src/view.dart' show Login;

import 'package:fluttery_framework/view.dart';

///
class MyApp extends AppStatefulWidget {
  ///
  MyApp({Key? key}) : super(key: key);
  @override
  AppStateX createAppState() => _BazaarAppState();
}

///
class _BazaarAppState extends AppStateX {
  ///
  _BazaarAppState()
      : super(
          title: 'e-Bazaar',
          debugShowCheckedModeBanner: false,
          controller: c.BazaarApp(),
          controllers: [
            c.ThemeChanger(),
          ],
          errorHandler: c.AppErrorHandler.errorHandler,
          errorScreen: c.AppErrorHandler.displayErrorWidget,
          inUnknownRoute: c.AppErrorHandler.onUnknownRoute,
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
