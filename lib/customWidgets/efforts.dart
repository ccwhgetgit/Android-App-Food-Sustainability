
import 'package:Cycled_iOS/database/DatabaseService.dart';
import 'package:Cycled_iOS/tabs/disposePage.dart';


import 'package:flutter/material.dart';

import 'dart:ui';

import '../authentication.dart';

const kTextColor = Color(0xFF1E2432);
const kTextMediumColor = Color(0xFF53627C);
const kTextLightColor = Color(0xFFACB1C0);
const kPrimaryColor = Color(0xFF0D8E53);
const kBackgroundColor = Color(0xFFFCFCFC);
const kInactiveChartColor = Color(0xFFEAECEF);

class Efforts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
//wrap singlechildscrollview for correct displaying in small density devices
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Positioned(
                top: MediaQuery.of(context).size.height / 2.3,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Text(
                  "            ",
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'SFProText'),
                )),
            Positioned(
              top: MediaQuery.of(context).size.height / 2.3,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Row(
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "  Recycling Journey\n",
                          style: TextStyle(
                            fontSize: 28,
                            color: Colors.black,
                          ),
                        ),
                       
                        TextSpan(
                          text: "    Every little effort counts\n    This contributes to: ",
                          style: TextStyle(
                            color: Colors.grey[600],
                          ),
                        ),
                        
                      ],
                    ),
                  ),
 
                ],
              ),
            ),
            Container(
              padding:
                  EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 20),
              width: double.infinity,
              decoration: BoxDecoration(
                image: new DecorationImage(
                  colorFilter: new ColorFilter.mode(
                      Colors.black.withOpacity(0.12), BlendMode.dstATop),
                  image: AssetImage("assets/images/efforts.png"),
                  fit: BoxFit.fill,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
              ),
              child: Wrap(
                runSpacing: 20,
                spacing: 20,
                children: <Widget>[
                  LayoutBuilder(
                    builder: (context, constraints) {
                      return GestureDetector(
                          child: Container(
                              width: constraints.maxWidth / 2 - 10,
                              // Here constraints.maxWidth provide us the available width for the widget
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(18),
                              ),
                              child: Column(
                                children: <Widget>[
                                  // wrapped within an expanded widget to allow for small density device
                                  Text(
                                    "",
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.black,
                                        fontFamily: 'SFProText'),
                                  ),

                                  // wrapped within an expanded widget to allow for small density device
                                  Row(
                                    children: <Widget>[
                                      Container(
                                        padding: EdgeInsets.all(6),
                                        height: 55,
                                        width: 55,
                                        child: CircleAvatar(
                                          radius: 1072.0,
                                          backgroundColor: Colors.transparent,
                                          backgroundImage: AssetImage(
                                              'assets/images/factory.png'),
                                        ),
                                      ),
                                      Text(
                                        "Electricity".toUpperCase(),
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
  Text(
                                    "",
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.black,
                                        fontFamily: 'SFProText'),
                                  ),
                                 
                                  DatabaseService(uid: LoginPage.user.uid)
                                      .getEnergy(),
                                  Text(
                                    "",
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.black,
                                        fontFamily: 'SFProText'),
                                  ),
                                  Text(
                                    "KILOJOULES",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text("OF ENERGY CONSERVED",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.black,
                                      )),

                                  Text(
                                    "",
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.black,
                                        fontFamily: 'SFProText'),
                                  ),
                                ],
                              )));
                    },
                  ),
                  LayoutBuilder(
                    builder: (context, constraints) {
                      return GestureDetector(
                          child: Container(
                              width: constraints.maxWidth / 2 - 10,
                              // Here constraints.maxWidth provide us the available width for the widget
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(18),
                              ),
                              child: Column(
                                children: <Widget>[
                                  // wrapped within an expanded widget to allow for small density device
                                  Text(
                                    "",
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.black,
                                        fontFamily: 'SFProText'),
                                  ),

                                  // wrapped within an expanded widget to allow for small density device
                                  Row(
                                    children: <Widget>[
                                      Container(
                                        padding: EdgeInsets.all(6),
                                        height: 55,
                                        width: 55,
                                        child: CircleAvatar(
                                          radius: 1072.0,
                                          backgroundColor: Colors.transparent,
                                          backgroundImage: AssetImage(
                                              'assets/images/rice.png'),
                                        ),
                                      ),
                                      Text(
                                        "Food saved".toUpperCase(),
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),

                                  Text(
                                    "",
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.black,
                                        fontFamily: 'SFProText'),
                                  ),
                                  DatabaseService(uid: LoginPage.user.uid)
                                      .getServings(),
                                  Text(
                                    "",
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.black,
                                        fontFamily: 'SFProText'),
                                  ),
                                  Text(
                                    "SERVINGS",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text("OF FOOD SAVED",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.black,
                                      )),

                                  Text(
                                    "",
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.black,
                                        fontFamily: 'SFProText'),
                                  ),
                                ],
                              )));
                    },
                  ),
                  LayoutBuilder(
                    builder: (context, constraints) {
                      return GestureDetector(
                          child: Container(
                              width: constraints.maxWidth / 2 - 10,
                              // Here constraints.maxWidth provide us the available width for the widget
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    "",
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.black,
                                        fontFamily: 'SFProText'),
                                  ),

                                  // wrapped within an expanded widget to allow for small density device
                                  Row(
                                    children: <Widget>[
                                      Container(
                                        padding: EdgeInsets.all(6),
                                        height: 55,
                                        width: 55,
                                        child: CircleAvatar(
                                          radius: 1072.0,
                                          backgroundColor: Colors.transparent,
                                          backgroundImage: AssetImage(
                                              'assets/images/plant.png'),
                                        ),
                                      ),
                                      Text(
                                        "agriculture".toUpperCase(),
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),

                                  Text(
                                    "",
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.black,
                                        fontFamily: 'SFProText'),
                                  ),
                                  DatabaseService(uid: LoginPage.user.uid)
                                      .getFertlisers(),
                                  Text(
                                    "",
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.black,
                                        fontFamily: 'SFProText'),
                                  ),
                                  Text(
                                    "GRAMS",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text("OF FERTILIZERS PRODUCED",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.black,
                                      )),
                                  Text(
                                    "",
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.black,
                                        fontFamily: 'SFProText'),
                                  ),
                                ],
                              )));
                    },
                  ),
                  LayoutBuilder(
                    builder: (context, constraints) {
                      return GestureDetector(
                          child: Container(
                              width: constraints.maxWidth / 2 - 10,
                              // Here constraints.maxWidth provide us the available width for the widget
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18),
                              ),
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    "\n\n' Food LEFT is \nFood Waste '",
                                    textAlign: TextAlign.center,
                                    style:
                                        TextStyle(fontStyle: FontStyle.italic),
                                  ),
                                  RaisedButton(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(18.0),
                                        side: BorderSide(
                                            color: Colors.transparent)),
                                    onPressed: () => {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  DisposePage()))
                                    },
                                    color: Colors.green[400],
                                    textColor: Colors.white,
                                    child: Text("Start Recycling".toUpperCase(),
                                        style: TextStyle(fontSize: 14)),
                                  ),
                                ],
                              )));
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
           
                    Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
             
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center ,
                  children: <Widget>[
                     Center(
                     
          child: Text(
            'Know the Goodness of Recycling. ',
            textAlign: TextAlign.center,
            style: TextStyle(
                            color: kTextLightColor,
                            fontSize: 15)
          ),
        ),
                   Center(
                     
          child: Text(
            'It Starts From You',
            textAlign: TextAlign.center,
            style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'SFProText'),
          ),
        ),


 Center(
          child: Text(
            'Save the Environment',
            textAlign: TextAlign.center,
               style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      
                      fontFamily: 'SFProText'),
          ),
        ),



                    SizedBox(height: 40),
                  ],
                ),
              
            )
          ],
        ),
      ),
    );
  }
}
