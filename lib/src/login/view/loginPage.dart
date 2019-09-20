import 'package:flutter/material.dart'
    show
        AlertDialog,
        Alignment,
        AlwaysStoppedAnimation,
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
        InkWell,
        InputDecoration,
        Interval,
        LinearGradient,
        ListTile,
        ListView,
        MainAxisAlignment,
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
        TextDecoration,
        TextEditingController,
        TextFormField,
        TextInputType,
        TextStyle,
        Transform,
        Tween,
        Visibility,
        Widget,
        showDialog;

import 'package:flutter/services.dart' show TextInputType;

import 'package:bazaar/src/view.dart' show HomePage, SignUp, StateMVC;

import 'package:bazaar/src/controller.dart' show LoginPage;

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends StateMVC<Login> with SingleTickerProviderStateMixin {
  _LoginState() : super(LoginPage()) {
    con = controller;
    isLoggedin = con.loggedIn;
  }
  LoginPage con;

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  GlobalKey<FormState> _resetKey = GlobalKey<FormState>();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  Animation animation, delayAnimation, muchDelayedAnimation;
  AnimationController animationController;

  bool loading = false;
  bool hidePass = true;
  bool isLoggedin = false;

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
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if(isLoggedin) return HomePage();
    final width = MediaQuery.of(context).size.width;
    animationController.forward();
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
                  SizedBox(
                    height: 20.0,
                  ),
                  Transform(
                    transform: Matrix4.translationValues(
                        animation.value * width, 0.0, 0.0),
                    child: Container(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                      alignment: Alignment.center,
                      child: Text(
                        "e-Bazaar",
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Transform(
                    transform: Matrix4.translationValues(
                        animation.value * width, 0.0, 0.0),
                    child: Container(
                      // alignment: Alignment.center,
                      child: Text(
                        "Welcome Back. I am Very Much Excited About Your Next Shopping",
                        style: TextStyle(),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Transform(
                        transform: Matrix4.translationValues(
                            animation.value * width, 0.0, 0.0),
                        child: Container(
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                          child: Text(
                            "Login",
                            style: _loginRegStyles(),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => SignUp()));
                        },
                        child: Transform(
                          transform: Matrix4.translationValues(
                              animation.value * width, 0.0, 0.0),
                          child: Container(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 30),
                            alignment: Alignment.center,
                            child: Text(
                              "Register",
                              style: _loginRegStyles(),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Transform(
                    transform: Matrix4.translationValues(
                        delayAnimation.value * width, 0.0, 0.0),
                    child: Form(
                      key: _formKey,
                      autovalidate: true,
                      child: Column(
                        children: <Widget>[
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
                            // obscureText:hidepass we toggle when user clicks the icon
                            obscureText: hidePass,
                            decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.lock,
                                  color: Colors.blueGrey,
                                ),
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
                                hintText: "Password",
                                labelText: "Password"),
                            validator: (val) {
                              if (val.length < 6) {
                                return "Passsword must contain atleast 6 characters";
                              } else if (val.isEmpty) {
                                return "Password field can't be empty";
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
                                  borderRadius:
                                      new BorderRadius.circular(25.0)),
                              minWidth: MediaQuery.of(context).size.width,
                              child: ListTile(
                                title: Center(
                                  child: Text(
                                    "Login",
                                    style: _btnStyle(),
                                  ),
                                ),
                              ),
                              onPressed: () async {
                                signIn();
                              },
                              color: Color(0xFFB33771),
                            ),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Transform(
                            transform: Matrix4.translationValues(
                                muchDelayedAnimation.value * width, 0.0, 0.0),
                            child: Container(
                              child: InkWell(
                                onTap: () async {
                                  _showFormDialog();
                                },
                                child: Text(
                                  "Forgot Password",
                                  style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: Color(0xFFB33771),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),

                          SizedBox(
                            height: 15.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Visibility(
                    visible: loading ?? true,
                    child: Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                      ),
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

  Future signIn() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      _showLoadingIndicator();

      bool signIn =
          await con.signIn(_emailController.text, _passwordController.text);
      Navigator.of(context).pop();

      if (signIn) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      } else {
        if (con.inError) {
          con.msgError(con.getError()).then((_) {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => SignUp()));
          });
        }
      }
    }
  }

  void _showFormDialog() {
    var alert = AlertDialog(
      content: ListTile(
        title: Text(
            "Password Reset Link Will Be Sent To Your EmailID: ${_emailController.text}"),
        subtitle: Form(
          child: TextFormField(
            key: _resetKey,
            autovalidate: true,
            controller: _emailController,
            autocorrect: true,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.alternate_email, color: Colors.blueGrey),
              hintText: "Enter Your Email",
              labelText: "Email",
            ),
            validator: (val) {
              if (val.isEmpty) {
                return "Please Provide Email";
              }
              return null;
            },
            onSaved: (val) {
              _emailController.text = val;
            },
          ),
        ),
      ),
      actions: <Widget>[
        FlatButton(
          child: Text("Cancel"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        FlatButton(
          child: Text("Send"),
          onPressed: () async {
            // if (_resetKey.currentState.validate()) {
            //   _resetKey.currentState.save();
            //   _resetKey.currentState.reset();
            //   await firebaseAuth.sendPasswordResetEmail(
            //       email: _emailController.text);
            //   Navigator.of(context).pop();
            // }
            Navigator.of(context).pop();
          },
        ),
      ],
    );
    showDialog(context: context, builder: (_) => alert);
  }

  _showLoadingIndicator() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          content: Row(
            children: <Widget>[
              CircularProgressIndicator(),
              SizedBox(
                width: 20.0,
              ),
              Text("Loading!")
            ],
          ),
        );
      },
    );
  }
}
