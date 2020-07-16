import 'package:flutter/material.dart';

import 'authentication.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Cycled',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'SFProText',
      ),
      home: new LoginPage(),
    );
  }
}

