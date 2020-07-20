import 'package:Cycled_iOS/database/DatabaseService.dart';
import 'package:flutter/material.dart';
import '../authentication.dart';
import 'startDiscussion.dart';

class Trending extends StatefulWidget {
  @override
  _TrendingState createState() => new _TrendingState();
}

class _TrendingState extends State<Trending> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(
          MediaQuery.of(context).size.height / 6.5,
        ),
        child: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          title: PreferredSize(
              preferredSize: Size.fromHeight(
                0,
              ),
              child: TextField(
                  decoration: InputDecoration(
                      icon: Icon(Icons.search, color: Colors.black),
                      hintText: "Search Thread"))),
          bottom: PreferredSize(
              preferredSize: Size.fromHeight(
                0,
              ),
              child: Padding(
                  padding: EdgeInsets.only(top: 2.0),
                  child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.width * 0.12,
                      child: RaisedButton(
                          color: Colors.white,
                          child: Row(
                            children: <Widget>[
                              Icon(Icons.create),
                              SizedBox(width: 10),
                              Text("Start A Discussion",
                                  style: TextStyle(fontSize: 18)),
                            ],
                          ),
                          onPressed: () {
                            showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return Container(
                                      color: Color(0xFF737373),
                                      child: Container(
                                          child: StartDiscussion(),
                                          decoration: BoxDecoration(
                                              color:
                                                  Theme.of(context).canvasColor,
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(30),
                                                  topRight:
                                                      Radius.circular(30)))));
                                });
                          })))),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.cancel, color: Colors.black),
                onPressed: () {
                  setState(() {});
                })
          ],
        ),
      ),
      body: DatabaseService(uid: LoginPage.user.uid).getThreads(),
    );
  }
}
