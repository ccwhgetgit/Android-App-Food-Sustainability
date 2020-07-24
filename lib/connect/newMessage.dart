import 'package:Cycled_iOS/connect/conversationScreen.dart';
import 'package:Cycled_iOS/database/DatabaseService.dart';
import 'package:Cycled_iOS/helper/constants.dart';
import 'package:Cycled_iOS/helper/helperFunctions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../authentication.dart';

class NewMessage extends StatefulWidget {
  @override
  _NewMessageState createState() => new _NewMessageState();
}

String _myName;

class _NewMessageState extends State<NewMessage> {
  TextEditingController searchController = new TextEditingController();
  QuerySnapshot searchSnapshot;

  @override
  void initState() {
    getUserInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
            leading: GestureDetector(
                child: Icon(Icons.arrow_back, color: Colors.black),
                onTap: () => Navigator.of(context).pop()),
            backgroundColor: Colors.transparent,
            centerTitle: true,
            title: Text("New Message", style: TextStyle(color: Colors.black))),
        body: Container(
          child: Column(
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
                                controller: searchController,
                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.black, width: 2.0),
                                    ),
                                    hintText: "Search User by Email or Name"))),
                      ),
                      Padding(
                          padding: EdgeInsets.only(left: 5.0),
                          child: GestureDetector(
                              onTap: () {
                                initiateSearch();
                              },
                              child: Icon(Icons.search))),
                    ],
                  )),
              searchList(),
            ],
          ),
        ));
  }

  createChatRoom({String name}) {
    if (name != _myName) {
      String chatRoomUID = getChatRoomUID(name, _myName);

      List<String> users = [name, _myName];

      Map<String, dynamic> chatRoomMap = {
        "users": users,
        "chatRoomUID": chatRoomUID,
      };

      DatabaseService(uid: LoginPage.user.uid)
          .createChatRoom(chatRoomUID, chatRoomMap);

      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ConversationScreen(chatRoomUID)));
    } else {
      print("You cannot send message to yourself");
    }
  }

  Widget searchTile({String name, String email}) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(name, style: TextStyle(fontSize: 20)),
                    Text(email),
                  ],
                ),
                Spacer(),
                Container(
                    decoration: BoxDecoration(
                        color: Colors.teal[200],
                        borderRadius: BorderRadius.circular(30)),
                    child: FlatButton(
                      child: Text("Chat"),
                      onPressed: () {
                        createChatRoom(name: name);
                      },
                    )),
              ],
            )
          ],
        ));
  }

  getUserInfo() async {
    setState(() {});
    _myName = await HelperFunctions.getUserNameSharedPreference();
    Constants.myName = _myName;
  }

  initiateSearch() {
    DatabaseService(uid: LoginPage.user.uid)
        .getUserByEmail(searchController.text)
        .then((data) {
      setState(() {
        searchSnapshot = data;
      });
    });
    DatabaseService(uid: LoginPage.user.uid)
        .getUserByName(searchController.text)
        .then((data) {
      setState(() {
        searchSnapshot = data;
      });
    });
  }

  Widget searchList() {
    return searchSnapshot != null
        ? Container(
            child: Column(
            children: <Widget>[
              SizedBox(height: 20),
              Text("Search Results", style: TextStyle(fontSize: 15)),
              SizedBox(height: 20),
              ListView.builder(
                  itemCount: searchSnapshot.documents.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return searchTile(
                      name: searchSnapshot.documents[index].data["name"],
                      email: searchSnapshot.documents[index].data["email"],
                    );
                  })
            ],
          ))
        : Container();
  }
}

getChatRoomUID(String a, String b) {
  if (a.compareTo(b) > 0) {
    return "$b\_$a";
  } else {
    return "$a\_$b";
  }
}
