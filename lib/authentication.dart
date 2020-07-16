import 'package:Cycled_iOS/tabs/storePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:Cycled_iOS/design/theme.dart' as Theme;
import 'package:Cycled_iOS/design/bubble_indicator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:Cycled_iOS/mainInterface.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:Cycled_iOS/database/DatabaseService.dart';
import 'dart:async';

import 'package:intl/intl.dart';

import 'authentication/signup.dart';
import 'dailyPoll.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);
  static FirebaseUser user;

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

  final _signupFormKey = GlobalKey<FormState>();
  final _loginFormKey = GlobalKey<FormState>();

  String userName = "";

  TextEditingController loginEmailController = new TextEditingController();
  TextEditingController loginPasswordController = new TextEditingController();

  bool _obscureTextLogin = true;
  bool _obscureTextSignup = true;
  bool _obscureTextSignupConfirm = true;

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
      key: _scaffoldKey,

      

      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (overscroll) {
          overscroll.disallowGlow();
          return;
        },
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
   
            
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                SizedBox(height:60),

                Row(
                    children: <Widget>[

                      SizedBox(width:MediaQuery.of(context).size.width * .73),
            RaisedButton(
                shape: RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(10.0),
  side: BorderSide(color: Colors.brown[100])
),
  color: Colors.white,
                  /* child: new Icon(
                      FontAwesomeIcons.facebookF,
                      color: Color(0xFF0084ff),
                      */
                child: Center(
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                      color: Colors.black,
                
                      fontSize: 16,
                    ),
                  ),
                ),
               onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => Login1Page(),
                  ),
                );
              }
              ),
                        
                    ],
                ),      
              
               
Container(
     
      alignment: Alignment.bottomLeft,
      padding: new EdgeInsets.only(left: 16.0, bottom: 0),
 
      child:  Row(
        children: <Widget>[
          SizedBox(width: MediaQuery.of(context).size.width/4),
          Text("Cycled".toUpperCase(),
                 style: TextStyle(
                             
                              fontSize: 40,
                              letterSpacing: .6,
                              color: Colors.black,
                              )),
        ],
      ),
    ),
               
             
             
                SizedBox(height: MediaQuery.of(context).size.height * .04),
                Expanded(
                 
                  child: PageView(
                   
                    children: <Widget>[
                      new ConstrainedBox(
                        constraints: const BoxConstraints.expand(),


                        child: _buildSignIn(context),


                      ),
                     
                     
             
                    ],
                  ),
                ),
                
                

          //socil buttons to sign in 
          
        ],
               
              
            ),
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
      child: Column(
        children: <Widget>[
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
                  width:   MediaQuery.of(context).size.width * .9,
                  height:  MediaQuery.of(context).size.width * .7,
                  child: Column(
                    children: <Widget>[
                      Padding(
                          padding: EdgeInsets.only(
                              top: 20.0, bottom: 20.0, left: 25.0, right: 25.0),
                          child: Form(
                              key: _loginFormKey,
                              child: Column(
                                children: <Widget>[
                                  Text("Log In To Cycled", 
                                  style: TextStyle(fontSize: 18)),
                                  SizedBox(height: 30),
                                  TextFormField(
                                    focusNode: myFocusNodeEmailLogin,
                                    controller: loginEmailController,
                                    keyboardType: TextInputType.emailAddress,
                                    style: TextStyle(
                                       
                                        fontSize: 16.0,
                                        color: Colors.black),
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      icon: Icon(
                                        FontAwesomeIcons.envelope,
                                        color: Colors.black,
                                        size: 22.0,
                                      ),
                                      hintText: "Email Address",
                                      hintStyle: TextStyle(
                                       
                                          fontSize: 15.0),
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
                                     
                                        fontSize: 16.0,
                                        color: Colors.black),
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      icon: Icon(
                                        FontAwesomeIcons.key,
                                        size: 22.0,
                                        color: Colors.black,
                                      ),
                                      hintText: "Password",
                                      hintStyle: TextStyle(
                                        
                                          fontSize: 15.0),
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
                                  SizedBox(height: 10),
                                  Container(
                                    width: 250.0,
                                    height: 1.0,
                                    color: Colors.grey[400],
                                  ),
                                ],
                              ))),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 250.0),
                decoration: new BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Theme.Colors.loginGradientStart,
                      offset: Offset(1.0, 6.0),
                      blurRadius: 20.0,
                    ),
                  
                  ],
                  color: Colors. white
                ),
                child: MaterialButton(
                    highlightColor: Colors.transparent,
                    splashColor: Theme.Colors.loginGradientEnd,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 70.0),
                      child: Text(
                        "LOGIN",
                        style: TextStyle(
                            color: Colors.blue[600],
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
        Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
           
              Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    gradient: new LinearGradient(
                        colors: [
                          Colors.black12,
                          Colors.black,
                        ],
                        begin: const FractionalOffset(0.0, 0.0),
                        end: const FractionalOffset(1.0, 1.0),
                        stops: [0.0, 1.0],
                        tileMode: TileMode.clamp),
                  ),
                  width: 100.0,
                  height: 1.0,
                ),
              Padding(
                  padding: EdgeInsets.only(left: 15.0, right: 15.0),
                  child: Text(
                    "or",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold, 
                        fontSize: 16.0,
                        ),
                  ),
                ),
                    Container(
                  decoration: BoxDecoration(
                    gradient: new LinearGradient(
                        colors: [
                          Colors.black12,
                          Colors.black,
                        ],
                        begin: const FractionalOffset(0.0, 0.0),
                        end: const FractionalOffset(1.0, 1.0),
                        stops: [0.0, 1.0],
                        tileMode: TileMode.clamp),
                  ),
                  width: 100.0,
                  height: 1.0,
                ),
              ],
              ), 

              Padding(
                padding: EdgeInsets.only(top: 0.0),
                child: GestureDetector(
                  onTap: () => _signInWithGoogle()
                      .then((FirebaseUser user) => print(user))
                      .catchError((e) => print(e)),
                  child:  Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            
            SizedBox(height: 25),
            GestureDetector(
              onTap: () => _signInWithFB()
                      .then((FirebaseUser user) => print(user))
                      .catchError((e) => print(e)),


              child: Container(
              decoration: BoxDecoration(
    border: Border.all(
      color: Colors.blue[900],
    ),
    color: Colors.blue[900],
    borderRadius: BorderRadius.circular(8.0),
  ),
               width: MediaQuery.of(context).size.width * .85,
                height:MediaQuery.of(context).size.height * .06,
                  /* child: new Icon(
                      FontAwesomeIcons.facebookF,
                      color: Color(0xFF0084ff),
                      */
                
                child: Center(
                  child: Text(
                    "Continue with Facebook",
                    style: TextStyle(
                      color: Colors.white,
                fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            )

            
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
                  child:  Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            
            SizedBox(height: 15),
            GestureDetector(
              onTap: () => _signInWithGoogle()
                      .then((FirebaseUser user) => print(user))
                      .catchError((e) => print(e)),
              child: Container(
                decoration: BoxDecoration(
    border: Border.all(
      color: Colors.red[800],
    ),
    color: Colors.red[800],
    borderRadius: BorderRadius.circular(8.0),
  ),
                width: MediaQuery.of(context).size.width * .85,
                height:MediaQuery.of(context).size.height * .06,
                
                child: Center(
                  child: Text(
                    "Continue with Google",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            )

            
          ],
        ),
              ),
              )
             ] )
           
             ] ),
        
      
    );
  }

  Widget _buildSignUp(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 23.0),
      child: Column(
        children: <Widget>[
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
                  width: 300.0,
                  height: 360.0,
                  child: Column(
                    children: <Widget>[
                      Padding(
                          padding: EdgeInsets.only(
                              top: 20.0, bottom: 20.0, left: 25.0, right: 25.0),
                          child: Form(
                              key: _signupFormKey,
                              child: Column(
                                children: <Widget>[
                                  TextFormField(
                                    focusNode: myFocusNodeName,
                                    controller: signupNameController,
                                    keyboardType: TextInputType.text,
                                    textCapitalization:
                                        TextCapitalization.words,
                                    style: TextStyle(
                                       
                                        fontSize: 16.0,
                                        color: Colors.black),
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      icon: Icon(
                                        FontAwesomeIcons.user,
                                        color: Colors.black,
                                      ),
                                      hintText: "Name",
                                      hintStyle: TextStyle(
                                      
                                          fontSize: 16.0),
                                    ),
                                  ),
                                  Container(
                                    width: 250.0,
                                    height: 1.0,
                                    color: Colors.grey[400],
                                  ),
                                  SizedBox(height: 20),
                                  TextFormField(
                                    focusNode: myFocusNodeEmail,
                                    controller: signupEmailController,
                                    keyboardType: TextInputType.emailAddress,
                                    style: TextStyle(
                                       
                                        fontSize: 16.0,
                                        color: Colors.black),
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      icon: Icon(
                                        FontAwesomeIcons.envelope,
                                        color: Colors.black,
                                      ),
                                      hintText: "Email Address",
                                      hintStyle: TextStyle(
                                       
                                          fontSize: 16.0),
                                    ),
                                  ),
                                  Container(
                                    width: 250.0,
                                    height: 1.0,
                                    color: Colors.grey[400],
                                  ),
                                  SizedBox(height: 20),
                                  TextFormField(
                                    focusNode: myFocusNodePassword,
                                    controller: signupPasswordController,
                                    obscureText: _obscureTextSignup,
                                    style: TextStyle(
                                       
                                        fontSize: 16.0,
                                        color: Colors.black),
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      icon: Icon(
                                        FontAwesomeIcons.key,
                                      
                                      ),
                                      hintText: "Password",
                                      hintStyle: TextStyle(
                                       
                                          fontSize: 16.0),
                                      suffixIcon: GestureDetector(
                                        onTap: _toggleSignup,
                                        child: Icon(
                                          _obscureTextSignup
                                              ? FontAwesomeIcons.eye
                                              : FontAwesomeIcons.eyeSlash,
                                          size: 15.0,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 250.0,
                                    height: 1.0,
                                    color: Colors.grey[400],
                                  ),
                                  SizedBox(height: 20),
                                  TextFormField(
                                    controller: signupConfirmPasswordController,
                                    obscureText: _obscureTextSignupConfirm,
                                    style: TextStyle(
                                       
                                        fontSize: 16.0,
                                        color: Colors.black),
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      icon: Icon(
                                        FontAwesomeIcons.key,
                                     
                                      ),
                                      hintText: "Confirm Password",
                                      hintStyle: TextStyle(
                                        
                                          fontSize: 16.0),
                                      suffixIcon: GestureDetector(
                                        onTap: _toggleSignupConfirm,
                                        child: Icon(
                                          _obscureTextSignupConfirm
                                              ? FontAwesomeIcons.eye
                                              : FontAwesomeIcons.eyeSlash,
                                          size: 15.0,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 250.0,
                                    height: 1.0,
                                    color: Colors.grey[400],
                                  ),
                                ],
                              ))),
                    ],
                  ),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 340.0),
                  decoration: new BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Theme.Colors.loginGradientStart,
                        offset: Offset(1.0, 6.0),
                        blurRadius: 20.0,
                      ),
                 
                    ],
                   color: Colors.white, 
                  ),
                  child: MaterialButton(
                      highlightColor: Colors.transparent,
                      splashColor: Theme.Colors.loginGradientEnd,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 70.0),
                        child: Text(
                          "SIGN UƒP",
                          style: TextStyle(
                              color: Colors.blue[500],
                              fontSize: 25.0,
                              ),
                        ),
                      ),
                      onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => Login1Page(),
                  ),
                );
              },)),
            ],
          ),
        ],
      ),
    );
  }

  Future<FirebaseUser> _signInWithGoogle() async {
    GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();

    GoogleSignInAuthentication gSA = await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
        idToken: gSA.idToken, accessToken: gSA.accessToken);

    LoginPage.user = (await _auth.signInWithCredential(credential)).user;

    DatabaseService(uid: LoginPage.user.uid).updateUserInfo(
        LoginPage.user.email, LoginPage.user.displayName, false);

    DatabaseService(uid: LoginPage.user.uid).updateUserTokens(0);
    DatabaseService(uid: LoginPage.user.uid).updateUserStatus(false);
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

  Future<FirebaseUser> _signUpWithEmailPassword() async {
    FirebaseUser user;
    try {
      user = (await _auth.createUserWithEmailAndPassword(
              email: signupEmailController.text,
              password: signupPasswordController.text))
          .user;
      userName = signupNameController.text;
      if (signupNameController.text == "" ||
          signupPasswordController.text.length < 8 ||
          signupPasswordController.text !=
              signupConfirmPasswordController.text) {
        showDialog(
            context: context,
            builder: (_) => AlertDialog(
                  title: Text(
                      'ERROR! One of the following might have caused an issue:'),
                  content: Text(
                      '1. Invalid Name\n\n2. Invalid Email Address\n\n3. Email already in use\n\n4. Password shorter than 8 characters\n\n5. Password and Confirm Password do not match'),
                ));
      } else {
        user.sendEmailVerification();
        showDialog(
            context: context,
            builder: (_) => AlertDialog(
                  title: Text('Sign Up Successful!'),
                  content: Text(
                      'An Email will be sent to your registered email address for verification purposes'),
                ));
      }
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<FirebaseUser> _signInWithEmailPassword() async {
    FirebaseUser user;
    LoginPage.user = (await _auth.signInWithEmailAndPassword(
            email: loginEmailController.text,
            password: loginPasswordController.text))
        .user;
    if (LoginPage.user.isEmailVerified) {
      try {
        DatabaseService(uid: LoginPage.user.uid)
            .updateUserInfo(LoginPage.user.email, userName, false);

        DatabaseService(uid: LoginPage.user.uid).updateUserTokens(0);
        DatabaseService(uid: LoginPage.user.uid).updateUserStatus(false);
        DatabaseService(uid: LoginPage.user.uid).updateUserPoints(0);
        DatabaseService(uid: LoginPage.user.uid).updateUserTier('Bronze');

        DatabaseService(uid: LoginPage.user.uid).updateStats();

        for (String store in StorePage.stores) {
          DatabaseService(uid: LoginPage.user.uid).resetRewards(store, 0);
        }

        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => MainInterface()));
        return user;
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

  void _toggleSignup() {
    setState(() {
      _obscureTextSignup = !_obscureTextSignup;
    });
  }

  void _toggleSignupConfirm() {
    setState(() {
      _obscureTextSignupConfirm = !_obscureTextSignupConfirm;
    });
  }
}
