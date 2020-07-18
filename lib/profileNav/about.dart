import 'package:Cycled_iOS/customWidgets/PolicyDialog.dart';
import "package:flutter/material.dart";
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class About extends StatefulWidget {
  @override
  _AboutState createState() => new _AboutState();
}

class _AboutState extends State<About> {
  TextEditingController _subjectController = TextEditingController();
  TextEditingController _bodyController = TextEditingController();

  _sendEmail() async {
    final String _email = 'mailto: cycledorbital@gmail.com' +
        '?subject=' +
        _subjectController.text +
        '&body=' +
        _bodyController.text;
    try {
      await launch(_email);
    } catch (e) {
      throw 'Could not Call Phone';
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(LineAwesomeIcons.arrow_left, color: Colors.black),
              onPressed: () => {Navigator.pop(context, false)}),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          title: Text("About",
              style: TextStyle(fontSize: 23, color: Colors.black, fontFamily: 'SFProText')),
        ),
        body: Center(
            child: Column(
          children: <Widget>[
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                  "Cycled is a social initiative to encourage environmental sustainability through proper disposal of food wastes. Let's Cycle!",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20)),
            ),
            SizedBox(height: 70),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                  "We're here to help and answer any questions you might have. We look forward to hearing from you ☺",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20)),
            ),
            SizedBox(height: 20),
            GestureDetector(
                child: Text(
                  "Contact Us!",
                  style: TextStyle(
                      fontSize: 20, decoration: TextDecoration.underline),
                ),
                onTap: () => _sendEmail()),
            SizedBox(height: MediaQuery.of(context).size.height * 0.18),
            GestureDetector(
                child: Text(
                  "Privacy Policy",
                  style: TextStyle(
                      fontSize: 15, decoration: TextDecoration.underline),
                ),
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return PolicyDialog(mdFileName: 'privacy_policy.md');
                      });
                }),
            SizedBox(height: 10),
            GestureDetector(
                child: Text(
                  "Terms & Conditions",
                  style: TextStyle(
                      fontSize: 15, decoration: TextDecoration.underline),
                ),
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return PolicyDialog(mdFileName: 't&c.md');
                      });
                }),
            SizedBox(height: 20),
            Text("App Version 1.0.0", style: TextStyle(fontSize: 20)),
            Text("© 2020 Cycled", style: TextStyle(fontSize: 20)),
          ],
        )));
  }
}
