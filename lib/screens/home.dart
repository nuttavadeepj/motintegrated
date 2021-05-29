import 'package:flutter/material.dart';
import 'package:motintegrated/widgets/hamburger.dart';
import '../main.dart';


class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawerWidget(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color(0xFF4A5F30)),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),

      body: Container(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 38, top: 80),
                  child: Container(
                    width: 200,
                    height: 120,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage("images/logo.png"),
                    )),
                  ),
                ),
              ],
            ),
            Text('this is home')
           
          ]))
    );
  }
}

 