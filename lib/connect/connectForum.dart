import 'package:Cycled_iOS/connect/startDiscussion.dart';
import 'package:Cycled_iOS/database/DatabaseService.dart';
import 'package:flutter/material.dart';
import '../authentication.dart';

class ConnectForum extends StatefulWidget {
  @override
  _ConnectForumState createState() => new _ConnectForumState();
}

class _ConnectForumState extends State<ConnectForum> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Container(
            child: Stack(children: <Widget>[
      DatabaseService(uid: LoginPage.user.uid).getThreads(),
      Positioned(
          top: MediaQuery.of(context).size.height / 1.55,
          left: MediaQuery.of(context).size.width / 1.2,
          //to infinite to align in centre

          height: MediaQuery.of(context).size.height,
          child: Column(children: <Widget>[
            Row(children: <Widget>[
              ButtonTheme(
                  minWidth: MediaQuery.of(context).size.width / 7.5,
                  height: MediaQuery.of(context).size.height / 10,
                  child: MaterialButton(
                      color: Colors.teal[200],
                      splashColor: Colors.green[900],
                      child: Column(
                        children: <Widget>[
                          Icon(Icons.add, size: 20),
                        ],
                      ),
                      shape: CircleBorder(),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => StartDiscussion(),
                          ),
                        );
                      }))
            ])
          ]))
    ])));
  }
}
