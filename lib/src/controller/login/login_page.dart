//import 'package:auth/auth.dart' show Auth;

import 'package:bazaar/src/controller.dart' show BazaarApp, StateXController;

///
class LoginPage extends StateXController {
  ///
  factory LoginPage() => _this ??= LoginPage._();
  LoginPage._() {
    con = BazaarApp();
    loggedIn = false; //con.loggedIn!;
//    _auth = con.auth;
  }
  static LoginPage? _this;

  ///
  late BazaarApp con;

//  late Auth _auth;

  ///
  late bool loggedIn;

  ///
  bool isSignedIn() => false; // _auth.isLoggedIn(); //?? false;

  ///
  String email() {
    String email = ''; //_auth.email;
    if (email.isEmpty) {
      email = 'Guest User';
    }
    return email;
  }

  ///
  Future<bool> signIn(String email, String password) => Future.value(
      false); //    _auth.signInWithEmailAndPassword(email: email, password: password);

  ///
  bool get inError => false; // _auth.message.isNotEmpty;

  ///
  Exception? getError([dynamic error]) => null; //_auth.getError();

  ///
  Future<void> msgError(Exception ex) =>
      con.msgError(ex, context: state!.context);
}
