import 'package:flutter/material.dart';

import 'package:shopping_cart/src/controller.dart';
import 'package:shopping_cart/src/view.dart';

import 'package:shopping_cart/src/login/view/loginPage.dart';
import 'package:shopping_cart/src/home/view/homepage.dart';

//import 'package:shopping_cart/src/model/firebaseDB/googleSignIn.dart';
//import 'package:shopping_cart/src/model/firebaseDB/userManagement.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends StateMVC<SignUp>
    with SingleTickerProviderStateMixin {
  _SignUpState() : super(SignUpPage()) {
    con = controller;
  }
  SignUpPage con;

//// Google sign in
//  Auth auth = Auth();
//// Google sign in

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
//  UserManagement userManagement = UserManagement();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  Animation animation, delayAnimation, muchDelayedAnimation;
  AnimationController animationController;
  bool hidePass = true;
  SharedPreferences preferences;
  bool isLoading = false;
  bool isLoggedIn = false;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 2000),
    );
    animation = Tween(begin: -1.0, end: 0.0).animate(
      CurvedAnimation(curve: Curves.fastOutSlowIn, parent: animationController),
    );
    delayAnimation = Tween(begin: -1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
      ),
    );
    muchDelayedAnimation = Tween(begin: -1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Interval(0.7, 1.0, curve: Curves.fastOutSlowIn),
      ),
    );

    isSignedIn();
  }

  void isSignedIn() async {
    setState(() {
      isLoading = true;
    });
    preferences = await SharedPreferences.getInstance();
    if (isLoggedIn) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    animationController.forward();
    final width = MediaQuery.of(context).size.width;

    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget child) {
        return Scaffold(
          body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomRight,
                end: Alignment.topLeft,
                stops: [0.5, 0.8],
                colors: [
                  Colors.cyanAccent,
                  Colors.tealAccent,
                ],
              ),
            ),
            padding: const EdgeInsets.all(15.0),
            child: Center(
              child: ListView(
                children: <Widget>[
                  InkWell(
                    child: Container(
                      alignment: Alignment.topLeft,
                      child: IconButton(
                        icon: Icon(Icons.arrow_back),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Login()));
                    },
                    child: Transform(
                      transform: Matrix4.translationValues(
                          animation.value * width, 0.0, 0.0),
                      child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                        child: Text(
                          "SignUp",
                          style: _loginRegStyles(),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30.0),
                  Transform(
                    transform: Matrix4.translationValues(
                        delayAnimation.value * width, 0.0, 0.0),
                    child: Form(
                      key: _formKey,
                      autovalidate: true,
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                            controller: _nameController,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.supervised_user_circle,
                                  color: Colors.blueGrey),
                              hintText: "Username",
                              labelText: "Username",
                            ),
                            validator: (val) {
                              if (val.isEmpty) {
                                return "Please Provide Username";
                              }
                              return null;
                            },
                            onSaved: (val) {
                              _emailController.text = val;
                            },
                            autocorrect: true,
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          TextFormField(
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.alternate_email,
                                    color: Colors.blueGrey),
                                hintText: "Email",
                                labelStyle: TextStyle(
                                    // color: Colors.white,
                                    ),
                                labelText: "Email"),
                            validator: (val) {
                              if (val.isEmpty) {
                                return "Please Provide Email";
                              }
                              return null;
                            },
                            onSaved: (val) {
                              _emailController.text = val;
                            },
                            autocorrect: true,
                          ),
                          SizedBox(
                            height: 10.0,
                          ),

                          TextFormField(
                            controller: _passwordController,
                            obscureText: hidePass,
                            decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    Icons.remove_red_eye,
                                    color: Colors.blueGrey,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      hidePass = false;
                                    });
                                  },
                                ),
                                prefixIcon: Icon(
                                  Icons.lock,
                                  color: Colors.blueGrey,
                                ),
                                hintText: "Password",
                                labelText: "Password"),
                            validator: (val) {
                              if (val.length < 6) {
                                return "Passsword must contain atleast 6 characters";
                              }
                              return null;
                            },
                            onSaved: (val) {
                              _passwordController.text = val;
                            },
                            autocorrect: true,
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          TextFormField(
                            controller: _confirmPasswordController,
                            obscureText: hidePass,
                            decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    Icons.remove_red_eye,
                                    color: Colors.blueGrey,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      hidePass = false;
                                    });
                                  },
                                ),
                                prefixIcon: Icon(
                                  Icons.lock,
                                  color: Colors.blueGrey,
                                ),
                                hintText: "Confirm Password",
                                labelText: "Confirm Password"),
                            validator: (val) {
                              if (val.length < 6) {
                                return "Passsword must contain atleast 6 characters";
                              } else if (val.isEmpty) {
                                return "Password field can't be empty";
                              } else if (_passwordController.text != val) {
                                return "Password and Confirm Password didn't match";
                              }
                              return null;
                            },
                            onSaved: (val) {
                              _passwordController.text = val;
                            },
                            autocorrect: true,
                          ),

                          SizedBox(
                            height: 20.0,
                          ),
                          //  ================== Login Btn =======================
                          Transform(
                            transform: Matrix4.translationValues(
                                muchDelayedAnimation.value * width, 0.0, 0.0),
                            child: MaterialButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(25.0),
                              ),
                              minWidth: MediaQuery.of(context).size.width,
                              child: ListTile(
                                title: Center(
                                  child: Text(
                                    "Signup For Free",
                                    style: _btnStyle(),
                                  ),
                                ),
                              ),
                              onPressed: () async {
                                signUpUser();
                              },
                              color: Color(0xFFB33771),
                            ),
                          ),

                          SizedBox(
                            height: 5.0,
                          ),
                          Container(
                            child: Text("OR"),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),

                          //  ================== Signin with Google Btn =======================

                          Transform(
                            transform: Matrix4.translationValues(
                                muchDelayedAnimation.value * width, 0.0, 0.0),
                            child: MaterialButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      new BorderRadius.circular(25.0)),
                              minWidth: MediaQuery.of(context).size.width,
                              child: ListTile(
                                leading: Image.asset(
                                  "images/google.png",
                                  height: 30.0,
                                ),
                                title: Text(
                                  "SignIn With Google",
                                  style: _btnStyle(),
                                ),
                              ),
                              onPressed: () async {
                                _showDialogue();
                                final signIn = await con.googleSignIn();
                                Navigator.pop(context);
                                if (signIn) {
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (context) => HomePage()));
                                } else {
                                  if (con.inError) {
                                    _showDialogue(text: con.getError().toString());
                                  } else {
                                    Navigator.pop(context);
                                  }
                                }
                              },
                              color: Colors.redAccent,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Visibility(
                    visible: isLoading ?? true,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  TextStyle _btnStyle() {
    return TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
    );
  }

  TextStyle _loginRegStyles() {
    return TextStyle(
      fontWeight: FontWeight.w800,
      fontSize: 18.0,
      letterSpacing: 0.8,
      color: Color(0xFFB33771),
    );
  }

  Future signUpUser() async {
//    print("signUp");
    FormState formState = _formKey.currentState;
    if (formState.validate()) {
      formState.reset();
      _loadingDialog();
      if (_formKey.currentState.validate()) {
        _formKey.currentState.save();
        final signIn = await con.signUpUser(_nameController.text,
            _emailController.text, _passwordController.text);
        if (signIn) {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => HomePage()));
        }
      }
    }
  }

  _loadingDialog() => _showDialogue(
          content: Row(
        children: [
          CircularProgressIndicator(),
          Text("Loading!")
        ],
      ));

  _showDialogue({
    String text,
    Widget content,
    List<Widget> buttons,
  }) {
    if (text != null && content == null) {
      content = Text(text.trim());
    } else {
      content ??= Row(
        children: [
          CircularProgressIndicator(),
          SizedBox(
            width: 20.0,
          ),
        ],
      );
    }

    buttons ??= [
      FlatButton(
        child: Text("OK"),
        onPressed: () {
          Navigator.pop(context);
        },
      )
    ];

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          content: content,
          actions: buttons,
        );
      },
    );
  }
}
