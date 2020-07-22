import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import "package:flutter/material.dart";
import 'package:intl/intl.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import 'authentication.dart';
import 'customWidgets/DailyPollCard.dart';
import 'database/DatabaseService.dart';

class PollQuestion extends StatefulWidget {
  @override
  _PollQuestionState createState() => new _PollQuestionState();
}

class _PollQuestionState extends State<PollQuestion> {
  Random rng = new Random();
  bool selectedA = false;
  bool selectedB = false;
  bool selectedC = false;
  bool selectedD = false;
  bool isCorrect = false;
  bool ansVisible = false;

  int random;

  @override
  void initState() {
    super.initState();
    random = rng.nextInt(5);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
              icon: Icon(
                LineAwesomeIcons.arrow_left,
                color: Colors.black,
              ),
              onPressed: () => {Navigator.pop(context, false)}),
          title: Text("     Daily Challenge",
              style: TextStyle(color: Colors.black, fontSize: 25),
              textAlign: TextAlign.center)),
      body: Stack(
        children: <Widget>[
          Opacity(
            opacity: 0.2,
            child: Container(
              child: Image.asset(
                'assets/images/poll.jpg',
                fit: BoxFit.cover,
                height: double.infinity,
              ),
            ),
          ),
          Container(
            child: Card(
              margin: EdgeInsets.fromLTRB(15.0, 30.0, 15.0, 30.0),
              elevation: 8.0,
              color: Colors.grey[100],
              child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    children: <Widget>[
                      DatabaseService(uid: LoginPage.user.uid).getPoll(random),
                      StreamBuilder(
                        stream: Firestore.instance
                            .collection('PollDatabase')
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) return Container();

                          return SizedBox(
                            height: MediaQuery.of(context).size.height * 0.35,
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: ListView(
                              physics: NeverScrollableScrollPhysics(),
                              children: <Widget>[
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.03),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.width * 0.12,
                                  child: RaisedButton(
                                    color: selectedA
                                        ? Colors.teal[200]
                                        : Colors.grey[300],
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(18.0),
                                        side: BorderSide(
                                            color: Colors.transparent)),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                          "A. " +
                                              snapshot.data.documents[random]
                                                  ['Choice A'],
                                          style: TextStyle(
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.04),
                                          textAlign: TextAlign.left),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        selectedA = !selectedA;
                                        selectedB = false;
                                        selectedC = false;
                                        selectedD = false;
                                      });
                                      snapshot.data.documents[random]
                                                  ['Choice A'] ==
                                              snapshot.data.documents[random]
                                                  ['Answer']
                                          ? isCorrect = true
                                          : isCorrect = false;
                                    },
                                  ),
                                ),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.02),
                                SizedBox(
                                    height: MediaQuery.of(context).size.width *
                                        0.12,
                                    child: RaisedButton(
                                        color: selectedB
                                            ? Colors.teal[200]
                                            : Colors.grey[300],
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(18.0),
                                            side: BorderSide(
                                                color: Colors.transparent)),
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                              "B. " +
                                                  snapshot.data
                                                          .documents[random]
                                                      ['Choice B'],
                                              style: TextStyle(
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          0.04),
                                              textAlign: TextAlign.left),
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            selectedA = false;
                                            selectedB = !selectedB;
                                            selectedC = false;
                                            selectedD = false;
                                          });
                                          snapshot.data.documents[random]
                                                      ['Choice B'] ==
                                                  snapshot.data
                                                          .documents[random]
                                                      ['Answer']
                                              ? isCorrect = true
                                              : isCorrect = false;
                                        })),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.02),
                                SizedBox(
                                    height: MediaQuery.of(context).size.width *
                                        0.12,
                                    child: snapshot.data.documents[random]
                                                ['Choice C'] !=
                                            ""
                                        ? RaisedButton(
                                            color: selectedC
                                                ? Colors.teal[200]
                                                : Colors.grey[300],
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(18.0),
                                                side: BorderSide(
                                                    color: Colors.transparent)),
                                            child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                  "C. " +
                                                      snapshot.data
                                                              .documents[random]
                                                          ['Choice C'],
                                                  style: TextStyle(
                                                      fontSize:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.04),
                                                  textAlign: TextAlign.left),
                                            ),
                                            onPressed: () {
                                              setState(() {
                                                selectedA = false;
                                                selectedB = false;
                                                selectedC = !selectedC;
                                                selectedD = false;
                                              });
                                              snapshot.data.documents[random]
                                                          ['Choice C'] ==
                                                      snapshot.data
                                                              .documents[random]
                                                          ['Answer']
                                                  ? isCorrect = true
                                                  : isCorrect = false;
                                            })
                                        : null),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.02),
                                SizedBox(
                                    height: MediaQuery.of(context).size.width *
                                        0.12,
                                    child: snapshot.data.documents[random]
                                                ['Choice D'] !=
                                            ""
                                        ? RaisedButton(
                                            color: selectedD
                                                ? Colors.teal[200]
                                                : Colors.grey[300],
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(18.0),
                                                side: BorderSide(
                                                    color: Colors.transparent)),
                                            child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                  "D. " +
                                                      snapshot.data
                                                              .documents[random]
                                                          ['Choice D'],
                                                  style: TextStyle(
                                                      fontSize:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.04),
                                                  textAlign: TextAlign.left),
                                            ),
                                            onPressed: () {
                                              setState(() {
                                                selectedA = false;
                                                selectedB = false;
                                                selectedC = false;
                                                selectedD = !selectedD;
                                              });
                                              snapshot.data.documents[random]
                                                          ['Choice D'] ==
                                                      snapshot.data
                                                              .documents[random]
                                                          ['Answer']
                                                  ? isCorrect = true
                                                  : isCorrect = false;
                                            })
                                        : null),
                              ],
                            ),
                          );
                        },
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.width * 0.05),
                      SizedBox(
                        height: MediaQuery.of(context).size.width * 0.12,
                        child: RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0)),
                            color: Colors.blueGrey[700],
                            child: Text("Submit Answer",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18)),
                            onPressed: () {
                              if (isCorrect) {
                                showDialog(
                                    context: context,
                                    builder: (_) => AlertDialog(
                                          title: Text("Great Job! :)"),
                                          content: Text(
                                              "You've just earned yourself 10 tokens!"),
                                          actions: <Widget>[
                                            FlatButton(
                                                child: Text("OK"),
                                                onPressed: () {
                                                  DatabaseService(
                                                          uid: LoginPage
                                                              .user.uid)
                                                      .addUserTokens(10);
                                                  DatabaseService(
                                                          uid: LoginPage
                                                              .user.uid)
                                                      .updateUserPollAttempt(
                                                          true,
                                                          int.parse(DateFormat(
                                                                  'm')
                                                              .format(DateTime
                                                                  .now())));

                                                  Navigator.of(context).pop();
                                                  Navigator.of(context).pop();
                                                })
                                          ],
                                        ));
                              } else {
                                showDialog(
                                    context: context,
                                    builder: (_) => AlertDialog(
                                          title:
                                              Text("Answer is incorrect! :("),
                                          content:
                                              Text("Please try again tomorrow"),
                                          actions: <Widget>[
                                            FlatButton(
                                                child: Text("OK"),
                                                onPressed: () {
                                                  DatabaseService(
                                                          uid: LoginPage
                                                              .user.uid)
                                                      .updateUserPollAttempt(
                                                          true,
                                                          int.parse(DateFormat(
                                                                  'm')
                                                              .format(DateTime
                                                                  .now())));
                                                  Navigator.of(context).pop();
                                                  Navigator.of(context).pop();
                                                })
                                          ],
                                        ));
                              }
                            }),
                      ),
                    ],
                  )),
            ),
          )
        ],
      ),
    );
  }
}
