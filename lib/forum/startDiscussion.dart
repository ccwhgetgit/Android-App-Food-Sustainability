import 'package:Cycled_iOS/database/DatabaseService.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../authentication.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class StartDiscussion extends StatefulWidget {
  @override
  _StartDiscussionState createState() => new _StartDiscussionState();
}

class _StartDiscussionState extends State<StartDiscussion> {
  TextEditingController titleController = new TextEditingController();
  TextEditingController descController = new TextEditingController();

  Firestore firestore = Firestore.instance;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
            centerTitle: true,
            leading: GestureDetector(
                child: Icon(Icons.close, color: Colors.black),
                onTap: () => Navigator.of(context).pop()),
            backgroundColor: Colors.transparent,
            title:
                Text("New Discussion", style: TextStyle(color: Colors.black))),
        body: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: Column(
              children: <Widget>[
                SizedBox(height: 10),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: TextField(
                        controller: titleController,
                        maxLines: 2,
                        maxLength: 50,
                        decoration: InputDecoration(
                            icon: Icon(Icons.title, color: Colors.black),
                            hintText: "An Interesting Title"))),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: TextField(
                        controller: descController,
                        maxLines: 8,
                        maxLength: 500,
                        decoration: InputDecoration(
                            icon: Icon(Icons.info_outline, color: Colors.black),
                            hintText: "Discussion Content"))),
                SizedBox(height: 20),
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
                                        0.15),
                                child: Icon(Icons.create, color: Colors.white)),
                            SizedBox(width: 10),
                            Text("POST DISCUSSION",
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white)),
                          ],
                        ),
                        onPressed: () {
                          _addPost() ;
                          Navigator.of(context).pop();
                         



                        }))
              ],
            )));
  }



  final String uid;
  _StartDiscussionState({this.uid});
  void _addPost() async {
    
    Text title = Text(titleController.text);

    var titleupload = title.data;

    Text txt2 = Text( descController.text);
   var desc = txt2.data;
   
   int count = 0 ; 
   var counting = count;

    await firestore
        .collection('ForumDatabase')
        .document(titleupload) //based on the uid 
        .setData({
      'author':  LoginPage.user.displayName,
      'date': DateFormat('dd MM yyyy')
                                      .format(DateTime.now())
                                      .toString(),
       'description': desc, 
       'title': titleupload, 
       'postUID':  LoginPage.user.uid,
       'count' : counting,
       //like count
       

    });
    
  }
}



class Reply extends StatefulWidget {
  @override
  _ReplyState createState() => new _ReplyState();
}

class _ReplyState extends State<Reply> {
  TextEditingController replyController = new TextEditingController();

  final String uid;
  _ReplyState({this.uid});
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

                          DatabaseService()
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
