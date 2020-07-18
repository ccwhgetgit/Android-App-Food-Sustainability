import 'package:Cycled_iOS/database/DatabaseService.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

import '../authentication.dart'; // import the package


class Piechart extends StatefulWidget {
   Piechart({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Piechart> {
  Map<String, double> data = new Map();

  @override
  void initState() {
    data.addAll({
      'Food': 1,
      'Electricity': 2,
      'Fertilisers': 3,
     
    });
    super.initState();
  }



  List<Color> _colors = [
     Colors.teal[100],
   Colors.green[200],

   Colors.grey[600],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            
            SizedBox(height:10),
           Align(
                alignment: Alignment.centerLeft,
            child: Text( "  Recycling Journey",
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.black,
                          ),
                        ),
                       
                   
           ), 
           SizedBox(height:5),
  Align(
                alignment: Alignment.centerLeft,
            child: 
             Text( "    Every little effort counts\n    1 serving of food recycled contributes to:\n ",
                          style: TextStyle(
                            color: Colors.grey[600],
                             fontSize: 13,
                          ),
                        ),
  ),
           
     
            Row(
          children: <Widget>[
              SizedBox(
              width: 7,
            ),
            PieChart(
                dataMap: data,
                colorList:
                    _colors, // if not declared, random colors will be chosen
                animationDuration: Duration(milliseconds: 5000),
                chartLegendSpacing: 2.0,
                chartRadius: MediaQuery.of(context).size.width /
                    2.5,
                     //determines the size of the chart
                showChartValuesInPercentage: true,
                showChartValues: true,
                showChartValuesOutside: false,
                chartValueBackgroundColor: Colors.white,
                showLegends: false,
               
                showChartValueLabel: true,
                initialAngle: 180,
              
                chartValueStyle: defaultChartValueStyle.copyWith(
                  color: Colors.black.withOpacity(0.9),
                ),
                chartType: ChartType.ring, //can be changed to ChartType.ring
          
       ),
  SizedBox(
              width: MediaQuery.of(context).size.width /30,
            ),
              Column(children: <Widget>[
               

              Image.asset('assets/images/Legend.png',  height: MediaQuery.of(context).size.height /5,
    width:MediaQuery.of(context).size.width /1.97,),




              ]),

          
          ]),

SizedBox(height:MediaQuery.of(context).size.height /28),
           Align(
                alignment: Alignment.centerLeft,
            child: 
             Text( "    //will research and dupdate exaxt stats. outline is this  \n ",
                          style: TextStyle(
                            color: Colors.grey[600],
                             fontSize: 13,
                          ),
                        ),
  ),



   Container(
              padding:
                  EdgeInsets.only( top: MediaQuery.of(context).size.height /90, bottom: MediaQuery.of(context).size.height /5, left: 5,),
              width: double.infinity,
                child: Row(
                  children: <Widget>[
               
Container(
                             
                              // Here constraints.maxWidth provide us the available width for the widget
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(18),
                                
                              ),
                              child: Column(
                                children: <Widget>[
                                  // wrapped within an expanded widget to allow for small density device
                                  
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
                                        "Energy".toUpperCase(),
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),

                                        SizedBox(width: MediaQuery.of(context).size.width /50),
                                    ],
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
                                      fontSize: 14,
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
                              )),

                              SizedBox(width: MediaQuery.of(context).size.width /30),
                             
                             
                             
                              Container(
                            
                              // Here constraints.maxWidth provide us the available width for the widget
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Column(
                                children: <Widget>[
                                

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
                                        "FARMS".toUpperCase(),
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                        SizedBox(width: MediaQuery.of(context).size.width /50),
                      
                                    ],
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
                                      fontSize: 13,
                                      color: Colors.black,
                                    ),
                                  ),
                                 
                                  Text("OF FERTILIZERS",
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
                              )),
                              SizedBox(width: MediaQuery.of(context).size.width /30),
                             
                             
                             
                              Container(
                            
                              // Here constraints.maxWidth provide us the available width for the widget
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Column(
                                children: <Widget>[
                                

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
                                      "  land ".toUpperCase(),
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                        SizedBox(width: MediaQuery.of(context).size.width /50),
                      
                                    ],
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
                                      fontSize: 14,
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
                              ))


                              /*
 Container(
                             
                              // Here constraints.maxWidth provide us the available width for the widget
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(18),
                              ),
                              child: Column(
                                children: <Widget>[
                                  // wrapped within an expanded widget to allow for small density device
                                  

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
                                        "Foodies".toUpperCase(),
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),

                                        SizedBox(width: MediaQuery.of(context).size.width /50),
                                    ],
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
                                      fontSize: 14,
                                      color: Colors.black,
                                    ),
                                  ),
                                 

                                  Text(
                                    "",
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.black,
                                        fontFamily: 'SFProText'),
                                  ),
                                ],
                              )), 

                              */
                  ]
                )
                

            ),
            SizedBox(height:MediaQuery.of(context).size.height /13),
          ],
        ),
      ),
    );
  }
}





/*

               Container(
              padding:
                  EdgeInsets.only( top: MediaQuery.of(context).size.height /16, bottom: MediaQuery.of(context).size.height /5, right: 5,),
              width: double.infinity,
                child: Row(
                  children: <Widget>[
               
Container(
                             
                              // Here constraints.maxWidth provide us the available width for the widget
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(18),
                              ),
                              child: Column(
                                children: <Widget>[
                                  // wrapped within an expanded widget to allow for small density device
                                  
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
                                          fontSize: 13,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
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
                                      fontSize: 14,
                                      color: Colors.black,
                                    ),
                                  ),
                                  

                                
                                ],
                              )),
                              Container(
                             
                              // Here constraints.maxWidth provide us the available width for the widget
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(18),
                              ),
                              child: Column(
                                children: <Widget>[
                                  // wrapped within an expanded widget to allow for small density device
                                  

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
                                          fontSize: 13,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
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
                                      fontSize: 14,
                                      color: Colors.black,
                                    ),
                                  ),
                                 

                                  Text(
                                    "",
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.black,
                                        fontFamily: 'SFProText'),
                                  ),
                                ],
                              )), 
                              Container(
                            
                              // Here constraints.maxWidth provide us the available width for the widget
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Column(
                                children: <Widget>[
                                

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
                                      fontSize: 13,
                                      color: Colors.black,
                                    ),
                                  ),
                                 
                                 
                                ],
                              ))
                  ]
                )
                

            ),
*/