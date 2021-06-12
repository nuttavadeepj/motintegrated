import 'package:flutter/material.dart';
import 'package:motintegrated/widgets/hamburger.dart';
import 'package:motintegrated/widgets/button.dart';
import 'package:motintegrated/screens/aboutus.dart';
import 'package:motintegrated/screens/shop.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      drawer: NavigationDrawerWidget(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color(0xFF4A5F30)),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/homebg.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(children: [
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
            Padding(
              padding: const EdgeInsets.only(
                  left: 40, right: 40, top: 10, bottom: 20),
              child: Text(
                '     Would it be better if the garbage you left every day can create benefits for you. We will change your food waste into biogas! It is not just you give a garbage  for us, but in MOT you will get reward points to redeem items in special deal.',
                style: TextStyle(fontSize: 18, fontFamily: 'Jost', height: 1.3),
                textAlign: TextAlign.justify,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 30.0),
                  child: AboutButton(
                      text: 'About',
                      width: 130.0,
                      height: 43.0,
                      onPressed: () => {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AboutUs()),
                            ),
                          }),
                ),
                Button(
                    text: 'Product',
                    width: 130.0,
                    onPressed: () => {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ShopPage()),
                          ),
                        })
              ],
            )
          ])),
    );
  }
}
