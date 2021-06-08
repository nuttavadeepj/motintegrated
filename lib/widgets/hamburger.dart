import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:motintegrated/screens/home.dart';
import 'package:motintegrated/screens/aboutus.dart';
import 'package:motintegrated/screens/shop.dart';
import 'package:motintegrated/screens/profile.dart';
import 'package:motintegrated/screens/track.dart';
import 'package:motintegrated/screens/specialdeal.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:motintegrated/screens/authentication.dart';

class NavigationDrawerWidget extends StatelessWidget {
  final padding = EdgeInsets.symmetric(horizontal: 20);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: Color(0xFFF8F8ED),
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 38, top: 40),
              child: Container(
                width: 200,
                height: 120,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage("images/logo.png"),
                )),
              ),
            ),
            SizedBox(height: 1),
            CustomListTile(
                FaIcon(FontAwesomeIcons.home,
                    size: 21, color: Color(0xff323232)),
                'Home',
                () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Home()),
                      )
                    }),
            CustomListTile(
                FaIcon(FontAwesomeIcons.infoCircle,
                    size: 21, color: Color(0xff323232)),
                'About',
                () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AboutUs()),
                      ),
                    }),
            CustomListTile(
                FaIcon(FontAwesomeIcons.store,
                    size: 21, color: Color(0xff323232)),
                'Shop',
                () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ShopPage()),
                      ),
                    }),
            CustomListTile(
                FaIcon(FontAwesomeIcons.ticketAlt,
                    size: 21, color: Color(0xff323232)),
                'Deal',
                () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SpecialDeal()),
                      ),
                    }),
            CustomListTile(
                FaIcon(FontAwesomeIcons.truck,
                    size: 21, color: Color(0xff323232)),
                'Tracking',
                () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => TrackPage()),
                      ),
                    }),
            Divider(color: Color(0xff4A5F30)),
            CustomListTile(
                FaIcon(FontAwesomeIcons.signOutAlt, color: Color(0xff323232)),
                'Signout', () async {
              await Firebase.initializeApp().then((value) async {
                await FirebaseAuth.instance.signOut().then((value) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => Authen()),
                  );
                });
              });
            }),
            SizedBox(height: 110),
            Profile(
                AssetImage("images/profile.jpg"),
                'Porjuu',
                'hellop@gmail.com',
                () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ProfilePage()),
                      ),
                    }),
          ],
        ),
      ),
    );
  }
}

class Profile extends StatelessWidget {
  final image;
  String name;
  String email;
  final onTap;
  Profile(this.image, this.name, this.email, this.onTap);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 2),
        child: InkWell(
            splashColor: Colors.red,
            onTap: onTap,
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                color: Color(0xffDCDDA6),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
              ),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 10, left: 20),
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: image,
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 190,
                            child: Expanded(
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 8),
                                  child: Text(
                                    name,
                                    style: TextStyle(
                                        fontSize: 20, color: Color(0xff4A5F30)),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                          Container(
                            width: 190,
                            child: Expanded(
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Text(
                                  email,
                                  style: TextStyle(
                                      fontSize: 20, color: Color(0xff4A5F30)),
                                ),
                              ),
                            ),
                          )
                        ]),
                  )
                ],
              ),
            )));
  }
}

class CustomListTile extends StatelessWidget {
  FaIcon faIcon;
  String text;
  final onTap;
  CustomListTile(this.faIcon, this.text, this.onTap);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(22.0, 0, 8.0, 0),
      child: InkWell(
        splashColor: Color(0xffDCDDA6),
        onTap: onTap,
        child: Container(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(children: <Widget>[
                Container(width: 22, child: faIcon),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Text(text,
                      style: TextStyle(
                          color: Color(0xff4A5F30),
                          fontSize: 20,
                          fontWeight: FontWeight.w400)),
                )
              ])
            ],
          ),
        ),
      ),
    );
  }
}
