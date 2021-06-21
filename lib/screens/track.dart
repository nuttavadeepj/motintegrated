import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:motintegrated/widgets/button.dart';
import 'package:motintegrated/widgets/hamburger.dart';
import 'package:qrscan/qrscan.dart' as scanner;

class TrackPage extends StatefulWidget {
  @override
  State<TrackPage> createState() => _TrackPageState();
}

class _TrackPageState extends State<TrackPage> {
  var db;

  var scanresult = [];
  bool isWaiting = false;
  @override
  void initState() {
    super.initState();
    getId();
  }

  void readyCollect() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Center(
                  child: Text('Confirmation',
                      style: TextStyle(
                          fontSize: 25, fontWeight: FontWeight.w500))),
              content: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Text(
                  'Do you want us to collect this trash bag?',
                  textAlign: TextAlign.center,
                ),
              ),
              actions: [
                FlatButton(
                  textColor: Colors.black,
                  onPressed: () => Navigator.pop(context),
                  child: Text('CANCEL',
                      style: TextStyle(color: Colors.black54, fontSize: 16)),
                ),
                FlatButton(
                  textColor: Colors.black,
                  onPressed: () {
                    Navigator.pop(context);
                    confirmDialog();
                    setState(() {
                      isWaiting = true;
                    });
                  },
                  child: Text('CONFIRM',
                      style: TextStyle(fontSize: 16, color: Color(0xFF4A5F30))),
                ),
              ],
            ));
  }

  void confirmDialog() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Center(
                  child: Text(
                      'The staff will call back to you within 24 hours. Thank you for using our service.',
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w400))),
              actions: [
                FlatButton(
                  textColor: Colors.black,
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => TrackPage()));
                  },
                  child: Text('CLOSE',
                      style: TextStyle(fontSize: 16, color: Color(0xFF4A5F30))),
                ),
              ],
            ));
  }

  Future<void> getId() async {
    var firebaseUser = await FirebaseAuth.instance.currentUser!;
    var database = await FirebaseFirestore.instance
        .collection('user')
        .doc(firebaseUser.uid);
    setState(() {
      db = database;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawerWidget(),
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Tracking',
          style: TextStyle(
              color: Color(0xFF323232), fontSize: 20, fontFamily: 'Jost'),
        ),
        iconTheme: IconThemeData(color: Color(0xFF4A5F30)),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: db.collection('orderid').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else
            return Container(
              child: Column(
                children: [
                  SizedBox(
                    height: 250,
                    width: double.infinity,
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 15.0, right: 15, top: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Tracking number",
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Jost'),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 160,
                              color: Color(0xFFE6E7C1),
                              child: ListView(
                                children: snapshot.data!.docs.map((doc) {
                                  return Card(
                                      child: ListTile(
                                    title: Text(
                                      'TrackNo: ${doc.data()['trackno']}',
                                      style: TextStyle(fontFamily: 'Jost', fontSize: 17),
                                    ),
                                    subtitle: Text(
                                        'OrderId: ${doc.data()['orderid']}',
                                      style: TextStyle(fontFamily: 'Jost', fontSize: 15)),
                                  ));
                                }).toList(),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
              height: 350,
              width: double.infinity,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "My trash bag",
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Jost'),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        ...scanresult
                      ]),
                ),
              ),
            ),
                ],
              ),
              padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/track.png"),
            fit: BoxFit.cover,
          ),
        ),
            );
        },
      ),
     floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF4A5F30),
        onPressed: startScan,
        child: Icon(Icons.qr_code_scanner),
      ),);
  }
  startScan() async {
    try {
      await scanner.scanPhoto();
    } catch (error) {}
    var item = [
      {
        "id": "B234C1",
        "name": "Orange Bag",
      },
      {
        "id": "B456C2",
        "name": "Purple Bag",
      },
      {
        "id": "B789C3",
        "name": "Pink Bag",
      },
      {
        "id": "B123C4",
        "name": "Orange Bag",
      },
      {
        "id": "B456C5",
        "name": "Purple Bag",
      },
      {
        "id": "B789C6",
        "name": "Pink Bag",
      },
      {
        "id": "M123T1",
        "name": "Orange Bag",
      },
      {
        "id": "M456T2",
        "name": "Purple Bag",
      },
      {
        "id": "M789T3",
        "name": "Pink Bag",
      },
      {
        "id": "M123T4",
        "name": "Orange Bag",
      },
      {
        "id": "M456T5",
        "name": "Purple Bag",
      },
      {
        "id": "M789T6",
        "name": "Pink Bag",
      },
      {
        "id": "M123T7",
        "name": "Orange Bag",
      },
      {
        "id": "M456T8",
        "name": "Purple Bag",
      },
      {
        "id": "M789T9",
        "name": "Pink Bag",
      },
      {
        "id": "M123T10",
        "name": "Orange Bag",
      },
      {
        "id": "M456T11",
        "name": "Purple Bag",
      },
      {
        "id": "M789T12",
        "name": "Pink Bag",
      },
      {
        "id": "M123T13",
        "name": "Orange Bag",
      },
      {
        "id": "M456T14",
        "name": "Purple Bag",
      }
    ];
    var n = Random().nextInt(item.length);
    setState(() {
      scanresult.add(Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              border: Border.all(
                color: Color(0xFFE6E7C1),
                width: 2,
              )),
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                children: [
                  SizedBox(
                    width: 135,
                    child: Text(
                      "Name: ${item[n]["name"]}",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 50.0),
                    child: isWaiting
                        ? WaitingButton(
                            text: 'waiting', width: 118.0, onPressed: () {})
                        : CollectButton(
                            text: 'ready to collect',
                            width: 118.0,
                            onPressed: () {
                              readyCollect();
                            }),
                  ),
                ],
              ),
              Text("ID: ${item[n]["id"]}", style: TextStyle(fontSize: 16)),
              Text(
                  "Scan Date: ${DateFormat('yyyy-MM-dd').format(DateTime.now())}",
                  style: TextStyle(fontSize: 16))
            ]),
          )));
    });
  }
}
