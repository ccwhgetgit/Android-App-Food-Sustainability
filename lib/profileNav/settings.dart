import "package:flutter/material.dart";
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => new _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(LineAwesomeIcons.arrow_left),
              onPressed: () => {Navigator.pop(context, false)}),
          centerTitle: true,
          backgroundColor: Color.fromRGBO(1, 68, 109, 1.0),
          title: Text("Settings",
              style: TextStyle(fontSize: 23, fontFamily: 'SFProText')),
        ),
        body: Center(
            child: Column(
          children: <Widget>[
            SizedBox(height: 300),
            Text(
                "Oops! This page is currently still under maintanence. We apologize for any inconvenience caused.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20)),
          ],
        )));
  }
}
