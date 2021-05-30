import 'package:flutter/material.dart';
import 'package:motintegrated/widgets/hamburger.dart';
import 'package:motintegrated/widgets/textfield.dart';
import 'package:motintegrated/widgets/button.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavigationDrawerWidget(),
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Profile',
            style: TextStyle(
                color: Color(0xFF323232), fontSize: 26, fontFamily: 'Jost'),
          ),
          iconTheme: IconThemeData(color: Color(0xFF4A5F30)),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        body: Center(
          child: Container(
              width: MediaQuery.of(context).size.width / 1.23,
              child: SingleChildScrollView(
                child: Column(children: [
                  Container(
                    margin: EdgeInsets.only(top: 100),
                    child: Stack(
                      overflow: Overflow.visible,
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: Color(0xFFE6E7C1),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Column(children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 38.0, bottom: 12),
                              child: Container(
                                alignment: Alignment.center,
                                width: 260,
                                child: Expanded(
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Text(
                                      'Nuttavadee Autsavapanakit',
                                      style: TextStyle(
                                          color: Color(0xFF323232),
                                          fontSize: 20,
                                          fontFamily: 'Jost',
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Text('Point',
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 17,
                                    fontFamily: 'Jost',
                                    fontWeight: FontWeight.w500)),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 7.0),
                              child: Text('0',
                                  style: TextStyle(
                                      height: 1.1,
                                      color: Color(0xFF4A5F30),
                                      fontSize: 56,
                                      fontFamily: 'Jost',
                                      fontWeight: FontWeight.w600)),
                            ),
                          ]),
                        ),
                        Positioned(
                          top: -110,
                          left: 100,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 25.0),
                            child: Container(
                              width: 115,
                              height: 115,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border:
                                      Border.all(color: Colors.white, width: 6),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage("images/profile.jpg"),
                                  )),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      StyledTextField(
                          label: 'Email',
                          hintText: 'Email',
                          errorText: 'Error'),
                      StyledTextField(
                          label: 'Phone Number',
                          hintText: 'Phone Number',
                          errorText: 'Error'),
                      StyledTextField(
                          label: 'Address',
                          hintText: 'Address',
                          errorText: 'Error',
                          isAddress: true),
                      ProfileButton(text: 'Save', width: 130.0, height: 40.0, onPressed: () {})
                    ],
                  ),
                ]),
              )),
        ));
  }
}
