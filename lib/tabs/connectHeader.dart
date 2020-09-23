import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ConnectHeader extends StatefulWidget {
  @override
  _ConnectHeaderState createState() => new _ConnectHeaderState();
}

class _ConnectHeaderState extends State<ConnectHeader> {
  Widget _buildListItem(BuildContext context, DocumentSnapshot document) {
    return Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.01,
        ),
        child: Container(
            width: MediaQuery.of(context).size.width * 0.63,
            child: Card(
                child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.02,
                  vertical: MediaQuery.of(context).size.height * 0.00003),
              child: Stack(
                children: <Widget>[
                  Container(
                      child: Container(
                          //    padding: EdgeInsets.fromLTRB(0, 0, 0, 30),

                          height: MediaQuery.of(context).size.width * 0.49,
                          width: MediaQuery.of(context).size.width * 0.49,
                          //  child: Image.network(document['image']),
                          child: Image.network(
                            document['image'],
                            color: Color.fromRGBO(255, 255, 255, 0.3),
                            colorBlendMode: BlendMode.modulate,
                            fit: BoxFit.cover,
                          ))),
                  Column(
                    children: <Widget>[
                      Text(document['title'].toString(),
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.032)),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02),
                      Text(document['Description'].toString(),
                          style: TextStyle(
                              color: Colors.black,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.034)),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.028),
                      Expanded(
                        child: Row(children: <Widget>[
                          document['date'] != null
                              ? Text("Date: " + document['date'].toString(),
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.018))
                              : Text(""),
                        ]),
                      ),
                      Expanded(
                        child: Row(children: <Widget>[
                          Expanded(
                            child: document['venue'] != null
                                ? Text("Venue: " + document['venue'].toString(),
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                0.018))
                                : Text(""),
                          ),
                        ]),
                      )
                    ],
                  ),
                ],
              ),
            ))));
  }

  @override
  Widget build(BuildContext build) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.2,
      child: Column(
        children: <Widget>[
          /*
    
    consider adding something at the top 
             */
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (OverscrollIndicatorNotification overscroll) {
              overscroll.disallowGlow();
              return;
            },
            child: Flexible(
              fit: FlexFit.tight,
              child: StreamBuilder(
                  stream:
                      Firestore.instance.collection('NewsDatabase').snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) return Container();
                    return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data.documents.length,
                        itemBuilder: (context, index) => _buildListItem(
                            context, snapshot.data.documents[index]));
                  }),
            ),
          ),
        ],
      ),
    );
  }
}

/*
        Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(
                      image: AssetImage("assets/images/earth.gif"),
                      colorFilter: new ColorFilter.mode(
                          Colors.blueGrey.withOpacity(0.3), BlendMode.dstATop),
                      fit: BoxFit.fitWidth)),
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height / 100,
                bottom: MediaQuery.of(context).size.height / 5,
                left: 8,
              ),
              width: double.infinity,
              child: Column(children: <Widget>[
                Row(children: <Widget>[
                  Container(

                      // Here constraints.maxWidth provide us the available width for the widget
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        children: <Widget>[
                          // wrapped within an expanded widget to allow for small density device

                          // wrapped within an expanded widget to allow for small density device
                          Row(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(6),
                                height: MediaQuery.of(context).size.width / 7.5,
                                width: MediaQuery.of(context).size.width / 7.5,
                                child: CircleAvatar(
                                  radius: 1072.0,
                                  backgroundColor: Colors.transparent,
                                  backgroundImage: AssetImage(
                                    'assets/images/factory.png',
                                  ),
                                ),
                              ),
                              Text(
                                "Energy ".toUpperCase(),
                                style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width / 30,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width / 50),
                            ],
                          ),

                          DatabaseService(uid: LoginPage.user.uid).getEnergy(),
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
                              fontSize: MediaQuery.of(context).size.width / 30,
                              color: Colors.black,
                            ),
                          ),

                          Text(" OF ENERGY ",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width / 40,
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
                  SizedBox(width: MediaQuery.of(context).size.width / 40),
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
                                height: MediaQuery.of(context).size.width / 7.5,
                                width: MediaQuery.of(context).size.width / 7.5,
                                child: CircleAvatar(
                                  radius: 1072.0,
                                  backgroundColor: Colors.transparent,
                                  backgroundImage:
                                      AssetImage('assets/images/plant.png'),
                                ),
                              ),
                              Text(
                                "FARMS   ".toUpperCase(),
                                style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width / 30,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width / 50),
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
                              fontSize: MediaQuery.of(context).size.width / 30,
                              color: Colors.black,
                            ),
                          ),

                          Text("OF FERTILIZERS",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width / 40,
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
                  SizedBox(width: MediaQuery.of(context).size.width / 40),
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
                                height: MediaQuery.of(context).size.width / 8,
                                width: MediaQuery.of(context).size.width / 8,
                                child: CircleAvatar(
                                  radius: 1072.0,
                                  backgroundColor: Colors.transparent,
                                  backgroundImage:
                                      AssetImage('assets/images/rice.png'),
                                ),
                              ),
                              Text(
                                "Carbon".toUpperCase(),
                                style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width / 30,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width / 50),
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
                            "GRAMS",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                            ),
                          ),

                          Text("OF GHG SAVED",
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
                ]),
                SizedBox(height: MediaQuery.of(context).size.height / 17),
              ]),
            )
                ]
                )
                ))))
                */
