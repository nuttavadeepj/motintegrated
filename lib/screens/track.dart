import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:motintegrated/models/order.dart';
import 'package:motintegrated/widgets/button.dart';
import 'package:motintegrated/widgets/hamburger.dart';
import 'package:qrscan/qrscan.dart' as scanner;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

class TrackPage extends StatefulWidget {
  @override
  _TrackPageState createState() => _TrackPageState();
}

class _TrackPageState extends State<TrackPage> {
  var scanresult = [];
  var orderid;
  var trackno;

  @override
  void initState() {
    super.initState();
    getOrder();
  }

  Future<void> getOrder() async {
    final firebaseUser = await FirebaseAuth.instance.currentUser!;
    await Firebase.initializeApp().then((value) async {
      await FirebaseFirestore.instance
          .collection('user')
          .doc(firebaseUser.uid)
          .snapshots()
          .listen((event) async {
        setState(() {
          orderid = event.data()!['orderid'];
        });
        print('order ja => $orderid');
        await FirebaseFirestore.instance
          .collection('order')
          .doc(orderid)
          .snapshots()
          .listen((event) {
        setState(() {
          trackno = event.data()!['trackno'];
        });
        print('track naja => $trackno');
      });
      });
      
    });
  }

  // Future<void> getTrackNo() async {
  //   await Firebase.initializeApp().then((value) async {
  //     await FirebaseFirestore.instance
  //         .collection('order')
  //         .doc(orderid)
  //         .snapshots()
  //         .listen((event) {
  //       setState(() {
  //         trackno = event.data()!['trackno'];
  //       });
  //       print('track naja => $trackno');
  //     });
  //   });
  // }

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
                  onPressed: () => Navigator.pop(context),
                  child: Text('CLOSE',
                      style: TextStyle(fontSize: 16, color: Color(0xFF4A5F30))),
                ),
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawerWidget(),
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Tracking',
          style: TextStyle(
              color: Color(0xFF323232), fontSize: 26, fontFamily: 'Jost'),
        ),
        iconTheme: IconThemeData(color: Color(0xFF4A5F30)),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(
                height: 200,
                width: double.infinity,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
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
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                                border: Border.all(
                                  color: Color(0xFFE6E7C1),
                                  width: 2,
                                )),
                            width: MediaQuery.of(context).size.width,
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Order ID: $orderid",
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    Text("Tracking No: $trackno",
                                        style: TextStyle(fontSize: 16))
                                  ]),
                            )),
                        SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  ),
                )),
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
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF4A5F30),
        onPressed: startScan,
        child: Icon(Icons.qr_code_scanner),
      ),
    );
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
                    child: CollectButton(
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
