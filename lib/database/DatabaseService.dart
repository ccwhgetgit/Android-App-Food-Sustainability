import 'package:Cycled_iOS/connect/reply.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../authentication.dart';
import '../dailyPoll.dart';

class DatabaseServicee extends StatefulWidget {
  static String postUID;
  @override
  DatabaseService createState() => DatabaseService();
}

class DatabaseService extends State<DatabaseServicee> {
  @override
  Widget build(BuildContext context) {
    return null;
  }

  Firestore firestore = Firestore.instance;
  final String uid;
  DatabaseService({this.uid});

  final CollectionReference userCollection =
      Firestore.instance.collection('UserDatabase');

  final CollectionReference storeCollection =
      Firestore.instance.collection('StoreDatabase');

  final CollectionReference binCollection =
      Firestore.instance.collection('BinLocationDatabase');

  final CollectionReference pollCollection =
      Firestore.instance.collection('PollDatabase');

  final CollectionReference forumCollection =
      Firestore.instance.collection('ForumDatabase');

  final Shader bronzeGradient = LinearGradient(
    colors: <Color>[Color.fromRGBO(205, 127, 50, 1.0), Colors.white],
  ).createShader(Rect.fromLTWH(0.0, 0.0, 300.0, 70.0));

  final Shader silverGradient = LinearGradient(
    colors: <Color>[Color.fromRGBO(192, 192, 192, 1.0), Colors.white],
  ).createShader(Rect.fromLTWH(0.0, 0.0, 300.0, 70.0));

  final Shader goldGradient = LinearGradient(
    colors: <Color>[Color.fromRGBO(255, 215, 0, 1.0), Colors.white],
  ).createShader(Rect.fromLTWH(0.0, 0.0, 300.0, 70.0));

  // =========== USER INFO ===========
  Future updateUserInfo(String email, String name, bool displayPic) async {
    var ref = userCollection
        .document(uid)
        .collection('User Info')
        .document('Personal Info');

    return await ref.get().then((docData) => !docData.exists
        ? ref.setData({'email': email, 'name': name, 'displayPic': displayPic})
        : {});
  }

  Widget getName() {
    return StreamBuilder(
      stream: Firestore.instance
          .collection('UserDatabase')
          .document(uid)
          .collection('User Info')
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return Text("");
        return Text(snapshot.data.documents[0]['name'],
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ));
      },
    );
  }

  Widget getNewName() {
    return StreamBuilder(
      stream: Firestore.instance
          .collection('UserDatabase')
          .document(uid)
          .collection('User Info')
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return Text("");
        return Text(snapshot.data.documents[0]['name'],
            style: TextStyle(
              fontSize: 30,
              color: Colors.white,
            ));
      },
    );
  }

  Widget getProfileName() {
    return StreamBuilder(
      stream: Firestore.instance
          .collection('UserDatabase')
          .document(uid)
          .collection('User Info')
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return Text("");
        return Text(snapshot.data.documents[0]['name'],
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ));
      },
    );
  }

  // =========== OTHER INFO ===========
  Future updateUserTokens(int tokens) async {
    var ref = userCollection
        .document(uid)
        .collection('Other Info')
        .document('Tokens');

    return await ref.get().then(
        (docData) => !docData.exists ? ref.setData({'Tokens': tokens}) : {});
  }

  Future addUserTokens(int val) async {
    var ref = userCollection
        .document(uid)
        .collection('Other Info')
        .document('Tokens');

    return await ref.updateData({'Tokens': FieldValue.increment(val)});
  }

  Widget getTokens(String x) {
    switch (x) {
      case 'rewards':
        return StreamBuilder(
          stream: Firestore.instance
              .collection('UserDatabase')
              .document(uid)
              .collection('Other Info')
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) return Container();
            return Text(snapshot.data.documents[3]['Tokens'].toString(),
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery.of(context).size.height * 0.025));
          },
        );
        break;
      case 'usercard':
        return StreamBuilder(
          stream: Firestore.instance
              .collection('UserDatabase')
              .document(uid)
              .collection('Other Info')
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) return Container();
            return Text(snapshot.data.documents[3]['Tokens'].toString(),
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.025,
                    fontWeight: FontWeight.bold,
                    color: Colors.black));
          },
        );
        break;
    }
    return null;
  }

  Widget getMemberTokens(String x) {
    switch (x) {
      case 'rewards':
        return StreamBuilder(
          stream: Firestore.instance
              .collection('UserDatabase')
              .document(uid)
              .collection('Other Info')
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) return Container();
            return Text(
                "Tokens: " + snapshot.data.documents[3]['Tokens'].toString(),
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.07));
          },
        );
        break;
      case 'usercard':
        return StreamBuilder(
          stream: Firestore.instance
              .collection('UserDatabase')
              .document(uid)
              .collection('Other Info')
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) return Container();
            return Text(snapshot.data.documents[3]['Tokens'].toString(),
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.07,
                    fontWeight: FontWeight.bold,
                    color: Colors.black));
          },
        );
        break;
    }
    return null;
  }

  Future updateUserStatus(bool status) async {
    var ref = userCollection
        .document(uid)
        .collection('Other Info')
        .document('Status');

    return await ref.get().then((docData) => !docData.exists
        ? ref.setData({'Status': status})
        : ref.updateData({'Status': status}));
  }

//used in learn and earn

  Widget getNewStatus() {
    return StreamBuilder(
      stream: Firestore.instance
          .collection('UserDatabase')
          .document(uid)
          .collection('Other Info')
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return Container();
        return Text(
            "Status: " +
                (snapshot.data.documents[1]['Status'] == false
                    ? "Yet to Complete..."
                    : "Completed!"),
            style: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.05,
                fontWeight: FontWeight.bold,
                color: Colors.black));
      },
    );
  }

  Future firstUserPollAttempt(bool attempt, int date) async {
    var ref = userCollection
        .document(uid)
        .collection('Other Info')
        .document('User Poll Attempt');

    return await ref.get().then((docData) => !docData.exists
        ? ref.setData({'hasAttempted': attempt, 'Date': date})
        : {});
  }

  Future updateUserPollAttempt(bool attempt, int date) async {
    var ref = userCollection
        .document(uid)
        .collection('Other Info')
        .document('User Poll Attempt');

    return await ref.get().then((docData) => !docData.exists
        ? ref.setData({'hasAttempted': attempt, 'Date': date})
        : ref.updateData({'hasAttempted': attempt, 'Date': date}));
  }

  Widget checkUserPollAttempt() {
    return StreamBuilder(
        stream: Firestore.instance
            .collection('UserDatabase')
            .document(uid)
            .collection('Other Info')
            .snapshots(),
        builder: (context, snapshot) {
          print(int.parse(DateFormat('d').format(DateTime.now())));
          print(snapshot.data.documents[5]['Date']);
          if (!snapshot.hasData) return Container();
          if (int.parse(DateFormat('d').format(DateTime.now())) !=
              snapshot.data.documents[5]['Date']) {
            DatabaseService(uid: LoginPage.user.uid).updateUserPollAttempt(
                false, int.parse(DateFormat('d').format(DateTime.now())));
          }
          return Positioned(
            bottom: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 25),
                  GestureDetector(
                      onTap: !snapshot.data.documents[5]['hasAttempted']
                          ? () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) => PollQuestion(),
                                ),
                              );
                            }
                          : () {},
                      child: Container(
                        decoration: BoxDecoration(
                          color: !snapshot.data.documents[5]['hasAttempted']
                              ? Colors.teal[200]
                              : Colors.grey,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              offset: Offset(1, 1),
                              spreadRadius: 1,
                              blurRadius: 3,
                            )
                          ],
                        ),
                        width: MediaQuery.of(context).size.width,
                        height: 90,
                        child: Center(
                          child: !snapshot.data.documents[5]['hasAttempted']
                              ? Text(
                                  "GET STARTED",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                )
                              : Text(
                                  "PLEASE TRY AGAIN TOMORROW",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                        ),
                      ))
                ],
              ),
            ),
          );
        });
  }

  Future firstUserDisposeAttempt(bool attempt, int date) async {
    var ref = userCollection
        .document(uid)
        .collection('Other Info')
        .document('User Dispose Attempt');

    return await ref.get().then((docData) => !docData.exists
        ? ref.setData({'hasAttempted': attempt, 'Date': date})
        : {});
  }

  Future updateUserDisposeAttempt(bool attempt, int date) async {
    var ref = userCollection
        .document(uid)
        .collection('Other Info')
        .document('User Dispose Attempt');

    return await ref.get().then((docData) => !docData.exists
        ? ref.setData({'hasAttempted': attempt, 'Date': date})
        : ref.updateData({'hasAttempted': attempt, 'Date': date}));
  }

  Future updateUserPoints(int points) async {
    var ref = userCollection
        .document(uid)
        .collection('Other Info')
        .document('Points');

    return await ref.get().then(
        (docData) => !docData.exists ? ref.setData({'Points': points}) : {});
  }

  Widget obtainPoints() {
    return StreamBuilder(
        stream: Firestore.instance
            .collection('UserDatabase')
            .document(uid)
            .collection('Other Info')
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return Container();

          if (snapshot.data.documents[0]['Points'] >= 0 &&
              snapshot.data.documents[0]['Points'] < 300) {
            return LinearPercentIndicator(
              animation: true,
              lineHeight: 23.0,
              animationDuration: 4000,
              width: MediaQuery.of(context).size.width * 0.87,

              percent: snapshot.data.documents[0]['Points'] / 300,

              //need to set for the various levels
              center: Text("Next Level : Changer"),
              linearStrokeCap: LinearStrokeCap.roundAll,
              progressColor: Colors.teal[100],
            );
          } else if (snapshot.data.documents[0]['Points'] > 299 &&
              snapshot.data.documents[0]['Points'] < 700) {
            return LinearPercentIndicator(
              animation: true,
              lineHeight: 23.0,
              animationDuration: 4000,

              percent: snapshot.data.documents[0]['Points'] / 500,

              //need to set for the various levels
              center: Text("Next Level: Cycler"),
              linearStrokeCap: LinearStrokeCap.roundAll,
              progressColor: Colors.teal[200],
            );
          }
          return LinearPercentIndicator(
            animation: true,
            lineHeight: 23.0,
            animationDuration: 4000,

            percent: snapshot.data.documents[0]['Points'] / 700,

            //need to set for the various levels
            center: Text("You are the Gold Standard"),
            linearStrokeCap: LinearStrokeCap.roundAll,
            progressColor: Colors.teal[300],
          );
        });
  }

  Widget getPoints() {
    return StreamBuilder(
      stream: Firestore.instance
          .collection('UserDatabase')
          .document(uid)
          .collection('Other Info')
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return Container();
        if (snapshot.data.documents[0]['Points'] >= 0 &&
            snapshot.data.documents[0]['Points'] < 300) {
          setTier('BRONZE');
        } else if (snapshot.data.documents[0]['Points'] > 299 &&
            snapshot.data.documents[0]['Points'] < 700) {
          setTier('SILVER');
        } else {
          setTier('GOLD');
        }
        return Text(snapshot.data.documents[0]['Points'].toString(),
            style: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.07,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey[500]));
      },
    );
  }

  Future addUserPoints(int val) async {
    var ref = userCollection
        .document(uid)
        .collection('Other Info')
        .document('Points');

    return await ref.updateData({'Points': FieldValue.increment(val)});
  }

  Future updateUserTier(String tier) async {
    var ref =
        userCollection.document(uid).collection('Other Info').document('Tier');

    return await ref
        .get()
        .then((docData) => !docData.exists ? ref.setData({'Tier': tier}) : {});
  }

  Widget getTier() {
    return StreamBuilder(
      stream: Firestore.instance
          .collection('UserDatabase')
          .document(uid)
          .collection('Other Info')
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return Container();
        if (snapshot.data.documents[2]['Tier'] == 'BRONZE') {
          return Container(
              padding:
                  EdgeInsets.only(right: MediaQuery.of(context).size.width * 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    " Challenger".toUpperCase(),
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.06,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        color: Colors.teal[700]),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.36,
                  ),
                  CircleAvatar(
                    radius: MediaQuery.of(context).size.width * 0.07,
                    backgroundColor: Colors.grey[100],
                    child: CircleAvatar(
                      radius: MediaQuery.of(context).size.width * 0.07,
                      backgroundImage:
                          AssetImage('assets/images/challenger.png'),
                    ),
                  ),
                ],
              ));
        } else if (snapshot.data.documents[2]['Tier'] == 'SILVER') {
          return Container(
              padding: EdgeInsets.only(
                  right: MediaQuery.of(context).size.width * 0.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    " Changer ",
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.06,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        color: Colors.teal[800]),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                  ),
                  CircleAvatar(
                    radius: MediaQuery.of(context).size.width * 0.03,
                    backgroundColor: Colors.black,
                    child: CircleAvatar(
                      radius: MediaQuery.of(context).size.width * 0.7,
                      backgroundImage: AssetImage('assets/images/Changer.png'),
                    ),
                  ),
                ],
              ));
        } else {
          return Container(
              padding: EdgeInsets.only(
                  right: MediaQuery.of(context).size.width * 0.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    "Cycler".toUpperCase(),
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.06,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        color: Colors.teal[900]),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                  ),
                  CircleAvatar(
                    radius: MediaQuery.of(context).size.width * 0.07,
                    backgroundColor: Colors.grey[100],
                    child: CircleAvatar(
                      radius: MediaQuery.of(context).size.width * 0.07,
                      backgroundImage: AssetImage('assets/images/cycler.png'),
                    ),
                  ),
                ],
              ));
        }
      },
    );
  }

  Widget newTier() {
    return StreamBuilder(
      stream: Firestore.instance
          .collection('UserDatabase')
          .document(uid)
          .collection('Other Info')
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return Container();
        if (snapshot.data.documents[2]['Tier'] == 'BRONZE') {
          return Container(
              padding:
                  EdgeInsets.only(right: MediaQuery.of(context).size.width * 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text("Tier: Bronze ",
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.06,
                        color: Colors.black,
                      ))
                ],
              ));
        } else if (snapshot.data.documents[2]['Tier'] == 'SILVER') {
          return Container(
              padding: EdgeInsets.only(
                  right: MediaQuery.of(context).size.width * 0.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text("Tier: Silver ",
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.06,
                        color: Colors.black,
                      ))
                ],
              ));
        } else {
          return Container(
              padding: EdgeInsets.only(
                  right: MediaQuery.of(context).size.width * 0.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text("Gold Member",
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.06,
                        color: Colors.black,
                      ))
                ],
              ));
        }
      },
    );
  }

  Future setTier(String tier) async {
    var ref =
        userCollection.document(uid).collection('Other Info').document('Tier');

    return await ref.get().then(
        (docData) => docData.exists ? ref.updateData({'Tier': tier}) : {});
  }

  // =========== STATISTICS ===========
  Future updateUserFoodStats(int food1, int food2) async {
    var ref =
        userCollection.document(uid).collection('Statistics').document('Food');

    return await ref.get().then((docData) => !docData.exists
        ? ref.setData({'Type': 'Food', 'Value': food1})
        : ref.updateData(
            {'Type': 'Food', 'Value': FieldValue.increment(food2)}));
  }

  Future updateUserEnergyStats(int e1, int e2) async {
    var ref = userCollection
        .document(uid)
        .collection('Statistics')
        .document('Energy');

    return await ref.get().then((docData) => !docData.exists
        ? ref.setData({'Type': 'Energy', 'Value': e1})
        : ref
            .updateData({'Type': 'Energy', 'Value': FieldValue.increment(e2)}));
  }

  Future updateUserFertStats(int f1, int f2) async {
    var ref = userCollection
        .document(uid)
        .collection('Statistics')
        .document('Fertiliser');

    return await ref.get().then((docData) => !docData.exists
        ? ref.setData({'Type': 'Fertiliser', 'Value': f1})
        : ref.updateData(
            {'Type': 'Fertiliser', 'Value': FieldValue.increment(f2)}));
  }

  Future updateStats() async {
    updateUserFoodStats(0, 0);
    updateUserEnergyStats(0, 0);
    await updateUserFertStats(0, 0);
  }

  Future updateStatsOnDispose() async {
    updateUserFoodStats(0, 3);
    updateUserEnergyStats(0, 5);
    await updateUserFertStats(0, 9);
  }

  Widget getEnergy() {
    return StreamBuilder(
      stream: Firestore.instance
          .collection('UserDatabase')
          .document(uid)
          .collection('Statistics')
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return Text("");
        return Text(snapshot.data.documents[0]['Value'].toString(),
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Colors.yellow[900],
            ));
      },
    );
  }

  Widget getFertlisers() {
    return StreamBuilder(
      stream: Firestore.instance
          .collection('UserDatabase')
          .document(uid)
          .collection('Statistics')
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return Text("");
        return Text(snapshot.data.documents[1]['Value'].toString(),
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Colors.brown,
            ));
      },
    );
  }

  Widget getServings() {
    return StreamBuilder(
      stream: Firestore.instance
          .collection('UserDatabase')
          .document(uid)
          .collection('Statistics')
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return Text("");
        return Text(snapshot.data.documents[2]['Value'].toString(),
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Colors.green[800],
            ));
      },
    );
  }

  // =========== CONSUMPTION PATTERN ===========
  Future updateUserMeat(String date, int servings) async {
    var ref = userCollection
        .document(uid)
        .collection('Consumption Pattern')
        .document('Dates')
        .collection(date)
        .document('Meat');

    return await ref.get().then((docData) => !docData.exists
        ? ref.setData({'Food': 'Meat', 'Servings': servings})
        : {});
  }

  Future updateUserCarbs(String date, int servings) async {
    var ref = userCollection
        .document(uid)
        .collection('Consumption Pattern')
        .document('Dates')
        .collection(date)
        .document('Carbohydrates');

    return await ref.get().then((docData) => !docData.exists
        ? ref.setData({'Food': 'Carbohydrates', 'Servings': servings})
        : {});
  }

  Future updateUserVeg(String date, int servings) async {
    var ref = userCollection
        .document(uid)
        .collection('Consumption Pattern')
        .document('Dates')
        .collection(date)
        .document('Vegetables');

    return await ref.get().then((docData) => !docData.exists
        ? ref.setData({'Food': 'Vegetables', 'Servings': servings})
        : {});
  }

  Future updateFoodie(String date) async {
    updateUserMeat(date, 0);
    updateUserCarbs(date, 0);
    await updateUserVeg(date, 0);
  }

  void deleteUserCP(String date) {
    var ref = userCollection
        .document(uid)
        .collection('Consumption Pattern')
        .document('Dates')
        .collection(date);

    ref.getDocuments().then((snapshot) {
      for (DocumentSnapshot ds in snapshot.documents) {
        ds.reference.delete();
      }
    });
  }

  // =========== REWARDS CATALOGUE ===========
  Future resetRewards(String store, int count) async {
    var ref = storeCollection.document(store);

    return await ref.get().then(
        (docData) => docData.exists ? ref.updateData({'Count': count}) : {});
  }

  // =========== DAILY POLL Q&A RANDOM GENERATOR ===========
  Widget getPoll(int questionUID) {
    return Container(
        child: Column(
      children: <Widget>[
        getImage(questionUID),
        SizedBox(height: 10),
        getQuestion(questionUID),
      ],
    ));
  }

  Widget getImage(int questionUID) {
    return StreamBuilder(
      stream: pollCollection.snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return Container();
        return Image.network(snapshot.data.documents[questionUID]['imageURL'],
            width: MediaQuery.of(context).size.width * 0.55);
      },
    );
  }

  Widget getQuestion(int questionUID) {
    return StreamBuilder(
      stream: pollCollection.snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return Container();
        return Text(snapshot.data.documents[questionUID]['Question'],
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: MediaQuery.of(context).size.width * 0.04,
            ));
      },
    );
  }

  void writeCollector(name, coordinate, landmark) {}

  // =========== DAILY POLL Q&A RANDOM GENERATOR ===========
  Future updateForumThread(String postUID, String author, String date,
      String title, String description) async {
    var ref = forumCollection.document(uid);

    return await ref.get().then((docData) => !docData.exists
        ? ref.setData({
            'postUID': postUID,
            'author': author,
            'date': date,
            'title': title,
            'description': description
          })
        : {});
  }

  void updateThreadReplies(
      String titleupload, String sender, String date, String message) async {
    await firestore
        .collection('ForumDatabase')
        .document(titleupload)
        .collection('Replies')
        .document(sender)
        .setData({
      'date': date,
      'description': message,
      'name': sender,
    });
  }

  Widget getThreads() {
    return StreamBuilder(
      stream: forumCollection.snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return Container();
        return ListView.builder(
          itemCount: snapshot.data.documents.length,
          itemBuilder: (context, index) {
            return new Container(
                child: Card(
                    child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                              child: Row(children: <Widget>[
                                Text(snapshot.data.documents[index]['author']),
                                Text("  "),
                                Text(snapshot.data.documents[index]['date']),
                              ]),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                              child: Row(children: <Widget>[
                                Text(snapshot.data.documents[index]['title'],
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                              ]),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                              child: Row(children: <Widget>[
                                Text(
                                  snapshot.data.documents[index]['description'],
                                ),
                              ]),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                              child: Row(children: <Widget>[
                                GestureDetector(
                                    child: Icon(Icons.thumb_up), onTap: () {

                                 

                                    }),
                                     SizedBox(width: 0),
                               //follow the voting count 
                                    Text(
                                  snapshot.data.documents[index]['count'].toString(),
                                ),
                                SizedBox(width: 20),
                               
                                
                                GestureDetector(
                                    child: Icon(Icons.share),
                                    onTap: () => {} //share(context)
                                    ),
                              ]),
                            ),
                          ],
                        ))));
          },
        );
      },
    );
  }
}
