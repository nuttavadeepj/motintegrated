import 'package:flutter/material.dart';
import 'package:motintegrated/screens/welcome.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'MOT', theme: ThemeData(fontFamily: 'Jost'), home: Welcome());
  }
}
