import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:Cycled_iOS/database/DatabaseService.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../authentication.dart';
import 'storePage.dart';

class DuplicateStorePage extends StatefulWidget {
  static final stores = ['Giant', 'NTUC', 'Popular', 'Sheng Siong'];
  @override
  _DuplicateStorePageState createState() => new _DuplicateStorePageState();
}

class _DuplicateStorePageState extends State<DuplicateStorePage> {
  int cartVal = 0;
  Map<String, dynamic> userTokens = {};

  @override
  void initState() {
    super.initState();
    for (String store in StorePage.stores) {
      DatabaseService(uid: LoginPage.user.uid).resetRewards(store, 0);
    }
  }

  Future getUserTokens() async {
    await Firestore.instance
        .collection('UserDatabase')
        .document(LoginPage.user.uid)
        .collection('Other Info')
        .document('Tokens')
        .get()
        .then((val) {
      userTokens.addAll(val.data);
    });
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot document) {
    return Padding(
        padding:
            EdgeInsets.only(top: 10.0, bottom: 10.0, left: 5.0, right: 5.0),
        child: InkWell(
            child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 3.0,
                    blurRadius: 5.0)
              ],
              color: Colors.white),
          child: Column(
            children: <Widget>[
              Container(
                  child: Container(
                height: 75.0,
                width: 75.0,
                child: Image.network(document['imageURL']),
              )),
              SizedBox(height: 7.0),
              Text(document['Tokens'].toString() + " Tokens",
                  style: TextStyle(color: Color(0xFFCC8053), fontSize: 16.0)),
              Text(document['Description'],
                  style: TextStyle(color: Color(0xFF575E67), fontSize: 14.0)),
              Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Container(color: Color(0xFFEBEBEB), height: 1.0)),
              Container(
                width: MediaQuery.of(context).size.width * 3,
                height: MediaQuery.of(context).size.width * 0.08,
                child: Row(
                  children: <Widget>[
                    SizedBox(width: 20),
                    FloatingActionButton(
                      child: Icon(
                        Icons.add,
                        color: Colors.orange,
                      ),
                      backgroundColor: Colors.white,
                      onPressed: () {
                        Firestore.instance.runTransaction((transaction) async {
                          DocumentSnapshot freshSnap =
                              await transaction.get(document.reference);
                          await transaction.update(freshSnap.reference,
                              {'Count': freshSnap['Count'] + 1});
                        });
                        cartVal = cartVal + document['Tokens'];
                        setState(() {});
                      },
                    ),
                    SizedBox(width: 10),
                    Text(document['Count'].toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.normal, fontSize: 20)),
                    SizedBox(width: 10),
                    FloatingActionButton(
                      child: Icon(
                        Icons.remove,
                        color: Colors.red,
                      ),
                      backgroundColor: Colors.white,
                      onPressed: () {
                        if (document['Count'] > 0) {
                          Firestore.instance
                              .runTransaction((transaction) async {
                            DocumentSnapshot freshSnap =
                                await transaction.get(document.reference);
                            await transaction.update(freshSnap.reference,
                                {'Count': freshSnap['Count'] - 1});
                          });
                          cartVal = cartVal - document['Tokens'];
                          setState(() {});
                        }
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5),
            ],
          ),
        )));
  }

  @override
  Widget build(BuildContext build) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(
                LineAwesomeIcons.arrow_left,
                color: Colors.black,
              ),
              onPressed: () => {Navigator.pop(context, false)}),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          title: Text('\nReward Yourself',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 23,
                color: Colors.black,
              )),
        ),
        body: new Container(
          decoration: BoxDecoration(
            image: new DecorationImage(
              colorFilter: new ColorFilter.mode(
                  Colors.black.withOpacity(0.1), BlendMode.dstATop),
              image: AssetImage("assets/images/store.jpg"),
              fit: BoxFit.fill,
            ),
            borderRadius: BorderRadius.all(Radius.circular(50.0)),
          ),
          child: Column(
            children: <Widget>[
              /*
    
    consider adding something at the top 
             */
              Row(
                children: <Widget>[
                  SizedBox(width: MediaQuery.of(context).size.width / 5),
                ],
              ),
              SizedBox(height: 20),
              NotificationListener<OverscrollIndicatorNotification>(
                onNotification: (OverscrollIndicatorNotification overscroll) {
                  overscroll.disallowGlow();
                  return;
                },
                child: Flexible(
                  fit: FlexFit.tight,
                  child: StreamBuilder(
                      stream: Firestore.instance
                          .collection('StoreDatabase')
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) return Container();
                        return GridView.builder(
                            gridDelegate:
                                new SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2),
                            itemCount: snapshot.data.documents.length,
                            itemBuilder: (context, index) => _buildListItem(
                                context, snapshot.data.documents[index]));
                      }),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(0),
                  color: Colors.blueGrey[50],
                ),
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    Row(children: <Widget>[
                      Text("Tokens  ".toUpperCase(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.02)),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.63),
                      DatabaseService(uid: LoginPage.user.uid)
                          .getTokens('rewards'),
                    ]),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                    Row(children: <Widget>[
                      Text("Cart ".toUpperCase(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.02)),
                      SizedBox(
                          width: MediaQuery.of(context).size.width * 0.694),
                      Text(cartVal.toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.025)),
                    ]),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    Container(
                      height: 50,
                      margin: EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(0),
                        color: Colors.blueGrey[700],
                      ),
                      child: MaterialButton(
                        child: Row(children: <Widget>[
                          Text("Checkout".toUpperCase(),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.04,
                                color: Colors.white,
                              )),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.534),
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                          ),
                        ]),
                        onPressed: () {
                          if (cartVal != 0) {
                            showDialog(
                                context: context,
                                builder: (_) => AlertDialog(
                                      title: Text(cartVal.toString() +
                                          " tokens will be deducted from your account. Would you like to proceed?"),
                                      actions: <Widget>[
                                        FlatButton(
                                          child: Text("No",
                                              style: TextStyle(fontSize: 20)),
                                          onPressed: () =>
                                              Navigator.of(context).pop(),
                                        ),
                                        FlatButton(
                                          child: Text("Yes",
                                              style: TextStyle(fontSize: 20)),
                                          onPressed: () {
                                            getUserTokens();
                                            if (cartVal >
                                                userTokens['Tokens']) {
                                              Scaffold.of(context)
                                                  .showSnackBar(SnackBar(
                                                content: Text(
                                                  "Checkout failed, insufficient tokens!",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16.0,
                                                  ),
                                                ),
                                                backgroundColor: Colors.blue,
                                                duration: Duration(seconds: 2),
                                              ));
                                            } else {
                                              DatabaseService(
                                                      uid: LoginPage.user.uid)
                                                  .addUserTokens(-cartVal);
                                              Scaffold.of(context)
                                                  .showSnackBar(SnackBar(
                                                content: Text(
                                                  "Checkout successful! Check your email for your reward(s)",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16.0,
                                                  ),
                                                ),
                                                backgroundColor: Colors.blue,
                                                duration: Duration(seconds: 5),
                                              ));
                                              cartVal = 0;
                                              for (String store
                                                  in DuplicateStorePage
                                                      .stores) {
                                                DatabaseService(
                                                        uid: LoginPage.user.uid)
                                                    .resetRewards(store, 0);
                                              }
                                              setState(() {});
                                            }
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    ),
                                barrierDismissible: false);
                          } else {
                            showDialog(
                                context: context,
                                builder: (_) => AlertDialog(
                                      title: Text(
                                          "Cart is empty! Please select the reward of your choice to proceed."),
                                      actions: <Widget>[
                                        FlatButton(
                                          child: Text("OK",
                                              style: TextStyle(fontSize: 20)),
                                          onPressed: () =>
                                              Navigator.of(context).pop(),
                                        ),
                                      ],
                                    ),
                                barrierDismissible: false);
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            ],
          ),
        ));
  }
}
