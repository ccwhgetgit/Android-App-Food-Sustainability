
import 'package:flutter/material.dart';


class FormPage extends StatefulWidget {
  @override
  _FormPageState createState() => new  _FormPageState();
}

class _FormPageState extends State<FormPage>  {
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
              padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
              child: Column(
                children: <Widget>[
                  
                  SizedBox(height: 10.0),
                  TextField(
                    decoration: InputDecoration(
                        labelText: 'Name (Nickname) ',
                        labelStyle: TextStyle(
                            color: Colors.grey),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green))),
                    obscureText: true,
                  ),
                  SizedBox(height: 10.0),
                  TextField(
                    decoration: InputDecoration(
                        labelText: 'replace with Postal Code ',
                        labelStyle: TextStyle(
                            
                            color: Colors.grey),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green))),
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

                              //goes back to home page / alert dialog 

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
                                      fontFamily: 'Montserrat')),
                            ),
                        
                        
                      ),
                    ),
                  ),
                ],
              )),
        
        ]));
  }
}