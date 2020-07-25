import 'package:Cycled_iOS/database/DatabaseService.dart';
import 'package:Cycled_iOS/helper/constants.dart';
import 'package:flutter/material.dart';

import '../authentication.dart';

class ConversationScreen extends StatefulWidget {
  final String chatRoomUID;
  ConversationScreen(this.chatRoomUID);

  @override
  _ConversationScreenState createState() => new _ConversationScreenState();
}

class _ConversationScreenState extends State<ConversationScreen> {
  TextEditingController messageController = new TextEditingController();
  Stream chatMessagesStream;

  @override
  void initState() {
    super.initState();
    DatabaseService(uid: LoginPage.user.uid)
        .getConversationMessages(widget.chatRoomUID)
        .then((val) {
      setState(() {
        chatMessagesStream = val;
      });
    });
  }

  Widget chatMessageList() {
    return StreamBuilder(
      stream: chatMessagesStream,
      builder: (context, snapshot) {
        return snapshot.hasData
            ? ListView.builder(
                itemCount: snapshot.data.documents.length,
                itemBuilder: (context, index) {
                  return MessageTile(
                      snapshot.data.documents[index].data["message"],
                      snapshot.data.documents[index].data["sendBy"] ==
                          LoginPage.user.displayName);
                },
              )
            : Container();
      },
    );
  }

  sendMessage() {
    if (messageController.text.isNotEmpty) {
      Map<String, dynamic> messageMap = {
        "message": messageController.text,
        "sendBy": LoginPage.user.displayName,
        "time": DateTime.now().millisecondsSinceEpoch
      };

      DatabaseService(uid: LoginPage.user.uid)
          .addConversationMessages(widget.chatRoomUID, messageMap);
      messageController.text = "";
    }
  }

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
            chatMessageList(),
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
                            onTap: () => sendMessage(),
                            child: Icon(Icons.send))),
                  ],
                )),
          ],
        )));
  }
}

class MessageTile extends StatelessWidget {
  final String message;
  final bool isSendByMe;
  MessageTile(this.message, this.isSendByMe);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(
            left: isSendByMe ? 0 : 24, right: isSendByMe ? 24 : 0),
        margin: EdgeInsets.symmetric(vertical: 8),
        width: MediaQuery.of(context).size.width,
        alignment: isSendByMe ? Alignment.centerRight : Alignment.centerLeft,
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: isSendByMe
                        ? [const Color(0xFF007EF4), const Color(0xFF024e96)]
                        : [const Color(0xFF495363), const Color(0xFF6d7c94)]),
                borderRadius: isSendByMe
                    ? BorderRadius.only(
                        topLeft: Radius.circular(23),
                        topRight: Radius.circular(23),
                        bottomLeft: Radius.circular(23))
                    : BorderRadius.only(
                        topLeft: Radius.circular(23),
                        topRight: Radius.circular(23),
                        bottomRight: Radius.circular(23))),
            child: Text(message,
                style: TextStyle(color: Colors.white, fontSize: 17))));
  }
}
