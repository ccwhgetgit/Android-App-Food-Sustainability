import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final IconData icon;
  final String text;
  final Function onTap;

  CustomListTile(this.icon, this.text, this.onTap);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10),
      child: Container(
          decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey.shade300))),
          child: InkWell(
              child: Container(
                height: 70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(children: <Widget>[
                      Icon(icon),
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(text, style: TextStyle(fontSize: 20)),
                      )
                    ]),
                    Icon(Icons.arrow_right),
                  ],
                ),
              ),
              onTap: onTap)),
    );
  }
}
