import 'package:Cycled_iOS/customWidgets/pie_chart.dart' as third;

import 'package:flutter/material.dart';
import 'package:Cycled_iOS/customWidgets/DailyPollCard.dart' as second;
import 'package:Cycled_iOS/customWidgets/UserCard.dart' as first;

import 'package:intl/intl.dart';
import 'dart:ui';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

var cardAspectRatio = 12.0 / 16.0;
var widgetAspectRatio = cardAspectRatio * 1.2;

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
//  topbar
  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = new TabController(vsync: this, length: 3);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    var timeNow = int.parse(DateFormat('kk').format(now));
    var message = '';
    if (timeNow < 12 || timeNow == 24) {
      message = 'Good Morning';
    } else if ((timeNow >= 12) && (timeNow <= 16)) {
      message = 'Good Afternoon';
    } else {
      message = 'Good Evening';
    }

    return new Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(
          MediaQuery.of(context).size.height / 6.5,
        ),
        child: AppBar(
            title: Container(
              
                child: Column(
                  children: <Widget>[
                    Text(  "\n"+message,
                        style: TextStyle(
                            fontSize: 24.5,
                     
                           fontWeight: FontWeight.bold,
                         
                            color: Colors.black)),
                  ],
                )),
            backgroundColor: Colors.white,
            bottom: new TabBar(
                controller: controller,
                indicator: UnderlineTabIndicator(
                    borderSide: BorderSide(
                  width: 3.0,
                  color: Colors.teal[900],
                )),
                indicatorColor: Colors.transparent,
                labelColor: Color(0xFFC88D67),
                isScrollable: true,
                unselectedLabelColor: Color(0xFFCDCDCD),
                tabs: <Tab>[
                  new Tab(
                      icon: new Text(
                    "Account".toUpperCase(),
                    style: TextStyle(
                      color: Colors.black,
                   
                      fontSize: 12.0,
                    ),
                  )),
                  new Tab(
                      icon: new Text(
                    "Learn & Earn ".toUpperCase(),
                    style: TextStyle(
                     
                      fontSize: 12.0,
                      color: Colors.black,
                    ),
                  )),
                  new Tab(
                      icon: new Text(
                    "Efforts".toUpperCase(),
                    style: TextStyle(
                     
                      fontSize: 12.0,
                      color: Colors.black,
                    ),
                  )),
                ])),
      ),
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (OverscrollIndicatorNotification overscroll) {
          overscroll.disallowGlow();
          return;
        },
        child: new TabBarView(controller: controller, children: <Widget>[
          new first.UserCard(),
          new second.DailyPollCard(),
          new third.Piechart(),
        ]),
      ),
    );
  }
}
