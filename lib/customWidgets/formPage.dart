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

  final myController = TextEditingController();
  final controller2 = TextEditingController();

  final controller3 = TextEditingController();

  final controllerpw = TextEditingController();
  final controllerfood = TextEditingController();
  final controllerpwcheck = TextEditingController();
  final controllerfoodcheck = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
            Widget>[
          Container(
            child: Stack(
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).size.height / 10,
                ),
                Text(
                  '  \n  Be a\n       Host Today\n',
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width / 10,
                      fontWeight: FontWeight.bold),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(290.0, 15.0, 0.0, 0.0),
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
                Column(children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(
                        0.0, 0, MediaQuery.of(context).size.width / 1.4, 0.0),
                    child: Text(
                      '  Quick Tips: \n',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(0.0, 0, 0.0, 0.0),
                    child: Text(
                      " 1) Share distinctive features for disposers to easily recognise\n (eg. Landmark, Unit No.) \n\n 2) Click the icon to confirm the location of your collection point\n\n 3) Be on the map and check to see if you are there\n\n 4) Remember your password and fav food to this collection point!",
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                ]),
              ],
            ),
          ),
          Row(children: <Widget>[
            SizedBox(
              width: MediaQuery.of(context).size.width / 2.5,
            ),
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
          Container(
              padding: EdgeInsets.only(top: 2.0, left: 20.0, right: 20.0),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 10.0),
                  Row(children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width / 2.8,
                      child: TextFormField(
                        decoration: InputDecoration(
                            labelText: 'Preferred Name ',
                            labelStyle:
                                TextStyle(color: Colors.grey, fontSize: 15),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.green))),
                        obscureText: false,
                        controller: myController,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 7,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 2.8,
                      child: TextFormField(
                        decoration: InputDecoration(
                            labelText: 'Favourite food! ',
                            labelStyle:
                                TextStyle(color: Colors.grey, fontSize: 15),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.green))),
                        obscureText: false,
                        controller: controllerfood,
                      ),
                    ),
                    SizedBox(height: 10.0),
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
                            labelText: 'Password',
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
                                controllerpw.text == "" ||
                                controllerfood.text == "") {
                              showDialog(
                                  context: context,
                                  builder: (_) => AlertDialog(
                                        title: Text(
                                            'Do ensure all the text fields have been filled up! If not,'),
                                        content: Text(
                                            '1. Is the information correct? \n\n2. The password is for your own collection point. You can access it easily thereafter to remove from our end'),
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
                    _addGeoPoint(); //show alert dialog as confirmation on pressing

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

  void _confirmDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Great! Come and Join us!'),
            content: Text(
                'Ensure that all the details are correct (eg. Your Collection Point) and we are ready to go'),
          );
        });
  }

  void _popupDeleteDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Awww we hate to see you go!'),
            content: Row(
                // Replace with a Row for horizontal icon + text
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width / 3.4,
                    child: TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle:
                              TextStyle(color: Colors.grey, fontSize: 15),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.green))),
                      obscureText: false,
                      controller: controllerpwcheck,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 10.8,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 3.8,
                    child: TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Fav Food! ',
                          labelStyle:
                              TextStyle(color: Colors.grey, fontSize: 15),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.green))),
                      obscureText: false,
                      controller: controllerfoodcheck,
                    ),
                  ),
                ]),
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

    Text pwfood = Text(controllerfood.text);
    var passwordfood = pwfood.data;

    var newpassword = password + passwordfood;

    await firestore
        .collection('BinLocationDatabase')
        .document(newpassword)
        .setData({
      'Address': name,
      'Coordinates': point,
      'LandMark': landmark,
      'Password': newpassword,
      'UserType': "User",
    });
  }

  void deleteData() {
    Text pwcheck = Text(controllerpwcheck.text);
    var passwordcheck = pwcheck.data;

    Text foodcheck = Text(controllerfoodcheck.text);
    var fdcheck = foodcheck.data;

    var passwordchecking = passwordcheck + fdcheck;

    try {
      firestore
          .collection('BinLocationDatabase')
          .document(passwordchecking)
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
