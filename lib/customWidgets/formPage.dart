
import 'package:Cycled_iOS/authentication.dart';
import 'package:Cycled_iOS/database/DatabaseService.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


import 'package:geolocator/geolocator.dart';
class FormPage extends StatefulWidget {
  @override
  _FormPageState createState() => new  _FormPageState();
}

class _FormPageState extends State<FormPage>  {
  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
  
  Position _currentPosition;
  String _currentAddress;


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
                    style:
                        TextStyle(fontSize: 12),
                  ),
                ),
                
              ],
            ),
          ),
          
          Container(
              padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
              child: Column(
                children: <Widget>[
                  
                  SizedBox(height: 10.0),
                  TextField(
                    decoration: InputDecoration(
                        labelText: 'LandMark : Building etc (Any Distinct Features)  ',
                        labelStyle: TextStyle(
                            color: Colors.grey, fontSize: 15),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green))),
                    obscureText: false,
                  ),
                  SizedBox(height: 10.0),
            

               if (_currentPosition != null)
              Text(
                  "${_currentPosition.latitude}, ${_currentPosition.longitude}"),
            FlatButton(
              child: Text("Get location"),
              onPressed: () {
                _getCurrentLocation();
              },
            ),
            
Row(
  mainAxisAlignment: MainAxisAlignment.start,
  children: <Widget>[
   if (_currentPosition != null) Text(_currentAddress),
     
            RaisedButton(
               padding: EdgeInsets.all(2.0),
    color: Colors.transparent,
    shape: RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(18.0),
 
),
   onPressed: () {
                _getPostalCode();
              },
    child: Row(
      children: <Widget>[
       
        Icon(Icons.location_on, color: Colors.green[900],),
      ],
    ),
  ),
  ],
),
           

                  SizedBox(height: 50.0),
                  Container(
                      height: 40.0,
                      child: Material(
                        borderRadius: BorderRadius.circular(20.0),
                       
                        color: Colors.blueGrey[500],
                        elevation: 7.0,
                        child: GestureDetector(
                          onTap: () {  

                              //goes back to home page / alert dialog 

                          },
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
                          onTap: () {  
                             // DatabaseService(uid: LoginPage.user.uid).updateCollectionPoints();
                          },
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
                        onTap: () 
                            => {Navigator.pop(context, false)},
                        
                        child: 
                        
                            Center(
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


//for LatLong
  _getCurrentLocation() {
    final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;

    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        _currentPosition = position;

      });
    }).catchError((e) {
      print(e);
    });

  }


//get Postal Code
  _getPostalCode() {
    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
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
        _currentAddress =
            "Postal Code : ${place.postalCode}";
      });
    } catch (e) {
      print(e);
    }
  }

  _getPostalCodestring() {
    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
      });

      _getAddressFromLatLngstring();
    }).catchError((e) {
      print(e);
    });
  }

  _getAddressFromLatLngstring() async {
    try {
      List<Placemark> p = await geolocator.placemarkFromCoordinates(
          _currentPosition.latitude, _currentPosition.longitude);

      Placemark place = p[0];

      setState(() {
        _currentAddress =
            "${place.postalCode}";
      });
    } catch (e) {
      print(e);
    }
  }
}
