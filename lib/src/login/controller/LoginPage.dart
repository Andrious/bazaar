import 'package:bazaar/src/controller.dart'
    show BazaarApp, ControllerMVC, Controllers;

import 'package:auth/auth.dart' show Auth;

class LoginPage extends ControllerMVC {
  factory LoginPage() => _this ??= LoginPage._();
  static LoginPage _this;
  LoginPage._() {
    con = BazaarApp();
    loggedIn = con.loggedIn;
    _auth = con.auth;
  }

  BazaarApp con;
  Auth _auth;
  bool loggedIn;

  Future<bool> isSignedIn() async {
    bool isIn = await _auth?.isLoggedIn() ?? false;
    return isIn;
  }

  String email() {
    String email = _auth.email;
    if (email.isEmpty) email = "Guest User";
    return email;
  }

  Future<bool> signIn(String email, String password) =>
      _auth.signInWithEmailAndPassword(email: email, password: password);

  bool get inError => _auth.message.isNotEmpty;

  @override
  Exception getError([dynamic error]) => _auth.getError();

  Future<void> msgError(Exception ex) =>
      con.msgError(ex, context: stateMVC.context);
}
