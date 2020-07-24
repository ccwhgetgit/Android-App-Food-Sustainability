import 'package:Cycled_iOS/customWidgets/DailyPollCard.dart';
import 'package:Cycled_iOS/customWidgets/pie_chart.dart';
import 'package:Cycled_iOS/database/DatabaseService.dart';


import 'package:flutter/material.dart';
import 'dart:ui';

import '../authentication.dart';

class GridPage extends StatefulWidget {
  @override
  _GridPageState createState() => new _GridPageState();
}

var cardAspectRatio = 12.0 / 16.0;
var widgetAspectRatio = cardAspectRatio * 1.2;

class _GridPageState extends State<GridPage> with TickerProviderStateMixin {
//  topbar

  @override
  Widget build(BuildContext context) {
  

    return new Container( 
            child:  Stack(
              children:<Widget>[
           

              GridView.count(
          primary: false,
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: MediaQuery.of(context).size.width * 0.02,
          mainAxisSpacing:  MediaQuery.of(context).size.width * 0.04,
          crossAxisCount: 2,
          children: [
        
         
        new GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DailyPollCard(),
                  ),
            );
          },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30.0),
          child: Container(
          color: Colors.teal[200],
          width: 200,
          height: 200,
          child: Column(
            children:<Widget>[
              

            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
        
        
          Align(
      alignment: Alignment.centerLeft,
      child: Container(
      child: Row(
         children:<Widget>[
            SizedBox(width: MediaQuery.of(context).size.width * 0.018),
           DatabaseService(uid: LoginPage.user.uid).obtainPollAttempt(),
         ]
      ),
      )
          ),
      SizedBox(height: MediaQuery.of(context).size.height * 0.012),
     Align(
      alignment: Alignment.centerLeft,
      child: Container(
      child: Row(
         children:<Widget>[
            SizedBox(width: MediaQuery.of(context).size.width * 0.018),
     Text(
          "  Knowledge", style: TextStyle(color:Colors.white, fontSize: 18),
        ),
         ]),
      ),
    ),


            ]),
  ),
  
        ),     
    ),
    

          new GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DailyPollCard(),
                  ),
            );
          },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30.0),
          child: Container(
          color: Colors.blueGrey[500],
          width: 200,
          height: 200,
          child: Column(
            children:<Widget>[
              

            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
        
        
          Align(
      alignment: Alignment.centerLeft,
      child: Container(
      child: Row(
         children:<Widget>[
            SizedBox(width: MediaQuery.of(context).size.width * 0.018),
           DatabaseService(uid: LoginPage.user.uid).obtainDisposalAttempt(),
         ]
      ),
      )
          ),
      SizedBox(height: MediaQuery.of(context).size.height * 0.012),
     Align(
      alignment: Alignment.centerLeft,
      child: Container(
      child: Row(
         children:<Widget>[
            SizedBox(width: MediaQuery.of(context).size.width * 0.018),
     Text(
          "  Disposal", style: TextStyle(color:Colors.white, fontSize: 18),
        ),
         ]),
      ),
    ),


            ]),
  ),
  
        ),     
    ),
      

            









        new GestureDetector(
          onTap: () {
           
          },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30.0),
          child: Container(
          color: Colors.blueGrey[300],
          width: 200,
          height: 200,
          child: Column(
            children:<Widget>[
            
             SizedBox(height: MediaQuery.of(context).size.height * 0.015),
        
              Row(children: <Widget>[
 SizedBox(width: MediaQuery.of(context).size.width * 0.028),
           
            DatabaseService(uid: LoginPage.user.uid).getTierDisplayHome(),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
        ],),
         SizedBox(height: MediaQuery.of(context).size.height * 0.04),
        
          Align(
      alignment: Alignment.centerLeft,
      child: Container(
      child: Row(
         children:<Widget>[
            SizedBox(width: MediaQuery.of(context).size.width * 0.038),
             DatabaseService(uid: LoginPage.user.uid).getHomePoints(),
             SizedBox(width: MediaQuery.of(context).size.width * 0.02),
             Text("points",
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.05,
                fontWeight: FontWeight.bold,
                color: Colors.white)
                ),
         ]
      ),
      )
          ),
          
      SizedBox(height: MediaQuery.of(context).size.height * 0.012),
     Align(
      alignment: Alignment.centerLeft,
      child: Container(
      child: Row(
         children:<Widget>[
            SizedBox(width: MediaQuery.of(context).size.width * 0.018),
    
         ]),
      ),
    ),


            ]),
  ),
  
        ),     
    ),





        new GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Piechart(),
                  ),
            );
          },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30.0),
          child: Container(
          color: Colors.yellow[800],
          width: 200,
          height: 200,
          child: Column(
            children:<Widget>[
              

            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
        
        
          Align(
      alignment: Alignment.centerLeft,
      child: Container(
      child: Row(
         children:<Widget>[
            SizedBox(width: MediaQuery.of(context).size.width * 0.028),
          
          Text(
          "Track your environmental contributions!", style: TextStyle(color:Colors.white, fontSize: MediaQuery.of(context).size.width * 0.02),
        ),

         ]
      ),
      )
          ),
      SizedBox(height: MediaQuery.of(context).size.height * 0.052),
     Align(
      alignment: Alignment.centerLeft,
      child: Container(
      child: Row(
         children:<Widget>[
            SizedBox(width: MediaQuery.of(context).size.width * 0.024),
     Text(
          "Progress Card", style: TextStyle(color:Colors.white, fontSize: MediaQuery.of(context).size.width * 0.05),
        ),
         ]),
      ),
    ),


            ]),
  ),
  
        ),     
    ),






             ]),


              Expanded(
  child: Align(
    alignment: FractionalOffset.bottomCenter,
      child: Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.15),
          child: DatabaseService(uid: LoginPage.user.uid).obtainOverallAttempt() 
         //Your widget here,
    ),
  ),
)


              ]));
     
    
  }
}
