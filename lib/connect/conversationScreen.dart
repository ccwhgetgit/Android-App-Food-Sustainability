import 'package:Cycled_iOS/database/DatabaseService.dart';
import 'package:flutter/material.dart';

import '../authentication.dart';

class ConversationScreen extends StatefulWidget {
  final String chatRoomUID;
  ConversationScreen(this.chatRoomUID);

  @override
  _ConversationScreenState createState() => new _ConversationScreenState();
}

class _ConversationScreenState extends State<ConversationScreen> {
  //Widget ChatMessageList() {}

  TextEditingController messageController = new TextEditingController();

  /*sendMessage() {
    if (messageController.text.isNotEmpty)
      Map<String, String> messageMap = {
        "message": messageController.text,
        "sendBy": LoginPage.user,
      };
    DatabaseService(uid: LoginPage.user.uid).getConversationMessages(
      widget.chatRoomUID,
    );
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: GestureDetector(
                child: Icon(Icons.arrow_back, color: Colors.black),
                onTap: () => Navigator.of(context).pop()),
            backgroundColor: Colors.transparent,
            centerTitle: true,
            title: Text("Conversation", style: TextStyle(color: Colors.black))),
        body: Container(
            child: Stack(
          children: <Widget>[
            Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                alignment: Alignment.bottomCenter,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                          padding: EdgeInsets.only(right: 10.0),
                          child: TextField(
                              controller: messageController,
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.black, width: 2.0),
                                  ),
                                  hintText: "Message"))),
                    ),
                    Padding(
                        padding: EdgeInsets.only(left: 5.0),
                        child: GestureDetector(
                            onTap: () {}, child: Icon(Icons.send))),
                  ],
                )),
          ],
        )));
  }
}
