import "package:flutter/material.dart";
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class RedeemCode extends StatefulWidget {
  @override
  _RedeemCodeState createState() => new _RedeemCodeState();
}

class _RedeemCodeState extends State<RedeemCode> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(LineAwesomeIcons.arrow_left),
              onPressed: () => {Navigator.pop(context, false)}),
          centerTitle: true,
          backgroundColor: Color.fromRGBO(1, 68, 109, 1.0),
          title: Text("Redeem Referral Code",
              style: TextStyle(fontSize: 23, fontFamily: 'SFProText')),
        ),
        body: Center(
            child: Column(
          children: <Widget>[
            SizedBox(height: 40),
            Image.asset('assets/images/gift.png', height: 150),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: Text("GOT A REFERRAL CODE?",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                  "Enter your referral code below to claim the referral reward of 30 Tokens!",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20)),
            ),
            SizedBox(height: 50),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 60),
              child: TextField(
                controller: TextEditingController(),
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    hintText: "Input Referral Code"),
              ),
            ),
            SizedBox(height: 20),
            Container(
              height: 50,
              decoration: BoxDecoration(color: Colors.blueGrey),
              child: OutlineButton(
                child: Text("Redeem Now",
                    style: TextStyle(fontSize: 20, color: Colors.white)),
                onPressed: () {},
              ),
            )
          ],
        )));
  }
}
