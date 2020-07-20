import 'dart:collection';
import 'dart:io';
import 'package:Cycled_iOS/database/DatabaseService.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:location/location.dart';
import 'package:image_picker/image_picker.dart';
import '../authentication.dart';
import 'package:geolocator/geolocator.dart';

class DisposePage extends StatefulWidget {
  @override
  _DisposePageState createState() => new _DisposePageState();
}

class _DisposePageState extends State<DisposePage> {
  String qrCodeResult = "";
  var bins = [];
  var filterDist;
  String nearestBin = "";
  int nearestBinIndex;
  bool binsFlag = false;

  Set<Marker> _markers = HashSet<Marker>();
  GoogleMapController _mapController;
  BitmapDescriptor _markerIcon;
  final FirebaseStorage _storage =
      FirebaseStorage(storageBucket: 'gs://cycledorbital-ab3ff.appspot.com');
  StorageUploadTask _uploadTask;

  File file;

  void _startUpload() {
    String filepath = 'images/${LoginPage.user.uid}/${DateTime.now()}.png';

    setState(() {
      _uploadTask = _storage.ref().child(filepath).putFile(file);
    });
  }

  _openGallery(BuildContext context) async {
    var picture = await ImagePicker().getImage(source: ImageSource.gallery);
    if (picture != null) {
      setState(() {
        file = File(picture.path);
        _startUpload();
      });
      ScanResult codeScanner = await BarcodeScanner.scan();
      setState(() {
        qrCodeResult = codeScanner.rawContent;
      });
    }
    Navigator.of(context).pop();
  }

  _openCamera(BuildContext context) async {
    var picture = await ImagePicker().getImage(source: ImageSource.camera);
    if (picture != null) {
      setState(() {
        file = File(picture.path);
        _startUpload();
      });
      ScanResult codeScanner = await BarcodeScanner.scan();
      setState(() {
        qrCodeResult = codeScanner.rawContent;
      });
    }
    Navigator.of(context).pop();
  }

  Future<void> _showChoiceDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: Center(child: Text("Share your food waste"),),
              content: SingleChildScrollView(
                  child: ListBody(
                children: <Widget>[
                  GestureDetector(
                      child: Text("Photo Gallery"),
                      onTap: () {
                        _openGallery(context);
                      }),
                  Padding(padding: EdgeInsets.all(8.0)),
                  GestureDetector(
                      child: Text("Camera"),
                      onTap: () {
                        _openCamera(context);
                      }),
                ],
              )));
        });
  }

  @override
  void initState() {
    super.initState();
    _setMarkerIcon();
    _getLocation();
  }

  void _populateBins(GoogleMapController controller) {
    _mapController = controller;

    Firestore.instance
        .collection('BinLocationDatabase')
        .getDocuments()
        .then((docs) {
      if (docs.documents.isNotEmpty) {
        for (int i = 0; i < docs.documents.length; i++) {
          setState(() {
            bins.add(docs.documents[i].data);
            binsFlag = true;
            _markers.add(
              Marker(
                markerId: MarkerId(i.toString()),
                position: LatLng(docs.documents[i]['Coordinates'].latitude,
                    docs.documents[i]['Coordinates'].longitude),
                infoWindow: InfoWindow(
                  title: docs.documents[i]['Address'],
                  snippet: docs.documents[i]['LandMark'],
                ),
                icon: _markerIcon,
              ),
            );
          });
        }
      }
    });
  }

  _zoomInMarker(elem) {
    _mapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target:
            LatLng(elem['Coordinates'].latitude, elem['Coordinates'].longitude),
        zoom: 14.0,
        bearing: 90.0,
        tilt: 45.0)));
  }

  void _getLocation() async {
    var location = new Location();
    try {
      location.requestPermission();
    } on Exception catch (_) {
      print('There was a problem allowing location access');
    }
    setState(() {});
  }

  void _setMarkerIcon() async {
    _markerIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(), 'assets/images/bin.png');
  }

  void filterMarkers(dist) async {
    final position = await Geolocator().getCurrentPosition();
    double nearest = 999000.0;

    for (int i = 0; i < bins.length; i++) {
      setState(() {
        Geolocator()
            .distanceBetween(
                position.latitude,
                position.longitude,
                bins[i]['Coordinates'].latitude,
                bins[i]['Coordinates'].longitude)
            .then((calDist) {
          if (calDist / 1000 > double.parse(dist)) {
            _markers.remove(_markers.firstWhere(
                (Marker marker) => marker.markerId.value == i.toString()));
          } else {
            if (calDist / 1000 < nearest / 1000) {
              nearest = calDist;
              nearestBin = bins[i]['Address'];
              nearestBinIndex = i;
            }
            _markers.add(
              Marker(
                markerId: MarkerId(i.toString()),
                position: LatLng(bins[i]['Coordinates'].latitude,
                    bins[i]['Coordinates'].longitude),
                infoWindow: InfoWindow(
                  title: bins[i]['LandMark'],
                  snippet: bins[i]['Address'],
                ),
                icon: _markerIcon,
              ),
            );
          }
        });
      });
    }
  }

  Future<bool> getDist() {
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return AlertDialog(
            title: Text('Enter Preferred Distance From Your Location'),
            contentPadding: EdgeInsets.all(10.0),
            content: TextField(
                decoration: InputDecoration(hintText: 'Distance in km'),
                onChanged: (val) {
                  setState(() {
                    filterDist = val;
                  });
                }),
            actions: <Widget>[
              FlatButton(
                  child: Text('OK'),
                  color: Colors.transparent,
                  textColor: Colors.blue,
                  onPressed: () {
                    filterMarkers(filterDist);
                    Navigator.of(context).pop();
                  })
            ],
          );
        });
  }

  @override
  Widget build(BuildContext build) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.blueGrey[300],
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.location_on),
                onPressed: () => getDist(),
              )
            ],
            title: Text("Locate the nearest point",
                style: TextStyle(fontSize: 20, fontFamily: 'SFProText'))),
        body: Stack(
          children: <Widget>[
            Container(
                child: Column(
              children: <Widget>[
                SizedBox(
                    height: MediaQuery.of(context).size.height * 0.58,
                    child: GoogleMap(
                      onMapCreated: _populateBins,
                      initialCameraPosition: CameraPosition(
                          target: LatLng(1.3521, 103.8674), zoom: 12),
                      markers: _markers,
                      myLocationEnabled: true,
                      compassEnabled: true,
                    )),
                SizedBox(height: 20),
                Text("Find the Nearest Point", style: TextStyle(fontSize: 18)),
                nearestBin != ""
                    ? GestureDetector(
                        child: Text(nearestBin,
                            style: TextStyle(
                                fontSize: 20,
                                decoration: TextDecoration.underline)),
                        onTap: () => _zoomInMarker(bins[nearestBinIndex]),
                      )
                    : GestureDetector(
                        child: Icon(Icons.location_on, size: 30),
                        onTap: () => getDist(),
                      ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.025),
                Container(
                  height: 60,
                  margin: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.17,
                  ).copyWith(
                    bottom: 20,
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.06,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.blueGrey[500],
                  ),
                  child: MaterialButton(
                    child: Row(children: <Widget>[
                      Icon(
                        Icons.camera_alt,
                        color: Colors.white,
                      ),
                      SizedBox(width: 35),
                     Center( child: Text("Drop it off",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                            fontSize: 18,
                          ))
                          ,
                     )
                    ]),
                    onPressed: () async {
                      await _showChoiceDialog(context);
                      if (file != null && qrCodeResult != "") {
                        Scaffold.of(context).showSnackBar(SnackBar(
                          content: Text(
                            qrCodeResult,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
                                fontFamily: "WorkSansSemiBold"),
                          ),
                          backgroundColor: Colors.blue,
                          duration: Duration(seconds: 3),
                        ));
                        DatabaseService(uid: LoginPage.user.uid)
                            .addUserTokens(500);
                        DatabaseService(uid: LoginPage.user.uid)
                            .addUserPoints(50);
                        DatabaseService(uid: LoginPage.user.uid)
                            .updateUserStatus(true);
                        DatabaseService(uid: LoginPage.user.uid)
                            .updateStatsOnDispose();
                      }
                    },
                  ),
                ),
              ],
            ))
          ],
        ));
  }
}
