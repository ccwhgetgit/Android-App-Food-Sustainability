import 'package:flutter/material.dart';

class StartDiscussion extends StatefulWidget {
  @override
  _StartDiscussionState createState() => new _StartDiscussionState();
}

class _StartDiscussionState extends State<StartDiscussion> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
            centerTitle: true,
            leading: GestureDetector(
                child: Icon(Icons.close, color: Colors.black),
                onTap: () => Navigator.of(context).pop()),
            backgroundColor: Colors.transparent,
            title:
                Text("New Discussion", style: TextStyle(color: Colors.black))),
        body: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: Column(
              children: <Widget>[
                SizedBox(height: 10),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: TextField(
                        maxLines: 2,
                        maxLength: 50,
                        decoration: InputDecoration(
                            icon: Icon(Icons.title, color: Colors.black),
                            hintText: "An Interesting Title"))),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: TextField(
                        maxLines: 8,
                        maxLength: 500,
                        decoration: InputDecoration(
                            icon: Icon(Icons.info_outline, color: Colors.black),
                            hintText: "Discussion Content"))),
                SizedBox(height: 30),
                SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.width * 0.12,
                    child: RaisedButton(
                        color: Colors.blueGrey[700],
                        child: Row(
                          children: <Widget>[
                            Padding(
                                padding: EdgeInsets.only(
                                    left: MediaQuery.of(context).size.width *
                                        0.15),
                                child: Icon(Icons.create, color: Colors.white)),
                            SizedBox(width: 10),
                            Text("POST DISCUSSION",
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white)),
                          ],
                        ),
                        onPressed: () {}))
              ],
            )));
  }
}
