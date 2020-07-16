import 'package:Cycled_iOS/customWidgets/shoe_model.dart';
import 'package:Cycled_iOS/database/DatabaseService.dart';
import 'package:Cycled_iOS/tabs/duplicatestorePage.dart';
import 'package:flutter/material.dart';
import '../authentication.dart';

List<ShoeModel> shoeList = ShoeModel.list;

class UserCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        //add app bar

        body: SingleChildScrollView(
            child: Container(
                child: Stack(children: <Widget>[
      Positioned(
        top: MediaQuery.of(context).size.height / 2.5,
        child: Container(
          height: MediaQuery.of(context).size.height * 1.5,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(0),
            color: Colors.white,
          ),
        ),
      ),
      Positioned(
          top: MediaQuery.of(context).size.height / 2.3,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Text(
            "  Membership Tier",
            style: TextStyle(
                fontSize: 25,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontFamily: 'SFProText'),
          )),
      Positioned(
        child: Container(
          height: MediaQuery.of(context).size.height * 1.1,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(0),
            color: Colors.black,
          ),
        ),
      ),
      Container(
          padding: EdgeInsets.fromLTRB(0, 25, 150, 10),
          child: Column(
            children: <Widget>[
              SizedBox(height: 0),
              DatabaseService(uid: LoginPage.user.uid).getTier(),
            ],
          )),
      Container(
          padding: EdgeInsets.fromLTRB(10, 85, 20, 20),
          child: Column(
            children: <Widget>[
              Text(
                "TOKENS FOR REWARDS REDEMPTION",
                style: TextStyle(
                    fontSize: 13,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'SFProText'),
              ),
            ],
          )),
      Container(
          padding: EdgeInsets.fromLTRB(10, 115, 40, 20),
          child: Column(
            children: <Widget>[
              DatabaseService(uid: LoginPage.user.uid).getMemberTokens('usercard'),
            ],
          )),
      Container(
          padding: EdgeInsets.fromLTRB(90, 105, 20, 20),
          child: Column(
            children: <Widget>[
              FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    side: BorderSide(color: Colors.transparent)),
                color: Colors.blueGrey,
                textColor: Colors.white,
                padding: EdgeInsets.all(6.0),
                onPressed: () => {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => DuplicateStorePage()))
                },
                child: Text(
                  "Rewards".toUpperCase(),
                  style: TextStyle(
                    fontSize: 11.0,
                  ),
                ),
              )
            ],
          )),
      Container(
          padding: EdgeInsets.fromLTRB(10, 180, 40, 20),
          child: Column(
            children: <Widget>[
              Text(
                "TOTAL POINTS EARNED",
                style: TextStyle(
                    fontSize: 13,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'SFProText'),
              ),
            ],
          )),
      Container(
          padding: EdgeInsets.fromLTRB(10, 200, 40, 20),
          child: Column(
            children: <Widget>[
              DatabaseService(uid: LoginPage.user.uid).getPoints(),
            ],
          )),
      Container(
        padding: EdgeInsets.fromLTRB(220, MediaQuery.of(context).size.height / 4, 0, 20),
        child: DatabaseService(uid: LoginPage.user.uid).getStatus(),
      ),
      Container(
        padding: EdgeInsets.fromLTRB(10, 250, 40, 20),
        child: DatabaseService(uid: LoginPage.user.uid).obtainPoints(),
      ),
      Positioned(
        top: MediaQuery.of(context).size.height / 2.5,
        child: Container(
          height: MediaQuery.of(context).size.height * 1.5,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(0),
            color: Colors.white,
          ),
        ),
      ),
      Positioned(
          top: MediaQuery.of(context).size.height / 2.3,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Text(
            "  Membership Tiers",
            style: TextStyle(
                fontSize: 25,
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontFamily: 'SFProText'),
          )),
      Positioned(
          top: MediaQuery.of(context).size.height / 2,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Text(
            "   Level up when you complete the daily quiz\n   and dispose your food properly ",
            style: TextStyle(
                fontSize: 15, color: Colors.brown),
          )),
      Positioned(
        top: MediaQuery.of(context).size.height / 1.6,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 2.1,
        child: ListView.builder(
          itemCount: shoeList.length,
          scrollDirection: Axis.horizontal,
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 16),
          itemBuilder: (context, index) {
            return GestureDetector(
              child: Container(
                width: 230,
                margin: EdgeInsets.only(right: 16),
                child: Stack(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 2),
                      child: _buildBackground(index, 230),
                    ),
                    Positioned(
                      bottom: 180,
                      right: 10,
                      child: Hero(
                        tag: "hero${shoeList[index].imgPath}",
                        child: Transform.rotate(
                          angle: 0,
                          child: Image(
                            width: 150,
                            height: 150,
                            image:
                                AssetImage("assets/${shoeList[index].imgPath}"),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    ]))));
  }
}

Widget _buildBackground(int index, double width) {
  return Container(
    child: Container(
     
       decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
 color: shoeList[index].color,
      ),
      width: width,
      child: Stack(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: 180,
                  width: 200,
                ),
                Container(
                  width: 200,
                  child: Text(
                    "${shoeList[index].name}",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  "${shoeList[index].price.toInt()} points",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                
                SizedBox(height: 10),
                Text(
                  "${shoeList[index].brand}",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              width: 90,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.transparent,
              ),
            ),
          )
        ],
      ),
    ),
  );
}
