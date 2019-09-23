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
    show BazaarApp, ControllerMVC, Controllers, ThemeChanger;

class HomeDrawer extends ControllerMVC {
  HomePageState state;
  ThemeChanger theme;
  Auth _auth;
  BazaarApp con;

  bool _darkmode;

  @override
  void initState() {
    con = Controllers.of<BazaarApp>();
    _auth = con.auth;
    state = stateMVC;
    theme = state.controllerByType<ThemeChanger>(state.context);
    _darkmode = theme.darkMode;
    // Load the Ad into memory.
    con.ads.setBannerAd();
  }

  String userName() {
    String name = _auth?.displayName?.trim() ?? "";
    if (name.isEmpty) {
      name = _auth?.email ?? "";
      List<String> parts = name.split("@");
      if(parts.isNotEmpty) name = parts[0];
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
    con.ads.showBannerAd(state: this.stateMVC);
    Navigator.of(state.context)
        .push(MaterialPageRoute(builder: (context) => widget))
        .then((_) {
      con.ads.closeBannerAd(load: true);
    });
  }

  Widget get header => UserAccountsDrawerHeader(
        decoration: BoxDecoration(
          color: Color(0xFFB33771),
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
        title: Text("DarkMode"),
        trailing: Switch(
          value: _darkmode,
          onChanged: (val) {
            _darkmode = val;
            theme.setDarkMode(_darkmode);
            refresh();
          },
        ),
      );

  Widget get account => InkWell(
        onTap: () {
          onTap(MyAccount());
        },
        child: state.showList(
          "My Account",
          (Icons.account_box),
        ),
      );

  Widget get orders => InkWell(
        onTap: () {
          onTap(MyOrders());
        },
        child: state.showList(
          "My Orders",
          (Icons.shopping_basket),
        ),
      );

  Widget get settings => InkWell(
        onTap: () {
          onTap(Settings());
        },
        child: state.showList(
          "Settings",
          (Icons.settings),
        ),
      );

  Widget get about => InkWell(
        onTap: () {
          onTap(About());
        },
        child: state.showList(
          "About",
          (Icons.adjust),
        ),
      );

  Widget get contact => InkWell(
        onTap: () {
          onTap(Contact());
        },
        child: state.showList(
          "Contact",
          (Icons.contact_phone),
        ),
      );

  Widget get logout => InkWell(
        onTap: () {
          _auth.signOut().then((value) {
            Navigator.of(state.context).pop();
            Navigator.pushReplacement(state.context,
                MaterialPageRoute(builder: (context) => Login()));
          });
        },
        child: state.showList(
          "LogOut",
          (Icons.exit_to_app),
        ),
      );
}
