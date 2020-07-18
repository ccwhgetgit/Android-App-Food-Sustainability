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
           color: Colors.white, 
            borderRadius: BorderRadius.all(Radius.circular(0.0)),
          ),
        ),
      ),
 
  Positioned(
        child: Container(
          height: MediaQuery.of(context).size.height *0.15 ,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(0),
            color: Colors.blueGrey[100],
          ),
        ),
      ),
      Positioned(
        top: MediaQuery.of(context).size.height / 39,
        //to infinite to align in centre

        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width/1.16,
        child: Column(children: <Widget>[

          Text(
            "LEARN and earn     ".toUpperCase(),
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 35.0,
              fontFamily: "Arial",
              fontWeight: FontWeight.bold,
              color: Colors.black,
           
            ),
          ),
      
        ]),
      ),
     

 Positioned(
        top: MediaQuery.of(context).size.height / 12,

        //to infinite to align in centre

        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width/1.38,
        child: Column(children: <Widget>[

              Row(children: <Widget>[
   Image.asset("assets/images/PolLDetails.png",  width:  MediaQuery.of(context).size.width/1.4), 
     


              ],)
              
        ]),
      ),
     
     //build a container with grey
     //small graphic with quote 

    

 Positioned(
        top: MediaQuery.of(context).size.height / 5,

        //to infinite to align in centre

        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(children: <Widget>[

              Row(children: <Widget>[
 Image.asset("assets/images/instructions.png",  width:  MediaQuery.of(context).size.width/1.13,), 
         

              ],)
              
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
                width: MediaQuery.of(context).size.width ,
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

