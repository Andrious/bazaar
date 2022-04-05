import 'package:bazaar/src/controller.dart' show LoginPage;

import 'package:bazaar/src/view.dart' show HomePage, SignUp, StateMVC;

import 'package:flutter/material.dart'
    show
        AlertDialog,
        Alignment,
        AlwaysStoppedAnimation,
        AnimatedBuilder,
        Animation,
        AnimationController,
        AutovalidateMode,
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
        Key,
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
        TextButton,
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

//import 'package:flutter/services.dart' show TextInputType;

///
class Login extends StatefulWidget {
  ///
  const Login({Key? key}) : super(key: key);
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends StateMVC<Login> with SingleTickerProviderStateMixin {
  _LoginState() : super(LoginPage()) {
    con = controller as LoginPage;
    isLoggedin = con.loggedIn;
  }
  late LoginPage con;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _resetKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  late Animation animation, delayAnimation, muchDelayedAnimation;
  late AnimationController animationController;

  bool loading = false;
  bool hidePass = true;
  bool isLoggedin = false;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );
    animation = Tween(begin: -1.0, end: 0).animate(
      CurvedAnimation(curve: Curves.fastOutSlowIn, parent: animationController),
    );
    delayAnimation = Tween(begin: -1.0, end: 0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.5, 1, curve: Curves.fastOutSlowIn),
      ),
    );
    muchDelayedAnimation = Tween(begin: -1.0, end: 0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.7, 1, curve: Curves.fastOutSlowIn),
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
    if (isLoggedin) {
      return const HomePage();
    }
    final width = MediaQuery.of(context).size.width;
    animationController.forward();
    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget? child) {
        return Scaffold(
          body: Container(
            decoration: const BoxDecoration(
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
            padding: const EdgeInsets.all(15),
            child: Center(
              child: ListView(
                children: <Widget>[
                  const SizedBox(
                    height: 20,
                  ),
                  Transform(
                    transform: Matrix4.translationValues(
                        animation.value * width, 0, 0),
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                      alignment: Alignment.center,
                      child: const Text(
                        'e-Bazaar',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Transform(
                    transform: Matrix4.translationValues(
                        animation.value * width, 0, 0),
                    child: const Text(
                      'Welcome Back. I am Very Much Excited About Your Next Shopping',
                      style: TextStyle(),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Transform(
                        transform: Matrix4.translationValues(
                            animation.value * width, 0, 0),
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                          child: Text(
                            'Login',
                            style: _loginRegStyles(),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          // Navigator.of(context).push(MaterialPageRoute<void>(
                          //     builder: (context) => const SignUp()));
                        },
                        child: Transform(
                          transform: Matrix4.translationValues(
                              animation.value * width, 0, 0),
                          child: Container(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
                            alignment: Alignment.center,
                            child: Text(
                              'Register',
                              style: _loginRegStyles(),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Transform(
                    transform: Matrix4.translationValues(
                        delayAnimation.value * width, 0, 0),
                    child: Form(
                      key: _formKey,
                      autovalidateMode: AutovalidateMode.always,
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.alternate_email,
                                    color: Colors.blueGrey),
                                hintText: 'Email',
                                labelStyle: TextStyle(
                                    // color: Colors.white,
                                    ),
                                labelText: 'Email'),
                            // validator: (val) {
                            //   if (val.isEmpty) {
                            //     return "Please Provide Email";
                            //   }
                            //   return null;
                            // },
                            onSaved: (val) {
                              _emailController.text = val!;
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: _passwordController,
                            // obscureText:hidepass we toggle when user clicks the icon
                            obscureText: hidePass,
                            decoration: InputDecoration(
                                prefixIcon: const Icon(
                                  Icons.lock,
                                  color: Colors.blueGrey,
                                ),
                                suffixIcon: IconButton(
                                  icon: hidePass
                                      ? const Icon(Icons.visibility_off,
                                          color: Colors.blueGrey)
                                      : const Icon(Icons.visibility,
                                          color: Colors.blueGrey),
                                  onPressed: () {
                                    setState(() {
                                      hidePass = !hidePass;
                                    });
                                  },
                                ),
                                hintText: 'Password',
                                labelText: 'Password'),
                            validator: (val) {
                              if (val!.isNotEmpty && val.length < 6) {
                                return 'Password must contain at least 6 characters';
                                // } else if (val.isEmpty) {
                                //   return "Password field can't be empty";
                              }
                              return null;
                            },
                            onSaved: (val) {
                              _passwordController.text = val!;
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          //  ================== Login Btn =======================
                          Transform(
                            transform: Matrix4.translationValues(
                                muchDelayedAnimation.value * width, 0, 0),
                            child: MaterialButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25)),
                              minWidth: MediaQuery.of(context).size.width,
                              onPressed: () async {
                                await signIn();
                              },
                              color: const Color(0xFFB33771),
                              child: ListTile(
                                title: Center(
                                  child: Text(
                                    'Login',
                                    style: _btnStyle(),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Transform(
                            transform: Matrix4.translationValues(
                                muchDelayedAnimation.value * width, 0, 0),
                            child: InkWell(
                              onTap: () async {
                                _showFormDialog();
                              },
                              child: const Text(
                                'Forgot Password',
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: Color(0xFFB33771),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Visibility(
                    visible: loading, // ?? true,
                    child: const Center(
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
    return const TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
    );
  }

  TextStyle _loginRegStyles() {
    return const TextStyle(
      fontWeight: FontWeight.w800,
      fontSize: 18,
      letterSpacing: 0.8,
      color: Color(0xFFB33771),
    );
  }

  Future<void> signIn() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
//      _showLoadingIndicator();
      bool signIn;
      if (_emailController.text.isEmpty && _passwordController.text.isEmpty) {
        signIn = true;
      } else {
        signIn =
            await con.signIn(_emailController.text, _passwordController.text);
      }
      Navigator.of(context).pop();

      if (signIn) {
        if (Navigator.canPop(context)) {
          await Navigator.pushReplacement(context,
              MaterialPageRoute<void>(builder: (context) => const HomePage()));
        } else {
          await Navigator.of(context).push(
              MaterialPageRoute<void>(builder: (context) => const HomePage()));
        }
      } else {
        // if (con.inError) {
        //   await con.msgError(con.getError()!).then((_) {
        //     Navigator.of(context).push(
        //         MaterialPageRoute<void>(builder: (context) => const SignUp()));
        //   });
        // }
      }
    }
  }

  void _showFormDialog() {
    final alert = AlertDialog(
      content: ListTile(
        title: Text(
            'Password Reset Link Will Be Sent To Your EmailID: ${_emailController.text}'),
        subtitle: Form(
          child: TextFormField(
            key: _resetKey,
            autovalidateMode: AutovalidateMode.always,
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.alternate_email, color: Colors.blueGrey),
              hintText: 'Enter Your Email',
              labelText: 'Email',
            ),
            validator: (val) {
              if (val!.isEmpty) {
                return 'Please Provide Email';
              }
              return null;
            },
            onSaved: (val) {
              _emailController.text = val!;
            },
          ),
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancel'),
        ),
        TextButton(
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
          child: const Text('Send'),
        ),
      ],
    );
    showDialog<void>(context: context, builder: (_) => alert);
  }

  void _showLoadingIndicator() {
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          content: Row(
            children: const <Widget>[
              CircularProgressIndicator(),
              SizedBox(
                width: 20,
              ),
              Text('Loading!')
            ],
          ),
        );
      },
    );
  }
}
