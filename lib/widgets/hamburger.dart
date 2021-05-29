import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NavigationDrawerWidget extends StatelessWidget {
  final padding = EdgeInsets.symmetric(horizontal: 20);
  @override
  Widget build(BuildContext context) {
    // final name = 'Porju';
    // final email = 'helloporju@gmail.com';

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
            CustomListTile(FaIcon(FontAwesomeIcons.home), 'Home', () => {}),
            const SizedBox(height: 10),
            CustomListTile(
                FaIcon(FontAwesomeIcons.infoCircle), 'About', () => {}),
            const SizedBox(height: 10),
            CustomListTile(FaIcon(FontAwesomeIcons.store), 'Shop', () => {}),
            const SizedBox(height: 10),
            CustomListTile(
                FaIcon(FontAwesomeIcons.ticketAlt), 'Deal', () => {}),
            const SizedBox(height: 24),
            Divider(color: Color(0xff4A5F30)),
            const SizedBox(height: 24),
            CustomListTile(
                FaIcon(FontAwesomeIcons.signOutAlt), 'Login', () => {}),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 12),
              child: Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("images/profile.jpg"),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomListTile extends StatelessWidget {
  FaIcon faIcon;
  String text;
  Function onTap;
  CustomListTile(this.faIcon, this.text, this.onTap);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20.0, 0, 8.0, 0),
      child: InkWell(
        splashColor: Color(0xffDCDDA6),
        onTap: () {},
        child: Container(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(children: <Widget>[
                faIcon,
                Padding(
                  padding: const EdgeInsets.all(20.0),
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
