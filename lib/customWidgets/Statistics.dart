import 'package:Cycled_iOS/authentication.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Statistics extends StatelessWidget {
  final int food;
  final int energy;
  final int fertiliser;

  Statistics(this.food, this.energy, this.fertiliser);

  Widget _buildListItem(BuildContext context, DocumentSnapshot document) {
    return ListView(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.width * 0.04),
      physics: new NeverScrollableScrollPhysics(),
      children: <Widget>[
        Row(children: <Widget>[
          SizedBox(width: 10),
          document['Type'] == "Food"
              ? Image.asset('assets/images/rice.png', width: 70, height: 70)
              : document['Type'] == "Energy"
                  ? Image.asset('assets/images/factory.png',
                      width: 70, height: 70)
                  : Image.asset('assets/images/plant.png',
                      width: 70, height: 70),
          SizedBox(width: 30),
          Expanded(
            child: Text(
              document['Value'].toString(),
              style: TextStyle(fontSize: 40),
            ),
          ),
          document['Type'] == "Energy"
              ? Container(
                  padding: EdgeInsets.only(
                      right: MediaQuery.of(context).size.width * 0.06),
                  child: Column(
                    children: <Widget>[
                      Text("KILOJOULES",
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.067)),
                      Text("OF RENEWABLE ENERGY CONSERVED",
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.022)),
                    ],
                  ),
                )
              : document['Type'] == "Fertiliser"
                  ? Container(
                      padding: EdgeInsets.only(
                          right: MediaQuery.of(context).size.width * 0.13),
                      child: Column(
                        children: <Widget>[
                          Text("GRAMS",
                              style: TextStyle(
                                  fontSize: MediaQuery.of(context).size.width *
                                      0.067)),
                          Text("OF FERTILISER GENERATED",
                              style: TextStyle(
                                  fontSize: MediaQuery.of(context).size.width *
                                      0.022)),
                        ],
                      ),
                    )
                  : Container(
                      padding: EdgeInsets.only(
                          right: MediaQuery.of(context).size.width * 0.11),
                      child: Column(
                        children: <Widget>[
                          Text("SERVINGS",
                              style: TextStyle(
                                  fontSize: MediaQuery.of(context).size.width *
                                      0.067)),
                          Text("OF FOOD SAVED",
                              style: TextStyle(
                                  fontSize: MediaQuery.of(context).size.width *
                                      0.022)),
                        ],
                      ),
                    )
        ]),
      ],
      //onTap: () => print("This should work")
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
      child: Column(
        children: <Widget>[
          Flexible(
            child: StreamBuilder(
                stream: Firestore.instance
                    .collection('UserDatabase')
                    .document(LoginPage.user.uid)
                    .collection('Statistics')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData)
                    return const Text('Loading, please wait...');
                  return ListView.builder(
                    physics: new NeverScrollableScrollPhysics(),
                    itemExtent: 80.0,
                    itemCount: snapshot.data.documents.length,
                    itemBuilder: (context, index) =>
                        _buildListItem(context, snapshot.data.documents[index]),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
