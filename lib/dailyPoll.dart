import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import "package:flutter/material.dart";
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import 'authentication.dart';
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
    random = rng.nextInt(4);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Stack(
        children: <Widget>[
          Image.asset('assets/images/pollBG.png',
              fit: BoxFit.cover, height: double.infinity),
          Container(
            child: Card(
              elevation: 10.0,
              margin: EdgeInsets.fromLTRB(15.0, 30.0, 15.0, 30.0),
              child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    children: <Widget>[
                      Container(
                          child: Row(
                        children: <Widget>[
                          IconButton(
                              icon: Icon(LineAwesomeIcons.arrow_left),
                              onPressed: () => Navigator.pop(context, false)),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.09),
                          Text("Question Of The Day",
                              style: TextStyle(fontSize: 20)),
                        ],
                      )),
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
                                  height:
                                      MediaQuery.of(context).size.width * 0.12,
                                  child: RaisedButton(
                                    color: selectedA
                                        ? Colors.blue
                                        : Colors.grey.shade300,
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
                                                  0.045),
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
                                            ? Colors.blue
                                            : Colors.grey.shade300,
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
                                                          0.045),
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
                                                ? Colors.blue
                                                : Colors.grey.shade300,
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
                                                              0.045),
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
                                                ? Colors.blue
                                                : Colors.grey.shade300,
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
                                                              0.045),
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
                            color: Color.fromRGBO(1, 68, 109, 1.0),
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
