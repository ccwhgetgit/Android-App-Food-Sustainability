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
          height: MediaQuery.of(context).size.height/1.7,
          width: MediaQuery.of(context).size.width - 2,
          decoration: BoxDecoration(
            image: new DecorationImage(
              colorFilter: new ColorFilter.mode(
                  Colors.black.withOpacity(0.1), BlendMode.dstATop),
              image: AssetImage("assets/images/quiz.jpg"),
              fit: BoxFit.fill,
            ),
            borderRadius: BorderRadius.all(Radius.circular(50.0)),
          ),
        ),
      ),
 
      Positioned(
        top: MediaQuery.of(context).size.height / 14,
        right: MediaQuery.of(context).size.width /
            1000, //to infinite to align in centre

        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(children: <Widget>[

          Text(
            "     Daily Challenge     \n\n".toUpperCase(),
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 35.0,
              fontFamily: "Arial",
              fontWeight: FontWeight.bold,
              color: Colors.black,
           
            ),
          ),
 Text(
            "Its that simple.",
            style: TextStyle(
              fontSize: 25.0,
              fontFamily: "Arial",
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "\nPut your environmental knowledge",
            style: TextStyle(
              fontSize: 20.0,
              fontFamily: "Arial",
            ),
          ),
          Text(
            "to the test and earn points",
            style: TextStyle(
              fontSize: 20.0,
              fontFamily: "Arial",
            ),
          ),
          Text(
            "\n\nHonestly lah, just 1 min a day\n",
            style: TextStyle(
              fontSize: 20.0,
              fontFamily: "Arial",
              fontWeight: FontWeight.bold,
            ),
          ),
        ]),
      ),
     
            
            _buildFooter(context),
        
      

//replace with slider button for quiz page UI
      
    ])));
  }
}


  Widget _buildFooter(BuildContext context) {
    return Positioned(
      bottom: 50,
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
                  
                  color: Colors.brown[700],
                  borderRadius: BorderRadius.all(
                    Radius.circular(50),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(1, 1),
                      spreadRadius: 1,
                      blurRadius: 3,
                    )
                  ],
                ),
                width: MediaQuery.of(context).size.width * .85,
                height: 60,
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

