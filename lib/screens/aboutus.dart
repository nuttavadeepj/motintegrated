import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double detail = MediaQuery.of(context).size.width * 0.9;

    return MaterialApp(
      home: Scaffold(
        body: new Container(
          child: Padding(
            padding: const EdgeInsets.only(top: 380, left: 30),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      'images/mot-logo.png',
                      width: 217.74,
                      height: 127.54,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 30),
                      child: new Container(
                        width: detail,
                        child: Column(
                          children: <Widget>[
                            Text.rich(
                              TextSpan(
                                  text: 'Miracle of Trash or MOT',
                                  style: TextStyle(
                                    fontFamily: 'Jost',
                                    fontWeight: FontWeight.w600,
                                    height: 1.6,
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text:
                                          ' is the application for Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud amet. Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud amet.ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud amet. Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.',
                                      style: TextStyle(
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ]),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                      width: 1.5, color: Color(0xff4A5F30)),
                                ),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 20),
                                ),
                                Text('Contact Us',
                                    style: TextStyle(
                                        fontFamily: 'Jost',
                                        fontWeight: FontWeight.w600,
                                        fontSize: 20)),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Text.rich(
                                    TextSpan(children: [
                                      WidgetSpan(
                                        child: Icon(
                                          Icons.email_rounded,
                                          color: Color(0xff8F8F8F),
                                          size: 16.0,
                                        ),
                                      ),
                                      TextSpan(
                                          text: ' motofficial@gmail.com',
                                          style: TextStyle(
                                            fontFamily: 'Jost',
                                            height: 1.6,
                                          ))
                                    ]),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Text.rich(
                                    TextSpan(children: [
                                      WidgetSpan(
                                          child: FaIcon(
                                        FontAwesomeIcons.facebook,
                                        color: Color(0xff8F8F8F),
                                        size: 16.0,
                                      )),
                                      TextSpan(
                                          text: ' MOT Official',
                                          style: TextStyle(
                                            fontFamily: 'Jost',
                                            height: 1.6,
                                          ))
                                    ]),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Text.rich(
                                    TextSpan(children: [
                                      WidgetSpan(
                                        child: Icon(
                                          Icons.phone_android_rounded,
                                          color: Color(0xff8F8F8F),
                                          size: 16.0,
                                        ),
                                      ),
                                      TextSpan(
                                          text: ' 085 555 5555',
                                          style: TextStyle(
                                            fontFamily: 'Jost',
                                            height: 1.6,
                                          ))
                                    ]),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/about-us.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
