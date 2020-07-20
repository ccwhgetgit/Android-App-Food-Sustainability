import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geoflutterfire/geoflutterfire.dart';

import 'package:geolocator/geolocator.dart';
import 'package:location/location.dart';

class FormPage extends StatefulWidget {
  @override
  _FormPageState createState() => new _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
  final databaseReference = Firestore.instance;
  Position _currentPosition;

  Firestore firestore = Firestore.instance;
  Location location = new Location();
  Geoflutterfire geo = Geoflutterfire();
  String _currentAddress;

  bool _validate = false;

  final myController = TextEditingController();
  final controller2 = TextEditingController();

  final controller3 = TextEditingController();

  final controllerpw = TextEditingController();
  final controllerpwcheck = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
            Widget>[
          Container(
            child: Stack(
              children: <Widget>[
                Container(
                  child: Text(
                    ' \n\ Be a\n       Host Today',
                    style:
                        TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(310.0, 35.0, 0.0, 0.0),
                  child: Text(
                    '.',
                    style: TextStyle(
                        fontSize: 80.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.green),
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(20.0, 35.0, 0.0, 0.0),
                  child: Text(
                    'Quick Tips: \n\n1) Share distinctive features for disposers to easily recognise \n\n2) Click on the icon to get your postal code\n\n3) Be on the map!',
                    style: TextStyle(fontSize: 12),
                  ),
                ),
              ],
            ),
          ),
          Container(
              padding: EdgeInsets.only(top: 2.0, left: 20.0, right: 20.0),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 10.0),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Preferred Name / Nickname ',
                        labelStyle: TextStyle(color: Colors.grey, fontSize: 15),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green))),
                    obscureText: false,
                    controller: myController,
                  ),
                  SizedBox(height: 10.0),
                  Row(children: <Widget>[
                    if (_currentPosition != null) Text(_currentAddress),
                    FlatButton(
                      onPressed: () {
                        _getCurrentLocation();
                      },
                      child: Column(
                        // Replace with a Row for horizontal icon + text
                        children: <Widget>[
                          Icon(Icons.location_on, color: Colors.green[900]),
                          Text("Postal Code", style: TextStyle(fontSize: 10))
                        ],
                      ),
                    ),
                  ]),
                  Row(children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width / 2.8,
                      child: TextFormField(
                        decoration: InputDecoration(
                            labelText: 'LandMarks/Features ',
                            labelStyle:
                                TextStyle(color: Colors.grey, fontSize: 13),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.green))),
                        obscureText: false,
                        controller: controller2,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 7,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 2.8,
                      child: TextFormField(
                        decoration: InputDecoration(
                            labelText: 'Password for Your Point ',
                            labelStyle:
                                TextStyle(color: Colors.grey, fontSize: 13),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.green))),
                        obscureText: false,
                        controller: controllerpw,
                      ),
                    )
                  ]),
                  SizedBox(height: 50.0),
                  Container(
                      height: 40.0,
                      child: Material(
                        elevation: 7.0,
                        child: RaisedButton(
                          onPressed: () async {
                            if (myController.text == "" ||
                                controller2.text == "" ||
                                controllerpw.text == "") {
                              showDialog(
                                  context: context,
                                  builder: (_) => AlertDialog(
                                        title: Text(
                                            'Do ensure all the text fields have been filled up! If not, do check:'),
                                        content: Text(
                                            '1. Is the information correct? \n\n2. Choose a stronger password for your own collection point. You can access it easily thereafter!'),
                                      ));
                            } else {
                              _popupDialog(context);
                            }
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                          color: Colors.blueGrey[500],
                          child: Center(
                            child: Text(
                              'Be Part Of The Movement',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Montserrat'),
                            ),
                          ),
                        ),
                      )),
                  SizedBox(height: 21),
                  Container(
                      height: 40.0,
                      child: Material(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.red[900],
                        elevation: 7.0,
                        child: GestureDetector(
                          onTap: () => _popupDeleteDialog(context),
                          child: Center(
                            child: Text(
                              'Remove My Location',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Montserrat'),
                            ),
                          ),
                        ),
                      )),
                  SizedBox(height: 20.0),
                  Container(
                    height: 40.0,
                    color: Colors.transparent,
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.white,
                              style: BorderStyle.solid,
                              width: 1.0),
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(20.0)),
                      child: InkWell(
                        onTap: () => {Navigator.pop(context, false)},
                        //forwards the data

                        child: Center(
                          child: Text('Go Back',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                      ),
                    ),
                  ),
                ],
              )),
        ]));
  }

  void _popupDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Great! Come and Join us!'),
            content: Text(
                'Ensure that all the details are correct (eg. Your Collection Point) and we are ready to go'),
            actions: <Widget>[
              FlatButton(
                  onPressed: () {
                    _addGeoPoint();

                    Navigator.of(context).pop("");
                  },
                  child: Text('Add Me in!')),
              FlatButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text('Cancel')),
            ],
          );
        });
  }

  void _popupDeleteDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Awww we hate to see you go!'),
            content: TextFormField(
              decoration: InputDecoration(
                  labelText: 'Password for Your Collection Point ',
                  labelStyle: TextStyle(color: Colors.grey, fontSize: 15),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.green))),
              obscureText: false,
              controller: controllerpwcheck,
            ),
            actions: <Widget>[
              FlatButton(
                  onPressed: () {
                    deleteData();

                    Navigator.of(context).pop();
                  },
                  child: Text('Remove My Point!')),
              FlatButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text('Cancel')),
            ],
          );
        });
  }

  final String uid;
  _FormPageState({this.uid});

  void _addGeoPoint() async {
    var pos = await location.getLocation();

    GeoPoint point = GeoPoint(pos.latitude, pos.longitude);
    Text txt = Text(myController.text);

    var name = txt.data;

    Text txt2 = Text(controller2.text);
    var landmark = txt2.data;

    Text pw = Text(controllerpw.text);
    var password = pw.data;

    await firestore
        .collection('BinLocationDatabase')
        .document(password)
        .setData({
      'Address': name,
      'Coordinates': point,
      'LandMark': landmark,
      'Password': password,
    });
  }

  void deleteData() {
    Text pwcheck = Text(controllerpwcheck.text);
    var passwordcheck = pwcheck.data;

    try {
      firestore
          .collection('BinLocationDatabase')
          .document(passwordcheck)
          .delete();
    } catch (e) {
      print(e.toString());
    }
  }

  _getCurrentLocation() {
    geolocator.getCurrentPosition().then((Position position) {
      setState(() {
        _currentPosition = position;
      });

      _getAddressFromLatLng();
    }).catchError((e) {
      print(e);
    });
  }

  _getAddressFromLatLng() async {
    try {
      List<Placemark> p = await geolocator.placemarkFromCoordinates(
          _currentPosition.latitude, _currentPosition.longitude);

      Placemark place = p[0];

      setState(() {
        _currentAddress = "Your Collection Point:\n${place.postalCode}";
      });
    } catch (e) {
      print(e);
    }
  }
}
