import 'package:flutter/material.dart';
import 'package:Cycled_iOS/connect/connectForum.dart';
import 'package:Cycled_iOS/connect/connectChat.dart';

class ConnectPage extends StatefulWidget {
  @override
  _ConnectPageState createState() => new _ConnectPageState();
}

class _ConnectPageState extends State<ConnectPage>
    with TickerProviderStateMixin {
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
            MediaQuery.of(context).size.height / 7.5,
          ),
          child: AppBar(
              centerTitle: true,
              backgroundColor: Colors.white,
              title:
                  Text("Cycled Connect", style: TextStyle(color: Colors.black)),
              actions: <Widget>[
                Padding(
                    padding: EdgeInsets.only(right: 20.0),
                    child: GestureDetector(
                        child: Icon(Icons.notifications, color: Colors.black),
                        onTap: () {}))
              ],
              bottom: TabBar(
                  labelPadding: EdgeInsets.symmetric(horizontal: 80.0),
                  controller: controller,
                  indicator: UnderlineTabIndicator(
                      insets: EdgeInsets.symmetric(horizontal: 10.0),
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
                      "Forum".toUpperCase(),
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12.0,
                      ),
                    )),
                    new Tab(
                        icon: new Text(
                      "Chat".toUpperCase(),
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Colors.black,
                      ),
                    )),
                  ]))),
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (OverscrollIndicatorNotification overscroll) {
          overscroll.disallowGlow();
          return;
        },
        child: new TabBarView(controller: controller, children: <Widget>[
          new ConnectForum(),
          new ConnectChat(),
        ]),
      ),
    );
  }
}
