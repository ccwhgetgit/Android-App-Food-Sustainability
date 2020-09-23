import 'package:Cycled_iOS/connect/startDiscussion.dart';
import 'package:Cycled_iOS/database/DatabaseService.dart';
import 'package:flutter/material.dart';

import '../authentication.dart';
import 'connectHeader.dart';

class ConnectPage extends StatefulWidget {
  @override
  _ConnectPageState createState() => new _ConnectPageState();
}

class _ConnectPageState extends State<ConnectPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: Container(
            child: Column(children: <Widget>[
      SizedBox(height: MediaQuery.of(context).size.height * 0.03),
      SizedBox(height: MediaQuery.of(context).size.height * 0.03),
      Row(
        children: <Widget>[
          SizedBox(width: MediaQuery.of(context).size.width * 0.05),
          Align(
              alignment: Alignment.centerLeft,
              child: Text("Discover ",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: MediaQuery.of(context).size.width * 0.05))),
        ],
      ),
      ConnectHeader(),
      SizedBox(height: MediaQuery.of(context).size.height * 0.05),
      Row(
        children: <Widget>[
          SizedBox(width: MediaQuery.of(context).size.width * 0.05),
          Align(
              alignment: Alignment.centerLeft,
              child: Text("News Feed",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: MediaQuery.of(context).size.width * 0.05))),
          SizedBox(width: MediaQuery.of(context).size.width * 0.45),
          MaterialButton(
              color: Colors.teal[200],
              splashColor: Colors.green[900],
              child: Column(
                children: <Widget>[
                  Icon(Icons.create,
                      size: MediaQuery.of(context).size.width * 0.04),
                ],
              ),
              shape: CircleBorder(),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => StartDiscussion(),
                  ),
                );
              })
        ],
      ),
      Expanded(
        child: DatabaseService(uid: LoginPage.user.uid).getThreads(),
      ),
    ])));
  }
}
