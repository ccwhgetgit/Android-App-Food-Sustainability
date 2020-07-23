import 'package:Cycled_iOS/tabs/storePage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:Cycled_iOS/mainInterface.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:Cycled_iOS/database/DatabaseService.dart';
import 'dart:async';
import 'package:Cycled_iOS/onboarding/slide_dots.dart';
import 'package:Cycled_iOS/onboarding/slide_item.dart';

import 'authentication/login.dart';
import 'authentication/signup.dart';
import 'onboarding/slide_dots.dart';
import 'onboarding/slide_item.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);
  static FirebaseUser user;
  static String userName = "";

  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
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

  TextEditingController loginEmailController = new TextEditingController();
  TextEditingController loginPasswordController = new TextEditingController();

  TextEditingController signupEmailController = new TextEditingController();
  TextEditingController signupNameController = new TextEditingController();
  TextEditingController signupPasswordController = new TextEditingController();
  TextEditingController signupConfirmPasswordController =
      new TextEditingController();

  Color left = Colors.black;
  Color right = Colors.white;

  int _currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 5), (Timer timer) {
      if (_currentPage < 4) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    });
  }

  _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              Expanded(
                child: Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: <Widget>[
                    NotificationListener<OverscrollIndicatorNotification>(
                      onNotification:
                          (OverscrollIndicatorNotification overscroll) {
                        overscroll.disallowGlow();
                        return;
                      },
                      child: PageView.builder(
                        scrollDirection: Axis.horizontal,
                        controller: _pageController,
                        onPageChanged: _onPageChanged,
                        itemCount: 5,
                        itemBuilder: (ctx, i) => SlideItem(i),
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        for (int i = 0; i < 5; i++)
                          if (i == _currentPage)
                            SlideDots(true)
                          else
                            SlideDots(false)
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Column(mainAxisAlignment: MainAxisAlignment.center, children: <
                  Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 0.0),
                  child: GestureDetector(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .22,
                        ),
                        ButtonTheme(
                          minWidth: MediaQuery.of(context).size.width * .1,
                          height: MediaQuery.of(context).size.height * .06,
                          child: RaisedButton(
                            elevation: 0.0,
                            splashColor: Colors.transparent,
                            shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(8.0)),
                            padding:
                                EdgeInsets.only(top: 7.0, bottom: 7.0, left: 0),
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) => Login1Page(),
                                ),
                              );
                            },
                            child: new Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Padding(
                                    padding: EdgeInsets.only(
                                        left:
                                            MediaQuery.of(context).size.width *
                                                .02,
                                        right:
                                            MediaQuery.of(context).size.width *
                                                .02),
                                    child: new Text("Sign Up",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        )))
                              ],
                            ),
                            textColor: Colors.black,
                            color: Colors.transparent,
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .07,
                        ),
                        ButtonTheme(
                          minWidth: MediaQuery.of(context).size.width * .1,
                          height: MediaQuery.of(context).size.height * .06,
                          child: RaisedButton(
                            elevation: 0.0,
                            splashColor: Colors.transparent,
                            shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(8.0)),
                            padding:
                                EdgeInsets.only(top: 7.0, bottom: 7.0, left: 0),
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) => Login2Page(),
                                ),
                              );
                            },
                            child: new Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Padding(
                                    padding:
                                        EdgeInsets.only(left: 20.0, right: 20),
                                    child: new Text("Log In",
                                        style: TextStyle(
                                          color: Colors.blue[900],
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        )))
                              ],
                            ),
                            textColor: Colors.black,
                            color: Colors.transparent,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 0.0),
                  child: GestureDetector(
                    onTap: () => _signInWithGoogle()
                        .then((FirebaseUser user) => print(user))
                        .catchError((e) => print(e)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(height: 0),
                        GestureDetector(
                          onTap: () => _signInWithFB()
                              .then((FirebaseUser user) => print(user))
                              .catchError((e) => print(e)),
                          child: ButtonTheme(
                            minWidth: MediaQuery.of(context).size.width * .85,
                            height: MediaQuery.of(context).size.height * .06,
                            child: RaisedButton(
                                elevation: 0.0,
                                shape: new RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(8.0)),
                                padding: EdgeInsets.only(
                                    top: 7.0,
                                    bottom: 7.0,
                                    right: 40.0,
                                    left: 0),
                                onPressed: () => _signInWithFB()
                                    .then((FirebaseUser user) => print(user))
                                    .catchError((e) => print(e)),
                                child: new Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    new Icon(
                                      FontAwesomeIcons.facebookF,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                .05),
                                    Padding(
                                        padding: EdgeInsets.only(left: 10.0),
                                        child:
                                            new Text("Continue with Facebook",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16,
                                                )))
                                  ],
                                ),
                                textColor: Color(0xFF292929),
                                color: Colors.blue[900]),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 0.0),
                  child: GestureDetector(
                    onTap: () => _signInWithGoogle()
                        .then((FirebaseUser user) => print(user))
                        .catchError((e) => print(e)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(height: 15),
                        GestureDetector(
                          onTap: () => _signInWithGoogle()
                              .then((FirebaseUser user) => print(user))
                              .catchError((e) => print(e)),
                          child: ButtonTheme(
                            minWidth: MediaQuery.of(context).size.width * .85,
                            height: MediaQuery.of(context).size.height * .06,
                            child: RaisedButton(
                                elevation: 0.0,
                                shape: new RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(8.0)),
                                padding: EdgeInsets.only(
                                    top: 7.0,
                                    bottom: 7.0,
                                    right: 40.0,
                                    left: 0),
                                onPressed: () => _signInWithGoogle()
                                    .then((FirebaseUser user) => print(user))
                                    .catchError((e) => print(e)),
                                child: new Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    new Image.asset(
                                      "assets/images/google.png",
                                      height: 27,
                                      width: 27,
                                    ),
                                    SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                .09),
                                    Padding(
                                        padding: EdgeInsets.only(left: 10.0),
                                        child: new Text("Continue with Google",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                            )))
                                  ],
                                ),
                                textColor: Color(0xFF292929),
                                color: Colors.grey[800]),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ])
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

  Future<FirebaseUser> _signInWithGoogle() async {
    GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();

    GoogleSignInAuthentication gSA = await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
        idToken: gSA.idToken, accessToken: gSA.accessToken);

    LoginPage.user = (await _auth.signInWithCredential(credential)).user;

    DatabaseService(uid: LoginPage.user.uid).updateUserInfo(
        LoginPage.user.email, LoginPage.user.displayName, false);
    DatabaseService(uid: LoginPage.user.uid).firstUserPollAttempt(false, 0);
    DatabaseService(uid: LoginPage.user.uid).firstUserDisposeAttempt(false, 0);

    DatabaseService(uid: LoginPage.user.uid).updateUserTokens(0);
    DatabaseService(uid: LoginPage.user.uid).firstUserStatus(false);
    DatabaseService(uid: LoginPage.user.uid).updateUserPoints(0);
    DatabaseService(uid: LoginPage.user.uid).updateUserTier('Bronze');

    DatabaseService(uid: LoginPage.user.uid).updateStats();

    for (String store in StorePage.stores) {
      DatabaseService(uid: LoginPage.user.uid).resetRewards(store, 0);
    }

    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (BuildContext context) => MainInterface()));

    print("Signed in as ${LoginPage.user.displayName}");
    return LoginPage.user;
  }

  Future<FirebaseUser> _signInWithFB() async {
    final result = await fbLogin.logIn(['email', 'public_profile']);
    FacebookAccessToken myToken = result.accessToken;
    final AuthCredential credential =
        FacebookAuthProvider.getCredential(accessToken: myToken.token);
    final FirebaseUser user =
        (await _auth.signInWithCredential(credential)).user;

    switch (result.status) {
      case FacebookLoginStatus.error:
        print("Error");
        break;

      case FacebookLoginStatus.cancelledByUser:
        print("CancelledByUser");
        break;

      case FacebookLoginStatus.loggedIn:
        FirebaseAuth.instance.signInWithCredential(credential);
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => MainInterface()));
        break;
    }

    print("Username: ${user.displayName}");
    return user;
  }
}
