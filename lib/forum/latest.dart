import 'package:flutter/material.dart';
import 'package:share/share.dart';

import 'startDiscussion.dart';

class Latest extends StatefulWidget {
  @override
  _LatestState createState() => new _LatestState();
}

class _LatestState extends State<Latest> {
  final List<Thread> threadsList = [
    Thread("Jaryl Loh", "Ways To Compost Food",
        "Here are some ways I experimented at home that ...", false),
    Thread("Colin Chan", "Looking for Collectors who are\nkeen to collaborate",
        "Hi! Frequent collector here living in the West, I am ...", false),
    Thread("Peter Lim", "Claiming of Rewards",
        "I have sufficient tokens and have recently redeemed ...", false),
    Thread("Marcus Foo", "Storing of Unfinished Food\nOvernight",
        "Attached is a photo of unfinished food from last ... ", false),
    Thread("Celine Low", "Reporting of app bug",
        "The dispose option does not seem to allow me to ...", false),
  ];

  void share(BuildContext context) {
    final RenderBox box = context.findRenderObject();
    final String text = "Hi";

    Share.share(text,
        sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
  }

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
                                                color: Theme.of(context)
                                                    .canvasColor,
                                                borderRadius: BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(30),
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
        body: ListView.builder(
            itemCount: 5,
            itemBuilder: (BuildContext context, int index) {
              final thread = threadsList[index];
              return new Container(
                  child: Card(
                      child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                                child: Row(children: <Widget>[
                                  Text(thread.author),
                                  Text(" - "),
                                  Text("3 hours ago"),
                                ]),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                                child: Row(children: <Widget>[
                                  Text(thread.title,
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold)),
                                ]),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                                child: Row(children: <Widget>[
                                  Text(
                                    thread.content,
                                  ),
                                ]),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                                child: Row(children: <Widget>[
                                  GestureDetector(
                                      child: Icon(Icons.thumb_up),
                                      onTap: () {}),
                                  SizedBox(width: 20),
                                  GestureDetector(
                                      child: Icon(Icons.comment), onTap: () {}),
                                  SizedBox(width: 20),
                                  GestureDetector(
                                      child: Icon(Icons.reply), onTap: () {}),
                                  SizedBox(width: 180),
                                  GestureDetector(
                                      child: !thread.starPressed
                                          ? Icon(Icons.star_border)
                                          : Icon(Icons.star),
                                      onTap: () {
                                        setState(() {
                                          thread.toggleStar();
                                        });
                                      }),
                                  SizedBox(width: 20),
                                  GestureDetector(
                                      child: Icon(Icons.share),
                                      onTap: () => share(context)),
                                ]),
                              ),
                            ],
                          ))));
            }));
  }
}

class Thread {
  final String author;
  final String title;
  final String content;
  bool starPressed = false;

  Thread(this.author, this.title, this.content, this.starPressed);

  void toggleStar() {
    starPressed = !starPressed;
  }
}
