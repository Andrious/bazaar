import 'package:flutter/material.dart'
    show
        AppBar,
        BorderRadius,
        BuildContext,
        Card,
        Center,
        Color,
        Colors,
        Column,
        Container,
        Divider,
        EdgeInsets,
        FontWeight,
        ListTile,
        ListView,
        MainAxisAlignment,
        MaterialButton,
        MaterialPageRoute,
        MediaQuery,
        Navigator,
        Padding,
        RoundedRectangleBorder,
        Scaffold,
        SizedBox,
        State,
        StatefulWidget,
        Text,
        TextStyle,
        Widget;

import 'package:flutter/painting.dart'
    show
        BorderRadius,
        Color,
        EdgeInsets,
        FontWeight,
        RoundedRectangleBorder,
        TextStyle;

import 'package:auth/auth.dart' show Auth;

import 'package:bazaar/src/view.dart' hide BazaarApp;

import 'package:bazaar/src/controller.dart' show BazaarApp, Controllers;

class MyAccount extends StatefulWidget {
  @override
  _MyAccountState createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  Auth _auth;

  @override
  void initState() {
    BazaarApp con = Controllers.of<BazaarApp>();
    _auth = con.auth;
    super.initState();
  }

  String get userName {
    if (_auth.displayName == null || _auth.displayName.isEmpty) {
      return _auth.email.replaceAll('@gmail.com', '');
    }
    return _auth.displayName;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFFB33771),
        title: Text("MyAccount"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.fromLTRB(20.0, 10.0, 0.0, 20.0),
              child: Text(
                "Login & Security",
                style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
              ),
            ),
            Card(
              elevation: 5.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
                    child: Text(
                      "Name:",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
                    child: Text(
                      "$userName",
                    ),
                  ),
                  Divider(
                    height: 2.0,
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
                    child: Text(
                      "Email:",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
                    child: Text(
                      "${_auth.email}",
                    ),
                  ),
                  Divider(
                    height: 2.0,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            MaterialButton(
              minWidth: MediaQuery.of(context).size.width,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
              ),
              child: ListTile(
                title: Center(
                  child: Text(
                    "LogOut",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              onPressed: () {
                _auth.signOut().then((_) {
                  Navigator.of(context).pop();
                  //                 Navigator.of(context).pop();

                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => Login()));
                }).catchError((e) => print(e.toString()));
              },
              color: Color(0xFFB33771),
            ),
          ],
        ),
      ),
    );
  }
}
