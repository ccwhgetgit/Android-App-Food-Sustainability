
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';



class ExploreHere extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   
    return new Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(
              LineAwesomeIcons.arrow_left,
              color: Colors.black,
            ),
            onPressed: () => {Navigator.pop(context, false)}),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
     
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            color: Colors.grey[50],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
            
              Text("EXPLORE", style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
              ), 
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              
             
Padding(
  padding: EdgeInsets.all(10),
child: Text
              (
  "Cycled is a community initative that strongly relies on individual and collective responsibility to rescue our food waste.  ",
            style: TextStyle(
                fontSize: 14, color: Colors.black),
          ),
     
),
     SizedBox(height: MediaQuery.of(context).size.height * 0.02),

Container(
          child: Column(
            children: <Widget>[
           SizedBox(height: 10,),
  
  Image.asset("assets/images/explore.png", width:  MediaQuery.of(context).size.width/1),


            ],
          ),
),

     SizedBox(height: MediaQuery.of(context).size.height * 0.04),

Container(
          child: Column(
            children: <Widget>[
           SizedBox(height: 10,),
  Align(
    alignment: Alignment.topCenter,
  child: Text("  \nGet to know your neighbours  ", 
  
    style: TextStyle(
                fontSize: MediaQuery.of(context).size.height * 0.023, fontStyle: FontStyle.italic, color: Colors.black),
                ),
  ),Align(
    alignment: Alignment.topCenter,
  child: Text("  Be Part of the Movement ", 
  
    style: TextStyle(
                fontSize: MediaQuery.of(context).size.height * 0.02, fontStyle: FontStyle.italic, color: Colors.grey[700]),
                ),
  ),


            ],
          ),
),
      



              ]))));
            
  }
}

