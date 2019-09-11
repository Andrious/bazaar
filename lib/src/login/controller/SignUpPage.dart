///
/// Copyright (C) 2019 Andrious Solutions
///
/// This program is free software; you can redistribute it and/or
/// modify it under the terms of the GNU General Public License
/// as published by the Free Software Foundation; either version 3
/// of the License, or any later version.
///
/// You may obtain a copy of the License at
///
///  http://www.apache.org/licenses/LICENSE-2.0
///
///
/// Unless required by applicable law or agreed to in writing, software
/// distributed under the License is distributed on an "AS IS" BASIS,
/// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
/// See the License for the specific language governing permissions and
/// limitations under the License.
///
///          Created  08 Sep 2019
///
///

import 'package:mvc_application/mvc.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:shopping_cart/src/login/model/firebaseDB/googleSignIn.dart';
import 'package:shopping_cart/src/login/model/firebaseDB/userManagement.dart';

class SignUpPage extends ControllerMVC {

  Auth auth = Auth();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  UserManagement userManagement = UserManagement();

  Future<bool> signUpUser(
      String userName, String email, String password) async {
    FirebaseUser user = await firebaseAuth.currentUser();
    bool signUp = user == null;
    if (signUp) {
      firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((user) {
        // user.sendEmailVerification();
        // here user.uid triggers an id inside the user which should match id of the user document
        userManagement.createUser(user.uid.toString(), {
          'userId': user.uid,
          'username': userName.toString(),
          'email': email,
        }).CatchError((ex) {
          print("signUpUser(): ${ex.toString()}");
        });
      });
    }
    return signUp;
  }

  Future<bool> googleSignIn() async {
    FirebaseUser user = await auth.googleSignIn();
    bool signIn = user != null;
    if (signIn) {
      // user.sendEmailVerification();
      userManagement.createUser(user.uid, {
        "userId": user.uid,
        "username": user.displayName,
        "photoUrl": user.photoUrl,
        "email": user.email,
      });
    }
    return signIn;
  }

  bool get inError => auth.ex != null;

  Exception getError(){
    final ex = auth.ex;
    auth.ex = null;
    return ex;
  }
}
