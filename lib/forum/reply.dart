import 'package:Cycled_iOS/database/DatabaseService.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../authentication.dart';

class Reply extends StatefulWidget {
  @override
  _ReplyState createState() => new _ReplyState();
}

class _ReplyState extends State<Reply> {
  TextEditingController replyController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
            centerTitle: true,
            leading: GestureDetector(
                child: Icon(Icons.close, color: Colors.black),
                onTap: () => Navigator.of(context).pop()),
            backgroundColor: Colors.transparent,
            title: Text("Reply Thread", style: TextStyle(color: Colors.black))),
        body: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: Column(
              children: <Widget>[
                SizedBox(height: 10),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: TextField(
                        controller: replyController,
                        maxLines: 8,
                        maxLength: 200,
                        decoration: InputDecoration(
                            icon: Icon(Icons.reply, color: Colors.black),
                            hintText: "Your Reply"))),
                SizedBox(height: 100),
                SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.width * 0.12,
                    child: RaisedButton(
                        color: Colors.blueGrey[700],
                        child: Row(
                          children: <Widget>[
                            Padding(
                                padding: EdgeInsets.only(
                                    left: MediaQuery.of(context).size.width *
                                        0.19),
                                child: Icon(Icons.send, color: Colors.white)),
                            SizedBox(width: 10),
                            Text("CONFIRM REPLY",
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white)),
                          ],
                        ),
                        onPressed: () {
                          DatabaseService(uid: LoginPage.user.uid)
                              .updateThreadReplies(
                            DatabaseServicee.postUID,
                            LoginPage.user.displayName,
                            DateFormat('dd-MM-yyyy @ kk:mm')
                                .format(DateTime.now())
                                .toString(),
                            replyController.text,
                          );
                          Navigator.of(context).pop();
                          Scaffold.of(context).showSnackBar(
                              SnackBar(content: Text("Successfully Posted!")));
                        }))
              ],
            )));
  }
}
