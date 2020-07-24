import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'dart:io';

import '../authentication.dart';

class StartDiscussion extends StatefulWidget {
  @override
  _StartDiscussionState createState() => _StartDiscussionState();
}

class _StartDiscussionState extends State<StartDiscussion> {
  TextEditingController titleController = new TextEditingController();
  TextEditingController descController = new TextEditingController();

  final String uid;
  _StartDiscussionState({this.uid});

  File imageURI;

  Firestore firestore = Firestore.instance;

  Future getImageFromCamera() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      imageURI = image;
    });
  }

  Future getImageFromGallery() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      imageURI = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(
              LineAwesomeIcons.arrow_left,
              color: Colors.black,
            ),
            onPressed: () => Navigator.of(context).pop()),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text('Create Post',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 23,
              color: Colors.black,
            )),
      ),
      floatingActionButton: FloatingActionButton.extended(
          elevation: 4.0,
          backgroundColor: Colors.blueGrey,
          icon: const Icon(Icons.create),
          label: const Text('Share It!'),
          onPressed: () {
            _addPost();
            //uploadPic(context);
            Navigator.of(context).pop();
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        child: new Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              RaisedButton(
                onPressed: () => getImageFromGallery(),
                color: Colors.transparent,
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.photo_album,
                      size: 30,
                      color: Colors.green[700],
                    ),
                  ],
                ),
              ),
              RaisedButton(
                onPressed: () => getImageFromCamera(),
                color: Colors.transparent,
                child: Row(
                  children: <Widget>[
                    SizedBox(width: MediaQuery.of(context).size.width * 0.03),
                    Icon(
                      Icons.photo_camera,
                      size: 30,
                      color: Colors.blue[900],
                    ),
                  ],
                ),
              ),
            ]),
      ),
      body: Center(
          child: Column(children: <Widget>[
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
                controller: titleController,
                maxLines: 2,
                maxLength: 50,
                decoration: InputDecoration(
                    icon: Icon(Icons.title, color: Colors.black),
                    hintText: "An Interesting Title"))),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.06,
        ),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
                controller: descController,
                maxLines: 8,
                maxLength: 500,
                decoration: InputDecoration(
                    icon: Icon(Icons.info_outline, color: Colors.black),
                    hintText: "What's on Your Mind?"))),
        Container(
          height: MediaQuery.of(context).size.height * 0.3,
          width: MediaQuery.of(context).size.width * 0.9,
          child: imageURI == null
              ? Center(
                  child:
                      Text('No Photo Inserted', style: TextStyle(fontSize: 16)))
              : Image.file(imageURI),
        ),
      ])),
    );
  }

  void _addPost() async {
    Text title = Text(titleController.text);

    var titleupload = title.data;

    Text txt2 = Text(descController.text);
    var desc = txt2.data;

    await firestore.collection('ForumDatabase').document(titleupload).setData({
      'author': LoginPage.user.displayName,
      'date':
          DateFormat('dd-MM-yyyy @ kk:mm').format(DateTime.now()).toString(),
      'description': desc,
      'title': titleupload,
      'postUID': LoginPage.user.uid,
      'likes': 0,
      //need to upload image
    });
  }

  /*Future uploadPic(BuildContext context) async{
      String fileName = basename(imageURI.path);
       StorageReference firebaseStorageRef = FirebaseStorage.instance.ref().child(fileName);
       StorageUploadTask uploadTask = firebaseStorageRef.putFile(_image);
       StorageTaskSnapshot taskSnapshot=await uploadTask.onComplete;
       setState(() {
          print("Profile Picture uploaded");
          Scaffold.of(context).showSnackBar(SnackBar(content: Text('Profile Picture Uploaded')));
       });
    } 
    */

}
