import 'package:flutter/material.dart'
    show
        AlertDialog,
        AppBar,
        BorderRadius,
        BuildContext,
        Center,
        Color,
        Colors,
        Column,
        Container,
        EdgeInsets,
        FontWeight,
        ListTile,
        MainAxisAlignment,
        MaterialButton,
        MediaQuery,
        Padding,
        RoundedRectangleBorder,
        Scaffold,
        SizedBox,
        State,
        StatefulWidget,
        Text,
        TextStyle,
        Widget,
        showDialog;

import 'package:auth/auth.dart' show Auth;

import 'package:bazaar/src/controller.dart' show BazaarApp, Controllers;

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  void initState() {
    super.initState();
    BazaarApp con = Controllers.of<BazaarApp>();
    _auth = con.auth;
  }

  Auth _auth;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFFB33771),
        title: const Text("Settings"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: const Text(
                "If you want to reset your password click the button",
                style: const TextStyle(fontSize: 18.0),
              ),
            ),
            const SizedBox(height: 20.0),
            MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(25.0)),
                color: const Color(0xFFB33771),
                minWidth: MediaQuery.of(context).size.width,
                child: ListTile(
                  title: Center(
                    child: Text(
                      "Reset Password",
                      style: _btnStyle(),
                    ),
                  ),
                ),
                onPressed: () async {
                  await _auth.sendPasswordResetEmail(email: _auth.email);
                  passwordResetDialog();
                }),
          ],
        ),
      ),
    );
  }

  TextStyle _btnStyle() {
    return TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
    );
  }

  void passwordResetDialog() {
    var alert = AlertDialog(
      content: Container(
        padding: const EdgeInsets.all(10.0),
        child: Text(
            "Password Reset Link Has Been Sent To Your EmailID: ${_auth.email}"),
      ),
    );
    showDialog(context: context, builder: (_) => alert);
  }
}
