import 'package:Cycled_iOS/authentication.dart';
import 'package:Cycled_iOS/connect/conversationScreen.dart';
import 'package:Cycled_iOS/connect/newMessage.dart';
import 'package:Cycled_iOS/database/DatabaseService.dart';
import 'package:Cycled_iOS/helper/constants.dart';
import 'package:Cycled_iOS/helper/helperFunctions.dart';
import 'package:flutter/material.dart';

class ConnectChat extends StatefulWidget {
  @override
  _ConnectChatState createState() => new _ConnectChatState();
}

class _ConnectChatState extends State<ConnectChat> {
  Stream chatRoomsStream;

  Widget chatRoomList() {
    return StreamBuilder(
        stream: chatRoomsStream,
        builder: (context, snapshot) {
          return snapshot.hasData
              ? ListView.builder(
                  itemCount: snapshot.data.documents.length,
                  itemBuilder: (context, index) {
                    return ChatRoomsTile(
                        snapshot.data.documents[index].data["chatRoomUID"]
                            .toString()
                            .replaceAll("_", "")
                            .replaceAll(Constants.myName, ""),
                        snapshot.data.documents[index].data["chatRoomUID"]);
                  },
                )
              : Container();
        });
  }

  @override
  void initState() {
    getUserInfo();

    super.initState();
  }

  getUserInfo() async {
    Constants.myName = await HelperFunctions.getUserNameSharedPreference();
    DatabaseService(uid: LoginPage.user.uid)
        .getChatRooms(Constants.myName)
        .then((val) {
      setState(() {
        chatRoomsStream = val;
      });
    });
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Container(
            child: Stack(children: <Widget>[
      chatRoomList(),
      Positioned(
          top: MediaQuery.of(context).size.height / 1.55,
          left: MediaQuery.of(context).size.width / 1.2,
          height: MediaQuery.of(context).size.height,
          child: Column(children: <Widget>[
            Row(children: <Widget>[
              ButtonTheme(
                  minWidth: MediaQuery.of(context).size.width / 7.5,
                  height: MediaQuery.of(context).size.height / 10,
                  child: MaterialButton(
                      color: Colors.teal[200],
                      splashColor: Colors.green[900],
                      child: Column(
                        children: <Widget>[
                          Icon(Icons.add, size: 20),
                        ],
                      ),
                      shape: CircleBorder(),
                      onPressed: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return Container(
                                  color: Color(0xFF737373),
                                  child: Container(
                                      child: NewMessage(),
                                      decoration: BoxDecoration(
                                          color: Theme.of(context).canvasColor,
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(30),
                                              topRight: Radius.circular(30)))));
                            });
                      }))
            ])
          ]))
    ])));
  }
}

class ChatRoomsTile extends StatelessWidget {
  final String name;
  final String chatRoomUID;

  ChatRoomsTile(this.name, this.chatRoomUID);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ConversationScreen(chatRoomUID)));
        },
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: Text("Conversations", style: TextStyle(fontSize: 20)),
            ),
            Container(
                color: Colors.blueGrey,
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                child: Row(
                  children: <Widget>[
                    Container(
                        height: 40,
                        width: 40,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            color: Colors.blue),
                        child: Text("${name.substring(0, 1).toUpperCase()}",
                            style: TextStyle(color: Colors.white))),
                    SizedBox(width: 8),
                    Text(name, style: TextStyle(color: Colors.white)),
                  ],
                ))
          ],
        ));
  }
}
