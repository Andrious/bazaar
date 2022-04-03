import 'dart:async' show Future;
import 'dart:io' show Platform;

import 'package:ads/ads.dart' show Ads;
//import 'package:auth/auth.dart' show Auth;
import 'package:bazaar/src/controller.dart' show AppController;
import 'package:bazaar/src/view.dart' show MsgBox;
import 'package:flutter/material.dart' show BuildContext;
import 'package:flutter/services.dart' show PlatformException;

///
class BazaarApp extends AppController {
  ///
  factory BazaarApp() => _this ??= BazaarApp._();
  BazaarApp._() {
//    auth = Auth();
  }

  ///
  static BazaarApp? _this;

  ///
//  late Auth auth;

  ///
  late Ads ads;

  ///
  bool? loggedIn;

  @override
  void initState() {
    super.initState();
    ads = Ads(
      trackingId: Platform.isAndroid
          ? 'ca-app-pub-3940256099942544~3347511713'
          : 'ca-app-pub-3940256099942544~1458002511',
      bannerUnitId: Platform.isAndroid
          ? 'ca-app-pub-3940256099942544/6300978111'
          : 'ca-app-pub-3940256099942544/2934735716',
      screenUnitId: Platform.isAndroid
          ? 'ca-app-pub-3940256099942544/1033173712'
          : 'ca-app-pub-3940256099942544/4411468910',
      videoUnitId: Platform.isAndroid
          ? 'ca-app-pub-3940256099942544/5224354917'
          : 'ca-app-pub-3940256099942544/1712485313',
      keywords: ['bazaar', 'clothing'],
      testing: false,
    );
  }

  @override
  Future<bool> initAsync() async {
    final bool init = await super.initAsync();
    //   loggedIn = auth.isLoggedIn() ?? false;
    return init;
  }

  @override
  void dispose() {
//    auth.dispose();
    ads.dispose();
    super.dispose();
  }

  ///
  Future<void> msgError(Exception ex, {required BuildContext context}) {
    String msg, title;
    if (ex is PlatformException) {
      final PlatformException px = ex;
      if (px.code.contains('NOT_FOUND')) {
        title = 'Sign Up Required';
        msg =
            "Looks like you need to register first.\nYou're not found in the system.";
      } else {
        title = px.code;
        msg = px.message ?? '';
      }
    } else {
      title = 'Error';
      msg = ex.toString();
    }
    return MsgBox(context: context, title: title, msg: msg).show();
  }
}
