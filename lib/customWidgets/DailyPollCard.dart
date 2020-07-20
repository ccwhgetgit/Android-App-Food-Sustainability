import 'package:flutter/material.dart';

import '../dailyPoll.dart';

class DailyPollCard extends StatefulWidget {
  @override
  _DailyPollCard createState() => _DailyPollCard();
}

class _DailyPollCard extends State<DailyPollCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Container(
            child: Stack(children: <Widget>[
      Container(
        child: Container(
          height: MediaQuery.of(context).size.height / 1.7,
          width: MediaQuery.of(context).size.width - 2,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(0.0)),
          ),
        ),
      ),

      Positioned(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.155,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: new BorderRadius.only(
                bottomLeft: const Radius.circular(20.0),
                bottomRight: const Radius.circular(20.0)),
            color: Colors.blueGrey[100],
          ),
        ),
      ),
      Positioned(
        top: MediaQuery.of(context).size.height / 39,
        //to infinite to align in centre

        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width / 1.16,
        child: Column(children: <Widget>[
          Center(
              child: Text(
            "LEARN and earn              ".toUpperCase(),
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.width / 14,
              fontFamily: "Arial",
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          )),
        ]),
      ),

      Positioned(
        top: MediaQuery.of(context).size.height / 12,

        //to infinite to align in centre

        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width / 1.38,
        child: Column(children: <Widget>[
          Row(
            children: <Widget>[
              Image.asset("assets/images/PolLDetails.png",
                  width: MediaQuery.of(context).size.width / 1.4),
            ],
          )
        ]),
      ),

      //build a container with grey
      //small graphic with quote

      Positioned(
        top: MediaQuery.of(context).size.height / 6.5,

        //to infinite to align in centre

        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(children: <Widget>[
          Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(6),
                    height: MediaQuery.of(context).size.height / 10,
                    width: MediaQuery.of(context).size.width / 5,
                    child: CircleAvatar(
                      radius: 1072.0,
                      backgroundColor: Colors.transparent,
                      backgroundImage: AssetImage('assets/images/quiz1.png'),
                    ),
                  ),
                  Row(children: <Widget>[
                    Text(
                      "Choose the right answer to",
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      " 5 easy questions ",
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ]),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 70,
              ),
              Row(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(6),
                    height: MediaQuery.of(context).size.height / 10,
                    width: MediaQuery.of(context).size.width / 5,
                    child: CircleAvatar(
                      radius: 1072.0,
                      backgroundColor: Colors.transparent,
                      backgroundImage: AssetImage('assets/images/quiz2.png'),
                    ),
                  ),
                  Row(children: <Widget>[
                    Text(
                      "Test & Expand your ",
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "environmental knowledge ",
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ]),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 70,
              ),
              Row(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(6),
                    height: MediaQuery.of(context).size.height / 10,
                    width: MediaQuery.of(context).size.width / 5,
                    child: CircleAvatar(
                      radius: 1072.0,
                      backgroundColor: Colors.transparent,
                      backgroundImage: AssetImage('assets/images/quiz3.png'),
                    ),
                  ),
                  Row(children: <Widget>[
                    Text(
                      "Earn ",
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "10 tokens ",
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "on every correct answer",
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.black,
                      ),
                    ),
                  ]),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 70,
              ),
              Row(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(6),
                    height: MediaQuery.of(context).size.height / 10,
                    width: MediaQuery.of(context).size.width / 5,
                    child: CircleAvatar(
                      radius: 1072.0,
                      backgroundColor: Colors.transparent,
                      backgroundImage: AssetImage('assets/images/quiz4.png'),
                    ),
                  ),
                  Row(children: <Widget>[
                    Text(
                      "Redeem your ",
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "earned points ",
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "on exciting rewards",
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.black,
                      ),
                    ),
                  ]),
                ],
              ),
            ],
          )
        ]),
      ),

      _buildFooter(context),
    ])));
  }
}

Widget _buildFooter(BuildContext context) {
  return Positioned(
    bottom: 0,
    child: Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 25),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => PollQuestion(),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.teal[200],
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    offset: Offset(1, 1),
                    spreadRadius: 1,
                    blurRadius: 3,
                  )
                ],
              ),
              width: MediaQuery.of(context).size.width,
              height: 90,
              child: Center(
                child: Text(
                  "GET STARTED",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    ),
  );
}
