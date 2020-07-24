import 'package:Cycled_iOS/authentication.dart';
import 'package:Cycled_iOS/database/DatabaseService.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class DailyPollCard extends StatefulWidget {
  @override
  _DailyPollCard createState() => _DailyPollCard();
}

class _DailyPollCard extends State<DailyPollCard> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        
        body: Stack(
          children: <Widget>[
            Container(
                child: Column(
              children: <Widget>[
       
      Positioned(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.23,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: new BorderRadius.only(
                bottomLeft: const Radius.circular(20.0),
                bottomRight: const Radius.circular(20.0)),
            color: Colors.blueGrey[100],
          ),
          child: Column(children: <Widget>[
            SizedBox(height
            : MediaQuery.of(context).size.height / 25),
        
            Row(
            children: <Widget>[
              
            IconButton(
              icon: Icon(
                LineAwesomeIcons.arrow_left,
                color: Colors.black,
              ),
              onPressed: () => {Navigator.pop(context, false)}),
            ]),
          
          Center(
              child: Text(
            "LEARN and earn              ".toUpperCase(),
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.width / 14,
           
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          )),
 Row(
            children: <Widget>[
              SizedBox(width: MediaQuery.of(context).size.width / 35),
           Image.asset("assets/images/PollDetails.png",
                  width: MediaQuery.of(context).size.width / 1.4),
            ]),



            
        ]),
        ),
      ),

      Positioned(
        top: MediaQuery.of(context).size.height / 6.5,

        //to infinite to align in centre

        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(children: <Widget>[
          Column(
            children: <Widget>[
               SizedBox(height
            : MediaQuery.of(context).size.height / 15),
        
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
                      "Just answer",
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      " 1 question ",
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "a day",
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.black,
                      ),
                    ),
                  ]),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 60,
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
                height: MediaQuery.of(context).size.height / 60,
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
                      "each day you complete it",
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.black,
                      ),
                    ),
                  ]),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height /60,
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
                      "earned tokens ",
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
          ),
           SizedBox(height
            : MediaQuery.of(context).size.height / 10.45),
        
        ]),
      ),
      

      _buildFooter(),
    ]))]));
  }
}

Widget _buildFooter() {
  return DatabaseService(uid: LoginPage.user.uid).checkUserPollAttempt();
}
