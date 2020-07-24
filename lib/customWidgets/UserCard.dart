
import 'package:Cycled_iOS/database/DatabaseService.dart';
import 'package:Cycled_iOS/tabs/duplicatestorePage.dart';
import 'package:flutter/material.dart';
import '../authentication.dart';
import '../tabs/disposePage.dart';
import 'DailyPollCard.dart';

class UserCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container( 
            child:  Stack(
              children:<Widget>[  
              Positioned(
                child: Container(
                  height: MediaQuery.of(context).size.height * 3,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/member.png"), 
                 colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.25), BlendMode.dstATop),
             
             fit: BoxFit.fitWidth            )),
       
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
                      DatabaseService(uid: LoginPage.user.uid)
                          .getMemberTokens('usercard'),
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
                                  builder: (BuildContext context) =>
                                      DuplicateStorePage()))
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
                  ],
                ),
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
                  padding: EdgeInsets.fromLTRB( MediaQuery.of(context).size.width * 0.04,  MediaQuery.of(context).size.height * 0.46,  MediaQuery.of(context).size.width * 0.04, 20),
              child: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(10),
          crossAxisSpacing: MediaQuery.of(context).size.width * 0.03,
          mainAxisSpacing:  MediaQuery.of(context).size.width * 0.03,
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
          width: 200,
          height: 200,
            decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/knowledgepic.png"), 
                 colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.3), BlendMode.dstATop),
             
             fit: BoxFit.cover)),
          child: Column(
            children:<Widget>[
              

             DatabaseService(uid: LoginPage.user.uid).obtainPollGraph(),
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
          "  Knowledge", style: TextStyle(color:Colors.black, fontWeight: FontWeight.bold, fontSize: MediaQuery.of(context).size.width * 0.048),
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
                  builder: (context) => DisposePage(),
                  ),
            );
          },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30.0),
          child: Container(
              decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/disposalpic.png"), 
                 colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.25), BlendMode.dstATop),
             
             fit: BoxFit.cover)),
       
          width: 200,
          height: 200,
          child: Column(
            children:<Widget>[
              

             DatabaseService(uid: LoginPage.user.uid).obtainDisposalGraph(),
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
          "  Disposal", style: TextStyle(color:Colors.black, fontWeight: FontWeight.bold, fontSize: MediaQuery.of(context).size.width * 0.048),
         ),
         ]),
      ),
    ),


            ]),
  ),
  
        ),     
    ),
      


             ]),)
            ]));
  }
}


/*

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
              

             DatabaseService(uid: LoginPage.user.uid).obtainPollGraph(),
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
              

             DatabaseService(uid: LoginPage.user.uid).obtainDisposalGraph(),
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
      


             ]),
              ]
            )
                  ),

                  
*/