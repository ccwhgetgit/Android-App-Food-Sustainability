import 'package:Cycled_iOS/tabs/storePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:Cycled_iOS/design/theme.dart' as Theme;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:Cycled_iOS/mainInterface.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:Cycled_iOS/database/DatabaseService.dart';
import 'dart:async';

import 'package:intl/intl.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../authentication.dart';

class Login2Page extends StatefulWidget {
  Login2Page({Key key}) : super(key: key);
  static FirebaseUser user;

  @override
  _Login2PageState createState() => new _Login2PageState();
}

class _Login2PageState extends State<Login2Page>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  final FocusNode myFocusNodeEmailLogin = FocusNode();
  final FocusNode myFocusNodePasswordLogin = FocusNode();

  final FocusNode myFocusNodePassword = FocusNode();
  final FocusNode myFocusNodeEmail = FocusNode();
  final FocusNode myFocusNodeName = FocusNode();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = new GoogleSignIn();
  final FacebookLogin fbLogin = new FacebookLogin();

  final _loginFormKey = GlobalKey<FormState>();

  TextEditingController loginEmailController = new TextEditingController();
  TextEditingController loginPasswordController = new TextEditingController();

  bool _obscureTextLogin = true;

  TextEditingController signupEmailController = new TextEditingController();
  TextEditingController signupNameController = new TextEditingController();
  TextEditingController signupPasswordController = new TextEditingController();
  TextEditingController signupConfirmPasswordController =
      new TextEditingController();

  PageController _pageController;

  Color left = Colors.black;
  Color right = Colors.white;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(
              LineAwesomeIcons.arrow_left,
              color: Colors.black,
            ),
            onPressed: () => {Navigator.pop(context, false)}),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      key: _scaffoldKey,
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            color: Colors.grey[100],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 50.0),
              ),
              Text("Log in",
                  style: TextStyle(
                    fontSize: 25,
                    letterSpacing: .6,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  )),
              _buildSignIn(context),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    myFocusNodePassword.dispose();
    myFocusNodeEmail.dispose();
    myFocusNodeName.dispose();
    _pageController?.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    _pageController = PageController();
  }

  void showInSnackBar(String value) {
    FocusScope.of(context).requestFocus(new FocusNode());
    _scaffoldKey.currentState?.removeCurrentSnackBar();
    _scaffoldKey.currentState.showSnackBar(new SnackBar(
      content: new Text(
        value,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16.0,
        ),
      ),
      backgroundColor: Colors.blue,
      duration: Duration(seconds: 3),
    ));
  }

  Widget _buildSignIn(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 23.0),
      child: Column(children: <Widget>[
        Stack(
          alignment: Alignment.topCenter,
          overflow: Overflow.visible,
          children: <Widget>[
            Card(
              elevation: 2.0,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                width: MediaQuery.of(context).size.width * .9,
                height: MediaQuery.of(context).size.width * .6,
                child: Column(
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.only(
                            top: 20.0, bottom: 20.0, left: 25.0, right: 25.0),
                        child: Form(
                            key: _loginFormKey,
                            child: Column(
                              children: <Widget>[
                                Text("", style: TextStyle(fontSize: 18)),
                                SizedBox(height: 0),
                                TextFormField(
                                  focusNode: myFocusNodeEmailLogin,
                                  controller: loginEmailController,
                                  keyboardType: TextInputType.emailAddress,
                                  style: TextStyle(
                                      fontSize: 16.0, color: Colors.black),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    icon: Icon(
                                      FontAwesomeIcons.envelope,
                                      color: Colors.black,
                                      size: 22.0,
                                    ),
                                    hintText: "Email Address",
                                    hintStyle: TextStyle(fontSize: 15.0),
                                  ),
                                ),
                                Container(
                                  width: 250.0,
                                  height: 1.0,
                                  color: Colors.grey[400],
                                ),
                                SizedBox(height: 30),
                                TextFormField(
                                  focusNode: myFocusNodePasswordLogin,
                                  controller: loginPasswordController,
                                  obscureText: _obscureTextLogin,
                                  style: TextStyle(
                                      fontSize: 16.0, color: Colors.black),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    icon: Icon(
                                      FontAwesomeIcons.key,
                                      size: 22.0,
                                      color: Colors.black,
                                    ),
                                    hintText: "Password",
                                    hintStyle: TextStyle(fontSize: 15.0),
                                    suffixIcon: GestureDetector(
                                      onTap: _toggleLogin,
                                      child: Icon(
                                        _obscureTextLogin
                                            ? FontAwesomeIcons.eye
                                            : FontAwesomeIcons.eyeSlash,
                                        size: 15.0,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.0000001,
                                ),
                                Container(
                                  width: 250.0,
                                  height: 1.0,
                                  color: Colors.grey[400],
                                ),
                              ],
                            ))),
                    Text("Forgot Password?"),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 260.0),
              decoration: new BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Theme.Colors.loginGradientStart,
                      offset: Offset(1.0, 6.0),
                      blurRadius: 5.0,
                    ),
                  ],
                  color: Colors.green[900]),
              child: MaterialButton(
                  highlightColor: Colors.transparent,
                  splashColor: Theme.Colors.loginGradientEnd,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 70.0),
                    child: Text(
                      "Continue",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.0,
                      ),
                    ),
                  ),
                  onPressed: () async {
                    _loginFormKey.currentState.validate();
                    _signInWithEmailPassword();
                  }),
            ),
          ],
        ),
        SizedBox(height: MediaQuery.of(context).size.height * .06),
      ]),
    );
  }

  Future<FirebaseUser> _signInWithEmailPassword() async {
    LoginPage.user = (await _auth.signInWithEmailAndPassword(
            email: loginEmailController.text,
            password: loginPasswordController.text))
        .user;
    if (LoginPage.user.isEmailVerified) {
      try {
        DatabaseService(uid: LoginPage.user.uid)
            .updateUserInfo(LoginPage.user.email, LoginPage.userName, false);
        DatabaseService(uid: LoginPage.user.uid)
            .updateUserPollAttempt(false, null);
        DatabaseService(uid: LoginPage.user.uid)
            .updateUserDisposeAttempt(false, null);

        DatabaseService(uid: LoginPage.user.uid).updateUserTokens(0);
        DatabaseService(uid: LoginPage.user.uid).updateUserStatus(false);
        DatabaseService(uid: LoginPage.user.uid).updateUserPoints(0);
        DatabaseService(uid: LoginPage.user.uid).updateUserTier('Bronze');

        DatabaseService(uid: LoginPage.user.uid)
            .updateFoodie(DateFormat('dd MMMM yyyy').format(DateTime.now()));

        DatabaseService(uid: LoginPage.user.uid).updateStats();

        for (String store in StorePage.stores) {
          DatabaseService(uid: LoginPage.user.uid).resetRewards(store, 0);
        }

        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => MainInterface()));

        return LoginPage.user;
      } catch (e) {
        print(e.toString());
        showDialog(
            context: context,
            builder: (_) => AlertDialog(
                  title: Text(
                      "Sorry, we couldn't find an account with that email address or password."),
                  content: Text(
                      "Can we help you recover your account? Click on 'Forgot Password' to reset your password"),
                ));
        return null;
      }
    } else {
      showDialog(
          context: context,
          builder: (_) => AlertDialog(
                title: Text("OOPS!"),
                content: Text(
                    "A verification link has been sent to your registered email. Please verify your account first."),
              ));
      return null;
    }
  }

  void _toggleLogin() {
    setState(() {
      _obscureTextLogin = !_obscureTextLogin;
    });
  }
}
