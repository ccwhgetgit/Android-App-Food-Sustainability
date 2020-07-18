
import "package:flutter/material.dart";
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:share/share.dart';

class ReferFriend extends StatefulWidget {
  @override
  _ReferFriendState createState() => new _ReferFriendState();
}

class _ReferFriendState extends State<ReferFriend> {
  void share(BuildContext context) {
    final RenderBox box = context.findRenderObject();
    final String text =
        "Hey there! Cycled is a great way to make cents and sense of food waste! Cycle with me through this email. Legit, no joke!";

    Share.share(text,
        sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(LineAwesomeIcons.arrow_left),
              onPressed: () => {Navigator.pop(context, false)}),
          centerTitle: true,
          backgroundColor: Color.fromRGBO(1, 68, 109, 1.0),
          title: Text("Refer & Earn",
              style: TextStyle(fontSize: 23, fontFamily: 'SFProText')),
        ),
        body: Center(
            child: Column(
          children: <Widget>[
            SizedBox(height: 40),
            Container(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.01),
                child: Row(
                  children: <Widget>[
                    Image.asset('assets/images/invitefriend.png',
                        height: MediaQuery.of(context).size.width * 0.38),
                    SizedBox(width: 15),
                    Image.asset('assets/images/arrow.png',
                        height: MediaQuery.of(context).size.width * 0.1),
                    SizedBox(width: 15),
                    Image.asset('assets/images/tokens.png',
                        height: MediaQuery.of(context).size.width * 0.38),
                  ],
                )),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: Text(
                  "Spread the joy \nSave our Environment together",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20)),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.07),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Text("Share the Link",
                  textAlign: TextAlign.center, style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
            ),
            SizedBox(height: 10),
            Container(
              height: MediaQuery.of(context).size.width * 0.13,
              width: MediaQuery.of(context).size.width * 0.8,
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.05),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue),
                  borderRadius: BorderRadius.circular(20)),
              child: Text("Link put",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.1)),
            ),
            SizedBox(height: 10),
           
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            GestureDetector(
                child: Text(
                  "Social Media Invite",
                  style: TextStyle(
                      fontSize: 15, decoration: TextDecoration.underline),
                ),
                onTap: () {
                  share(context);
                  print("test");
                }),
            SizedBox(height: 20),
           
          ],
        )));
  }
}
