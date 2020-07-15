import 'package:Cycled_iOS/database/DatabaseService.dart';
import 'package:Cycled_iOS/profileNav/inviteFriend.dart';
import 'package:Cycled_iOS/profileNav/settings.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

import '../authentication.dart';
import 'package:Cycled_iOS/profileNav/about.dart';
import 'package:Cycled_iOS/profileNav/purchaseHistory.dart';
import 'package:Cycled_iOS/authentication.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class ProfileListItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool hasNavigation;

  const ProfileListItem({
    Key key,
    this.icon,
    this.text,
    this.hasNavigation = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      margin: EdgeInsets.symmetric(
        horizontal: 40,
      ).copyWith(
        bottom: 20,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 20,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.grey[300],
      ),
      child: MaterialButton(
        child: Row(
          children: <Widget>[
            Icon(
              this.icon,
              size: 25,
            ),
            SizedBox(width: 15),
            Text(this.text,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                )),
            Spacer(),
            if (this.hasNavigation)
              Icon(
                LineAwesomeIcons.angle_right,
                size: 25,
              ),
          ],
        ),
        onPressed: () => {
          if (this.text == 'Purchase History')
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => PurchaseHistory()))
          else if (this.text == 'About')
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => About()))
          else if (this.text == 'Settings')
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Settings()))
          else if (this.text == 'Logout')
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => LoginPage()))
        },
      ),
    );
  }
}

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
        borderRadius: BorderRadius.circular(30),
   color: Colors.blueGrey[500],
      ),

     
        height:MediaQuery.of(context).size.height/2.5,
        width: MediaQuery.of(context).size.width,
      ),
    );
  }

  Widget _getInfo() {
    return Positioned(
      child: Container(
        margin: const EdgeInsets.all(20),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width * 0.90,
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    radius: 55,
                    backgroundColor: Colors.grey[100],
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('assets/images/profile.png'),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  DatabaseService(uid: LoginPage.user.uid).getNewName(),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.red)),
                    onPressed: () => {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ReferFriend()))
                    },
                    color: Colors.red,
                    splashColor: Colors.red[100],
                    textColor: Colors.white,
                    child: Text("Invite Your Friends".toUpperCase(),
                        style: TextStyle(fontSize: 14)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
            ),
            _greenColors(),
            _getInfo(),
            Positioned(
              top: MediaQuery.of(context).size.height / 3,
              right: MediaQuery.of(context).size.width /
                  9999, //to infinite to align in centre

              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(children: <Widget>[
                ProfileListItem(
                  icon: LineAwesomeIcons.history,
                  text: 'Purchase History',
                ),
                ProfileListItem(
                  icon: LineAwesomeIcons.user_plus,
                  text: 'About',
                ),
                ProfileListItem(
                  icon: LineAwesomeIcons.exclamation_circle,
                  text: 'Settings',
                ),
                ProfileListItem(
                  icon: LineAwesomeIcons.alternate_sign_out,
                  text: 'Logout',
                  hasNavigation: false,
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
