import 'package:flutter/material.dart';
import 'package:Cycled_iOS/customWidgets/UserCard.dart' as first;
import 'dart:ui';

import '../authentication.dart';
import '../customWidgets/pie_chart.dart';
import '../database/DatabaseService.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
//  topbar
  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = new TabController(vsync: this, length: 2);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(
            MediaQuery.of(context).size.height / 6,
          ),
          child: AppBar(
            title: Container(
                child: Column(
              children: <Widget>[
                DatabaseService(uid: LoginPage.user.uid).getName(),
                DatabaseService(uid: LoginPage.user.uid)
                    .homeRefreshPollAttempt(),
                DatabaseService(uid: LoginPage.user.uid)
                    .homeRefreshDisposeAttempt(),
              ],
            )),
            backgroundColor: Colors.blueGrey[50],
            bottom: PreferredSize(
                preferredSize: Size.fromHeight(40),

                ///Note: Here I assigned 40 according to me. You can adjust this size acoording to your purpose.

                child: TabBar(
                    labelPadding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width / 8,
                    ),
                    controller: controller,
                    indicator: UnderlineTabIndicator(
                        insets: EdgeInsets.symmetric(horizontal: 1.0),
                        borderSide: BorderSide(
                          width: 3.0,
                          color: Colors.teal[900],
                        )),
                    indicatorColor: Colors.transparent,
                    labelColor: Color(0xFFC88D67),
                    isScrollable: true,
                    unselectedLabelColor: Color(0xFFCDCDCD),
                    tabs: <Tab>[
                      Tab(
                        child: Text("ACCOUNT",
                            style: TextStyle(
                                color: controller.index == 0
                                    ? Colors.black
                                    : Colors.grey)),
                      ),
                      Tab(
                        child: Text("PROGRESS",
                            style: TextStyle(
                                color: controller.index == 1
                                    ? Colors.black
                                    : Colors.grey)),
                      ),
                    ])),
          )),
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (OverscrollIndicatorNotification overscroll) {
          overscroll.disallowGlow();
          return;
        },
        child: new TabBarView(controller: controller, children: <Widget>[
          new first.UserCard(),
          new Piechart(),
        ]),
      ),
    );
  }
}
