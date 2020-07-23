import 'package:Cycled_iOS/database/DatabaseService.dart';
import 'package:flutter/material.dart';
import '../authentication.dart';
import 'startDiscussion.dart';

class Trending extends StatefulWidget {
  @override
  _TrendingState createState() => new _TrendingState();
}

class _TrendingState extends State<Trending> {
  @override
  Widget build(BuildContext context) {
   return Container(
        child: Container(
            child: Stack(children: <Widget>[
      
           DatabaseService(uid: LoginPage.user.uid).getThreads(),


      Positioned(
        top: MediaQuery.of(context).size.height /1.55,
        left: MediaQuery.of(context).size.width / 1.2,
        //to infinite to align in centre

        height: MediaQuery.of(context).size.height,
        child: Column(children: <Widget>[
          Row(
            children: <Widget>[
              ButtonTheme(
  minWidth:MediaQuery.of(context).size.width/7.5,
  height: MediaQuery.of(context).size.height/10,
  child:
           MaterialButton( 
           
                       color: Colors.teal[200],
                       
                        splashColor: Colors.green[900],
                          child: Column(
                            children: <Widget>[
                              Icon(Icons.add,size:20),
                            
                            ],
                          ),
                 shape :CircleBorder(),
                          onPressed: () {
                            showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return Container(
                                      color: Color(0xFF737373),
                                      child: Container(
                                          child: StartDiscussion(),
                                          decoration: BoxDecoration(
                                              color:
                                                  Theme.of(context).canvasColor,
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(30),
                                                  topRight:
                                                      Radius.circular(30)))));
                                });
                          }))
            ]
          )
        ]
        )
      )

            ]
        )
   ));
  }
}


