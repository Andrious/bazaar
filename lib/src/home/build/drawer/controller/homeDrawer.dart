import 'package:flutter/material.dart';

import 'package:shopping_cart/src/model.dart';
import 'package:shopping_cart/src/view.dart';
import 'package:shopping_cart/src/controller.dart';

class HomeDrawer extends ControllerMVC {
  HomePageState state;
  ThemeChanger theme;

  initState() {
    state = stateMVC;
    theme = state.controllerByType<ThemeChanger>(state.context);
  }

  Widget get header => UserAccountsDrawerHeader(
        decoration: BoxDecoration(
          color: Color(0xFFB33771),
        ),
        accountName: Text("${state.userName()}"),
        accountEmail: Text("${state.email()}"),
        currentAccountPicture: GestureDetector(
          child: CircleAvatar(
            backgroundColor: Colors.blueAccent,
            child: Text("${state.photoUrl()}",
                style: TextStyle(
                  fontSize: 35.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                )),
          ),
        ),
      );

  Widget get darkmode => ListTile(
        leading: state.darkmode
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
          value: state.darkmode,
          onChanged: (val) {
//            setState(() {
              state.darkmode = val;
//           });
            if (state.darkmode) {
                theme.setTheme(ThemeData.dark());
              } else {
                theme.setTheme(ThemeData.light());
              }
          },
        ),
      );

  Widget get account => InkWell(
        onTap: () {
          Navigator.of(state.context)
              .push(MaterialPageRoute(builder: (context) => MyAccount()));
        },
        child: state.showList(
          "My Account",
          (Icons.account_box),
        ),
      );

  Widget get orders => InkWell(
        onTap: () {
          Navigator.of(state.context)
              .push(MaterialPageRoute(builder: (context) => MyOrders()));
        },
        child: state.showList(
          "My Orders",
          (Icons.shopping_basket),
        ),
      );

  Widget get settings => InkWell(
        onTap: () {
          Navigator.of(state.context)
              .push(MaterialPageRoute(builder: (context) => Settings()));
        },
        child: state.showList(
          "Settings",
          (Icons.settings),
        ),
      );

  Widget get about => InkWell(
        onTap: () {
          Navigator.of(state.context)
              .push(MaterialPageRoute(builder: (context) => About()));
        },
        child: state.showList(
          "About",
          (Icons.adjust),
        ),
      );

  Widget get contact => InkWell(
        onTap: () {
          Navigator.of(state.context)
              .push(MaterialPageRoute(builder: (context) => Contact()));
        },
        child: state.showList(
          "Contact",
          (Icons.contact_phone),
        ),
      );

  Widget get logout => InkWell(
        onTap: () {
          FirebaseAuth.instance.signOut().then((value) {
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
