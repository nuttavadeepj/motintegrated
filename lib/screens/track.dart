import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:motintegrated/widgets/hamburger.dart';
import 'package:qrscan/qrscan.dart' as scanner;

class TrackPage extends StatefulWidget {
  @override
  _TrackPageState createState() => _TrackPageState();
}

class _TrackPageState extends State<TrackPage> {
  var scanresult = [];

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
        child: SizedBox(
            height: 300,
            width: double.infinity,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "My trash bag",
                      style: TextStyle(fontSize: 23, fontWeight: FontWeight.w500, fontFamily: 'Jost'),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ...scanresult
                  ],
                ),
              ),
            )),
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/track.png"),
            fit: BoxFit.cover,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
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
      scanresult.add(Container( decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            
            border: Border.all(
                    color: Color(0xFFE6E7C1),
                    width: 2,
                  )

            
            ),
          
      width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start ,children: [
        Text("Name: ${item[n]["name"]}", style: TextStyle(fontSize: 16),),
        Text("ID: ${item[n]["id"]}", style: TextStyle(fontSize: 16)),
        Text("Scan Date: ${DateFormat('yyyy-MM-dd').format(DateTime.now())}", style: TextStyle(fontSize: 16))
      ]),
          )));
    });
  }
}
