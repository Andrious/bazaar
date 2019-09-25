import 'package:flutter/material.dart'
    show
        AlertDialog,
        Alignment,
        AnimatedBuilder,
        Animation,
        AnimationController,
        BorderRadius,
        BoxDecoration,
        BuildContext,
        Center,
        CircularProgressIndicator,
        Color,
        Colors,
        Column,
        Container,
        CurvedAnimation,
        Curves,
        EdgeInsets,
        FlatButton,
        FontWeight,
        Form,
        FormState,
        GlobalKey,
        Icon,
        IconButton,
        Icons,
        Image,
        InkWell,
        InputDecoration,
        Interval,
        LinearGradient,
        ListTile,
        ListView,
        MaterialButton,
        MaterialPageRoute,
        Matrix4,
        MediaQuery,
        Navigator,
        RoundedRectangleBorder,
        Row,
        Scaffold,
        SingleTickerProviderStateMixin,
        SizedBox,
        StatefulWidget,
        Text,
        TextEditingController,
        TextFormField,
        TextInputType,
        TextStyle,
        Transform,
        Tween,
        Visibility,
        Widget,
        showDialog;

import 'package:bazaar/src/controller.dart' as c;

import 'package:bazaar/src/view.dart'
    show Controllers, HomePage, Login, StateMVC;

import 'package:bazaar/src/login/view/loginPage.dart' show Login;

import 'package:bazaar/src/home/view/homepage.dart' show HomePage;

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends StateMVC<SignUp>
    with SingleTickerProviderStateMixin {
  _SignUpState() : super(c.SignUpPage()) {
    con = controller;
  }
  c.SignUpPage con;

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  Animation animation, delayAnimation, muchDelayedAnimation;
  AnimationController animationController;
  bool hidePass = true;
  bool isLoading = false;
  bool isLoggedIn = false;

  @override
  void initState() {
    super.initState();
    final ad = Controllers.of<c.BazaarApp>()?.ads;
    if (ad != null) {
      ad?.closeBannerAd();
    }
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
                        icon: const Icon(Icons.arrow_back),
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
                              _nameController.text = val;
                            },
                            autocorrect: true,
                          ),
                          const SizedBox(
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
                          const SizedBox(
                            height: 10.0,
                          ),

                          TextFormField(
                            controller: _passwordController,
                            obscureText: hidePass,
                            decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  icon: hidePass ? const Icon(Icons.visibility_off, color: Colors.blueGrey) : const Icon(Icons.visibility, color: Colors.blueGrey),
                                  onPressed: () {
                                    setState(() {
                                      hidePass = !hidePass;
                                    });
                                  },
                                ),
                                prefixIcon: const Icon(
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
                          const SizedBox(
                            height: 10.0,
                          ),
                          TextFormField(
                            controller: _confirmPasswordController,
                            obscureText: hidePass,
                            decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  icon: hidePass ? const Icon(Icons.visibility_off, color: Colors.blueGrey) : const Icon(Icons.visibility, color: Colors.blueGrey),
                                  onPressed: () {
                                    setState(() {
                                      hidePass = !hidePass;
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

                          const SizedBox(
                            height: 20.0,
                          ),
                          //  ================== Login Btn =======================
                          Transform(
                            transform: Matrix4.translationValues(
                                muchDelayedAnimation.value * width, 0.0, 0.0),
                            child: MaterialButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25.0),
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
                                await signUpUser(context);
                                Navigator.of(context).pop();
                              },
                              color: const Color(0xFFB33771),
                            ),
                          ),

                          const SizedBox(
                            height: 5.0,
                          ),
                          Container(
                            child: const Text("OR"),
                          ),
                          const SizedBox(
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
                                    con.msgError(context);
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
                      child: const CircularProgressIndicator(),
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
      color: const Color(0xFFB33771),
    );
  }

  Future<bool> signUpUser(BuildContext context) async {
//      formState.reset();
//      _loadingDialog();
    FormState formState = _formKey.currentState;
    bool signUp = formState.validate();
    if (signUp) {
      formState.save();
      signUp = await con.signUpUser(_nameController.text,
          _emailController.text, _passwordController.text);
      if (signUp) {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => HomePage()));
      } else {
        if (con.inError) con.msgError(context);
      }
    }
    return signUp;
  }

  _loadingDialog() => _showDialogue(
          content: Row(
        children: [const CircularProgressIndicator(), const Text("Loading!")],
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
          const CircularProgressIndicator(),
          const SizedBox(
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
