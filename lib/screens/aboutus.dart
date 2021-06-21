import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:motintegrated/widgets/hamburger.dart';

class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double detail = MediaQuery.of(context).size.width * 0.9;

    return MaterialApp(
      home: Scaffold(
        drawer: NavigationDrawerWidget(),
        appBar: AppBar(
        title: Text(
          'About',
          style: TextStyle(
              color: Color(0xFF323232), fontSize: 21, fontFamily: 'Jost'),
        ),
        iconTheme: IconThemeData(color: Color(0xFF4A5F30)),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
      ),
        body: Container(
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.only(top: 300, left: 30, right: 30),
              child: 
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        'images/mot-logo.png',
                        width: 217.74,
                        height: 120.54,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 30),
                        child: Container(
                          width: detail,
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: Text(
                                  '          Do you know that the compostable waste such as fruit debris, fruit peel, leaves, meat debris can be used again? ',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'Jost',
                                      height: 1.3),
                                  textAlign: TextAlign.justify,
                                  
                                ),
                              ),
                              RichText(
                                textAlign: TextAlign.justify,
                                text: TextSpan(
                                    text: '          Miracle of Trash (MOT)',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: 16),
                                    children: [
                                      TextSpan(
                                          text:
                                              ' is a service that encourages you to separate waste and application for receiving and managing biodegradable waste (food waste) from households, markets, and small restaurants. You just use our trash bags and we will receive a compostable waste from you. You send us the waste then we will have many special deals for you. Earn and accumulate points to redeem items in our deals on the special deal page.',
                                          style: TextStyle(
                                            fontFamily: 'Jost',
                                            height: 1.3,
                                            fontWeight: FontWeight.normal,
                                            color: Colors.black,
                                          ))
                                    ]),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 15),
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
                                    padding: const EdgeInsets.only(bottom: 15),
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
            ),
           
          ),
         decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/about-us.png"),
                fit: BoxFit.cover,
              ),
            ),),
      ),
    );
  }
}
