import 'package:Cycled_iOS/customWidgets/exploreHere.dart';
import 'package:Cycled_iOS/customWidgets/formPage.dart';
import 'package:Cycled_iOS/database/DatabaseService.dart';
import 'package:Cycled_iOS/tabs/duplicatestorePage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../authentication.dart';
import 'HowEarnPoints.dart';

class UserCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        //add app bar

        body: SingleChildScrollView(
            child: Container(
                child: Stack(children: <Widget>[
     
      Positioned(
        child: Container(
          height: MediaQuery.of(context).size.height *3 ,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(0),
            color: Colors.grey[100],
          ),
        ),
      ),
      Container(
          padding: EdgeInsets.fromLTRB(0, 25, 15, 10),
          child: Column(
            children: <Widget>[
         
              DatabaseService(uid: LoginPage.user.uid).getTier(),
            ],
          )),
           SizedBox(height: 20),
      Container(
          padding: EdgeInsets.fromLTRB(10, 85, 20, 20),
          child: Column(
            children: <Widget>[
               SizedBox(height: 10),
              Text(
                "TOKENS FOR REWARDS REDEMPTION",
                style: TextStyle(
                    fontSize: 13,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                   ),
              ),
            ],
          )),
      Container(
          padding: EdgeInsets.fromLTRB(10, 115, 40, 20),
          child: Column(
            children: <Widget>[
               SizedBox(height: 10),
              DatabaseService(uid: LoginPage.user.uid).getMemberTokens('usercard'),
            ],
          )),
      Container(
          padding: EdgeInsets.fromLTRB(90, 105, 20, 20),
          child: Column(
            children: <Widget>[
               SizedBox(height: 10),
              FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    side: BorderSide(color: Colors.transparent)),
                color: Colors.blueGrey,
                textColor: Colors.white,
                padding: EdgeInsets.all(6.0),
                onPressed: () => {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => DuplicateStorePage()))
                },
                child: Text(
                  "Rewards".toUpperCase(),
                  style: TextStyle(
                    fontSize: 11.0,
                  ),
                ),
              )
            ],
          )),
      Container(
          padding: EdgeInsets.fromLTRB(10, 180, 40, 20),
          child: Column(
            children: <Widget>[
               SizedBox(height: 10),
              Text(
                "TOTAL PONTS EARNED",
                style: TextStyle(
                    fontSize: 13,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                   ),
              ),
            ],
          )),
      Container(
          padding: EdgeInsets.fromLTRB(10, 210, 40, 20),
          child: Column(
            children: <Widget>[
               SizedBox(height: 10),
              DatabaseService(uid: LoginPage.user.uid).getPoints(),
            ],
          )),

      Container(
        padding: EdgeInsets.fromLTRB(10, 270, 40, 20),
        
          child: Column(
             children: <Widget>[
        DatabaseService(uid: LoginPage.user.uid).obtainPoints(),

          
         ],),
      ),
      

Positioned(
        top: MediaQuery.of(context).size.height / 2.2,
        child: Container(
          height: MediaQuery.of(context).size.height * 1.5,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(0),
            color: Colors.white,
          ),
        ),
      ),
     
    
Container(
          padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width / 30, MediaQuery.of(context).size.height / 2.099, 15, 10),
         
          child: Row(
            children: <Widget>[
            
        ButtonTheme(
                            minWidth: MediaQuery.of(context).size.width /2,
                            height: MediaQuery.of(context).size.height * .07,
                            child: RaisedButton(
                                elevation: 0.0,
                                shape: new RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(0)),
                              
                                 onPressed: () => {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>FormPage()))
                },
                                child: new Column(
                                  mainAxisSize: MainAxisSize.min,

                                  
                                  children: <Widget>[
                                    
                                  
                                            new Text("Be A Host".toUpperCase(),
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: MediaQuery.of(context).size.width /30,
                                                ))
                                                ,
                                                SizedBox(width: MediaQuery.of(context).size.width*0.18),
                                                new  Icon(Icons.lightbulb_outline,
                                      color: Colors.black,
                                      size: MediaQuery.of(context).size.width*0.066
                                    ),
                                  ],
                                ),
                                textColor: Color(0xFF292929),
                                splashColor: Colors.white,
                                color: Colors.white),
                          ),
                          
              

    
        ButtonTheme(
                            minWidth: MediaQuery.of(context).size.width /2.35,
                            height: MediaQuery.of(context).size.height * .07,
                            child: RaisedButton(
                                elevation: 0.0,
                                shape: new RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(0)),
                              
                                 onPressed: () => {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => ExploreHere()))
                },
                                child: new Column(
                                  mainAxisSize: MainAxisSize.min,

                                  
                                  children: <Widget>[
                                    
                                  
                                            new Text("Explore here".toUpperCase(),
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: MediaQuery.of(context).size.width /30,
                                                ))
                                                ,
                                                SizedBox(width: MediaQuery.of(context).size.width*0.18),
                                                new  Icon(Icons.explore,
                                      color: Colors.black,
                                      size: MediaQuery.of(context).size.width*0.066
                                    ),
                                  ],
                                ),
                                textColor: Color(0xFF292929),
                                splashColor: Colors.white,
                                color: Colors.white),
                          ),
                          
              


              


                      
            ],
          )),
        



        
        Container(
          padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width / 30, MediaQuery.of(context).size.height / 1.75, 15, 10),
         
          child: Column(
            children: <Widget>[
            
        ButtonTheme(
                            minWidth: MediaQuery.of(context).size.width *2,
                            height: MediaQuery.of(context).size.height * .07,
                            child: RaisedButton(
                                elevation: 0.0,
                                shape: new RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(0)),
                              
                                 onPressed: () => {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => HowEarnPoints()))
                },
                                child: new Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    
                                    Padding(
                                        padding: EdgeInsets.only(left: 0.0),
                                        child:
                                            new Text("How To Earn Points".toUpperCase(),
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16,
                                                )))
                                                ,
                                                SizedBox(width: MediaQuery.of(context).size.width*0.3),
                                                new Icon(
                                      FontAwesomeIcons.infoCircle,
                                      color: Colors.black,
                                    ),
                                  ],
                                ),
                                textColor: Color(0xFF292929),
                                color: Colors.grey[100]),
                          ),
                          
                             
                      
            ],
          )),
    
    

    ]))));
  }
}
