import 'package:Cycled_iOS/customWidgets/CustomListTile.dart';
import 'package:Cycled_iOS/profileNav/inviteFriend.dart';
import 'package:flutter/material.dart';
import 'package:Cycled_iOS/authentication.dart';
import 'package:Cycled_iOS/profileNav/about.dart';
import 'package:Cycled_iOS/profileNav/purchaseHistory.dart';
import 'package:Cycled_iOS/profileNav/settings.dart';
import 'package:Cycled_iOS/design/theme.dart' as Theme;
import 'package:progress_dialog/progress_dialog.dart';

class ProfileMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ProgressDialog pd = ProgressDialog(context);
    pd.style(message: "Loading");

    return ListView(
      children: <Widget>[
        Container(
          height: 100,
          child: DrawerHeader(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: <Color>[
              Theme.Colors.loginGradientStart,
              Theme.Colors.loginGradientEnd
            ])),
            child: Container(
                child: Column(
              children: <Widget>[
                Material(
                  borderRadius: BorderRadius.all(Radius.circular(100.0)),
                  elevation: 10,
                
                ),
                Padding(
                    padding: EdgeInsets.all(15),
                    child: Text("Profile",
                        style: TextStyle(fontSize: 30, color: Colors.white))),
              ],
            )),
          ),
        ),
        CustomListTile(
            Icons.history,
            "Purchase History",
            () => {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => PurchaseHistory()))
                }),
        CustomListTile(
            Icons.share,
            "Refer & Earn",
            () => {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => ReferFriend()))
                }),
        CustomListTile(
            Icons.settings,
            "Settings",
            () => {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => Settings()))
                }),
        CustomListTile(
            Icons.info,
            "About",
            () => {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => About()))
                }),
        CustomListTile(
            Icons.lock,
            "Logout",
            () => {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => LoginPage()))
                }),
      ],
    );
  }
}
