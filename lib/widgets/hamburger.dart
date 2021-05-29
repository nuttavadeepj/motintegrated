import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:motintegrated/screens/home.dart';
import 'package:motintegrated/screens/aboutus.dart';
import 'package:motintegrated/screens/shop.dart';

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
            const SizedBox(height: 24),
            CustomListTile(
                FaIcon(FontAwesomeIcons.home),
                'Home',
                () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Home()),
                      )
                    }),
            const SizedBox(height: 10),
            CustomListTile(
                FaIcon(FontAwesomeIcons.infoCircle),
                'About',
                () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AboutUs()),
                      ),
                      print('press')
                    }),
            const SizedBox(height: 10),
            CustomListTile(FaIcon(FontAwesomeIcons.store), 'Shop', () => {}),
            const SizedBox(height: 10),
            CustomListTile(
                FaIcon(FontAwesomeIcons.ticketAlt), 'Deal', () => {}),
            CustomListTile(
                FaIcon(FontAwesomeIcons.truck), 'Tracking', () => {}),
            Divider(color: Color(0xff4A5F30)),
            const SizedBox(height: 10),
            CustomListTile(
                FaIcon(FontAwesomeIcons.signOutAlt), 'Signout', () => {}),
            const SizedBox(height: 80),
            Profile('Porju', 'helloporju', () => {})
          ],
        ),
      ),
    );
  }
}

class Profile extends StatelessWidget {
  String name;
  String email;
  Function onTap;
  Profile(this.name, this.email, this.onTap);
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 2),
        child: InkWell(
            splashColor: Colors.red,
            onTap: () {},
            child: Container(
              height: 100,
              color: Color(0xffDCDDA6),
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
                          image: AssetImage("images/profile.jpg"),
                        )),
                  ),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Text(
                            'Porju',
                            style: TextStyle(
                                fontSize: 20, color: Color(0xff4A5F30)),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'helloporju@gmail.com',
                          style:
                              TextStyle(fontSize: 20, color: Color(0xff4A5F30)),
                        )
                      ])
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
      padding: const EdgeInsets.fromLTRB(20.0, 0, 8.0, 0),
      child: InkWell(
        splashColor: Color(0xffDCDDA6),
        onTap: onTap,
        child: Container(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(children: <Widget>[
                Container(width: 25, child: faIcon),
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
