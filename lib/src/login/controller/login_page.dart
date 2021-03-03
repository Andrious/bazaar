import 'package:bazaar/src/controller.dart' show BazaarApp, ControllerMVC;

import 'package:auth/auth.dart' show Auth;

class LoginPage extends ControllerMVC {
  factory LoginPage() => _this ??= LoginPage._();
  LoginPage._() {
    con = BazaarApp();
    loggedIn = con.loggedIn;
    _auth = con.auth;
  }
  static LoginPage _this;

  BazaarApp con;
  Auth _auth;
  bool loggedIn;

  bool isSignedIn() => _auth?.isLoggedIn() ?? false;

  String email() {
    String email = _auth.email;
    if (email.isEmpty) {
      email = 'Guest User';
    }
    return email;
  }

  Future<bool> signIn(String email, String password) =>
      _auth.signInWithEmailAndPassword(email: email, password: password);

  @override
  bool get inError => _auth.message.isNotEmpty;

  @override
  Exception getError([dynamic error]) => _auth.getError();

  Future<void> msgError(Exception ex) =>
      con.msgError(ex, context: stateMVC.context);
}
