import 'package:Cycled_iOS/customWidgets/DailyPollCard.dart';
import 'package:Cycled_iOS/customWidgets/formPage.dart';
import 'package:Cycled_iOS/customWidgets/pie_chart.dart';
import 'package:Cycled_iOS/database/DatabaseService.dart';
import 'package:Cycled_iOS/profileNav/inviteFriend.dart';
import 'package:Cycled_iOS/tabs/storePage.dart';
import 'package:charts_flutter/flutter.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

import '../authentication.dart';
import 'package:Cycled_iOS/profileNav/about.dart';
import 'package:Cycled_iOS/authentication.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Widget _greenColors() {
    return Positioned(
      top: 0,
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/images/farming.gif"),
          colorFilter: new ColorFilter.mode(
              Colors.white.withOpacity(0.25), BlendMode.dstATop),
        )),
        height: MediaQuery.of(context).size.height / 2.6,
        width: MediaQuery.of(context).size.width,
      ),
    );
  }

  Widget _getInfo() {
    return Positioned(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.09,
              ),
              Row(children: <Widget>[
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.05,
                ),
                DatabaseService(uid: LoginPage.user.uid).getNewName(),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.41,
                ),
              ]),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Row(children: <Widget>[
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.05,
                ),
                /*
             CircleAvatar(
                    radius: MediaQuery.of(context).size.width * 0.03,
                    backgroundColor: Colors.grey[100],
                    child: CircleAvatar(
                      radius: MediaQuery.of(context).size.width * 0.03,
                       backgroundImage:
                          AssetImage('assets/images/points.png',)
                    ),
                  ),
            SizedBox(
                    width: MediaQuery.of(context).size.width * 0.02,
                  ),
   DatabaseService(uid: LoginPage.user.uid).getPoints(),  
   */

                CircleAvatar(
                  radius: MediaQuery.of(context).size.width * 0.03,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                      radius: MediaQuery.of(context).size.width * 0.03,
                      backgroundImage: AssetImage(
                        'assets/images/cash.png',
                      )),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.01,
                ),
                DatabaseService(uid: LoginPage.user.uid)
                    .getMemberTokens('usercard'),
              ]),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Row(children: <Widget>[
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.05,
                ),
/*
                  
   Text("Points",
                    style: TextStyle(
                      color: Colors.grey[600],
                        fontSize: MediaQuery.of(context).size.height * 0.018)),
    SizedBox(
                    width: MediaQuery.of(context).size.width * 0.21,
                  ),
                  */
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.02,
                ),
                Text("Tokens",
                    style: TextStyle(
                        color: Colors.grey[900],
                        fontSize: MediaQuery.of(context).size.height * 0.02)),
              ]),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              Row(children: <Widget>[
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.30,
                  height: MediaQuery.of(context).size.height * 0.05,
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => LoginPage()));
                    },
                    child: Row(children: <Widget>[
                      Icon(Icons.exit_to_app),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.017,
                      ),
                      Text("Logout ".toUpperCase(),
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.027,
                          )),
                    ]),
                  ),
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getMember() {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width * 0.90,
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // DatabaseService(uid: LoginPage.user.uid).obtainPoints(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Row(children: <Widget>[
              Text(
                "Daily Challenges             ",
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.04,
                  color: Colors.black,
                ),
              ),
            ]),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),

            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              new GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DailyPollCard(),
                    ),
                  );
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.42,
                    height: MediaQuery.of(context).size.height * 0.19,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/knowledgepic.png"),
                            colorFilter: new ColorFilter.mode(
                                Colors.black.withOpacity(0.03),
                                BlendMode.dstATop),
                            fit: BoxFit.fitHeight)),
                    child: Column(children: <Widget>[
                      DatabaseService(uid: LoginPage.user.uid)
                          .obtainPollGraph(),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.055),
                      Text("Learn & Earn",
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.04,
                              color: Colors.black,
                              fontWeight: FontWeight.bold)),
                      Text("Trivias and Fun Facts",
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.034,
                            color: Colors.grey[700],
                          )),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            child: Row(children: <Widget>[
                              SizedBox(
                                  width: MediaQuery.of(context).size.width *
                                      0.018),
                            ]),
                          )),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.012),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          child: Row(children: <Widget>[
                            SizedBox(
                                width:
                                    MediaQuery.of(context).size.width * 0.018),
                          ]),
                        ),
                      ),
                    ]),
                  ),
                ),
              ),
              SizedBox(width: MediaQuery.of(context).size.width * 0.05),
              new GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Piechart(),
                    ),
                  );
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30.0),
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/disposalpic.png"),
                            colorFilter: new ColorFilter.mode(
                                Colors.black.withOpacity(0.08),
                                BlendMode.dstATop),
                            fit: BoxFit.fitHeight)),
                    width: MediaQuery.of(context).size.width * 0.42,
                    height: MediaQuery.of(context).size.height * 0.19,
                    child: Column(children: <Widget>[
                      DatabaseService(uid: LoginPage.user.uid)
                          .obtainDisposalGraph(),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.055),
                      Text("Recycle Food",
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.04,
                              color: Colors.black,
                              fontWeight: FontWeight.bold)),
                      Text("Locate the nearest points",
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.034,
                            color: Colors.grey[700],
                          )),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            child: Row(children: <Widget>[
                              SizedBox(
                                  width: MediaQuery.of(context).size.width *
                                      0.018),
                            ]),
                          )),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.012),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          child: Row(children: <Widget>[
                            SizedBox(
                                width:
                                    MediaQuery.of(context).size.width * 0.018),
                          ]),
                        ),
                      ),
                    ]),
                  ),
                ),
              ),
            ]),

            SizedBox(height: MediaQuery.of(context).size.height * 0.04),

            Row(children: <Widget>[
              Text(
                "Explore            ",
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.04,
                  color: Colors.black,
                ),
              ),
            ]),

            SizedBox(height: MediaQuery.of(context).size.height * 0.03),

            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              new GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => StorePage(),
                    ),
                  );
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: MediaQuery.of(context).size.height * 0.14,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                              "assets/images/back.png",
                            ),
                            colorFilter: new ColorFilter.mode(
                                Colors.black.withOpacity(0.008),
                                BlendMode.dstATop),
                            fit: BoxFit.fitWidth)),
                    child: Column(children: <Widget>[
                      Image.asset("assets/images/rewards.png",
                          width: MediaQuery.of(context).size.width / 7),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01),
                      Text("Rewards",
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.04,
                              color: Colors.grey[900],
                              fontWeight: FontWeight.bold)),
                      Text("Redeem with our partners",
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.03,
                            color: Colors.grey[600],
                          )),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          child: Row(children: <Widget>[
                            SizedBox(
                                width:
                                    MediaQuery.of(context).size.width * 0.018),
                          ]),
                        ),
                      ),
                    ]),
                  ),
                ),
              ),
              SizedBox(width: MediaQuery.of(context).size.width * 0.05),
              new GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FormPage(),
                    ),
                  );
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30.0),
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                              "assets/images/back.png",
                            ),
                            colorFilter: new ColorFilter.mode(
                                Colors.black.withOpacity(0.008),
                                BlendMode.dstATop),
                            fit: BoxFit.fitWidth)),
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: MediaQuery.of(context).size.height * 0.14,
                    child: Column(children: <Widget>[
                      Image.asset("assets/images/host.png",
                          width: MediaQuery.of(context).size.width / 7),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.003),
                      Text("Be A Host",
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.04,
                              color: Colors.grey[900],
                              fontWeight: FontWeight.bold)),
                      Text("Collect & Compost",
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.03,
                            color: Colors.grey[600],
                          )),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          child: Row(children: <Widget>[
                            SizedBox(
                                width:
                                    MediaQuery.of(context).size.width * 0.018),
                          ]),
                        ),
                      ),
                    ]),
                  ),
                ),
              ),
            ]),

            SizedBox(height: MediaQuery.of(context).size.height * 0.03),

            Row(children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * 0.30,
                height: MediaQuery.of(context).size.height * 0.05,
                child: FlatButton(
                  onPressed: () => {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ReferFriend()))
                  },
                  color: Colors.white,
                  child: Text("Share & Invite".toUpperCase(),
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontSize: MediaQuery.of(context).size.width * 0.027,
                      )),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.3,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.30,
                height: MediaQuery.of(context).size.height * 0.05,
                child: FlatButton(
                  onPressed: () => {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => About()))
                  },
                  color: Colors.white,
                  child: Text("Contact Us ".toUpperCase(),
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontSize: MediaQuery.of(context).size.width * 0.027,
                      )),
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (OverscrollIndicatorNotification overscroll) {
        overscroll.disallowGlow();
        return;
      },
      child: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
            ),

            /*
               Positioned(
              height: MediaQuery.of(context).size.height/8,
              top: MediaQuery.of(context).size.height/11,
              width: MediaQuery.of(context).size.width,
              left:   MediaQuery.of(context).size.width/3,
               child:
         CircleAvatar(
                    radius: MediaQuery.of(context).size.width * 0.12,
                     backgroundColor: Colors.blueGrey[50],
                    child: CircleAvatar(
                      radius: MediaQuery.of(context).size.width * 0.11,
                                            backgroundColor: Color(0xffFDCF09),
                backgroundImage:
                
                        AssetImage("assets/images/member.png"),
                      
                      
                             ),
                  ),
                  
             ),
             */

            _greenColors(),
            _getInfo(),
            Positioned(
              top: MediaQuery.of(context).size.height / 3.1,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                  ),
                  child: Column(children: <Widget>[
                    DatabaseService(uid: LoginPage.user.uid)
                        .homeRefreshPollAttempt(),
                    DatabaseService(uid: LoginPage.user.uid)
                        .homeRefreshDisposeAttempt(),
                    _getMember(),
                  ])),

              /*
return Positioned(
      top: 0,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.white,
        ),
        height: MediaQuery.of(context).size.height / 2.5,
        width: MediaQuery.of(context).size.width,
      ),
    );
          */
            )
          ],
        ),
      ),
    ));
  }
}
