import 'package:flutter/material.dart'
    show
        BoxDecoration,
        CircleAvatar,
        Color,
        Colors,
        FontWeight,
        GestureDetector,
        Icons,
        Image,
        InkWell,
        ListTile,
        MaterialPageRoute,
        Navigator,
        Switch,
        Text,
        TextStyle,
        UserAccountsDrawerHeader,
        Widget;

import 'package:auth/auth.dart' show Auth;

import 'package:bazaar/src/view.dart' hide BazaarApp;

import 'package:bazaar/src/controller.dart'
    show BazaarApp, ControllerMVC, ThemeChanger;

class HomeDrawer extends ControllerMVC {
  factory HomeDrawer() => _this ?? HomeDrawer._();
  static HomeDrawer _this;
  HomeDrawer._();

  HomePageState _state;
  ThemeChanger _theme;
  Auth _auth;
  BazaarApp _con;

  bool _darkmode;

  @override
  void initState() {
    _con = BazaarApp();
    _auth = _con.auth;
    _state = stateMVC;
    _theme = ThemeChanger();
    _darkmode = _theme.darkMode;
    // Load the Ad into memory.
    _con.ads.setBannerAd();
  }

  String userName() {
    String name = _auth?.displayName?.trim() ?? "";
    if (name.isEmpty) {
      name = _auth?.email ?? "";
      List<String> parts = name.split("@");
      if (parts.isNotEmpty) name = parts[0];
    }
    return name;
  }

  String email() {
    String email = _auth?.email ?? "";
    if (email.isEmpty) email = "No Email Address";
    return email;
  }

  String photoUrl() {
    if (_auth?.photoUrl != null && _auth.photoUrl.isNotEmpty) {
      return _auth.photoUrl;
    } else {
      return "A";
    }
  }

  void onTap(Widget widget) {
    _con.ads.showBannerAd(state: _state);
    Navigator.of(_state.context)
        .push(MaterialPageRoute(builder: (context) => widget))
        .then((_) {
      _con.ads.closeBannerAd(load: true);
    });
  }

  Widget get header => UserAccountsDrawerHeader(
        decoration: BoxDecoration(
          color: const Color(0xFFB33771),
        ),
        accountName: Text("${userName()}"),
        accountEmail: Text("${email()}"),
        currentAccountPicture: GestureDetector(
          child: CircleAvatar(
            backgroundColor: Colors.blueAccent,
            child: Text("${photoUrl()}",
                style: TextStyle(
                  fontSize: 35.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                )),
          ),
        ),
      );

  Widget get darkmode => ListTile(
        leading: _darkmode
            ? Image.asset(
                'images/moon.png',
                height: 30.0,
                width: 26.0,
              )
            : Image.asset(
                'images/sunny.png',
                height: 30.0,
                width: 26.0,
              ),
        title: const Text("DarkMode"),
        trailing: Switch(
          value: _darkmode,
          onChanged: (val) {
            _darkmode = val;
            _theme.setDarkMode(_darkmode);
            refresh();
          },
        ),
      );

  Widget get account => InkWell(
        onTap: () {
          onTap(MyAccount());
        },
        child: _state.showList(
          "My Account",
          (Icons.account_box),
        ),
      );

  Widget get orders => InkWell(
        onTap: () {
          onTap(MyOrders());
        },
        child: _state.showList(
          "My Orders",
          (Icons.shopping_basket),
        ),
      );

  Widget get settings => InkWell(
        onTap: () {
          onTap(Settings());
        },
        child: _state.showList(
          "Settings",
          (Icons.settings),
        ),
      );

  Widget get about => InkWell(
        onTap: () {
          onTap(About());
        },
        child: _state.showList(
          "About",
          (Icons.adjust),
        ),
      );

  Widget get contact => InkWell(
        onTap: () {
          onTap(Contact());
        },
        child: _state.showList(
          "Contact",
          (Icons.contact_phone),
        ),
      );

  Widget get logout => InkWell(
        onTap: () {
          _auth.signOut().then((value) {
            Navigator.of(_state.context).pop();
            Navigator.pushReplacement(_state.context,
                MaterialPageRoute(builder: (context) => Login()));
            _state.refresh();
          });
        },
        child: _state.showList(
          "LogOut",
          (Icons.exit_to_app),
        ),
      );
}
