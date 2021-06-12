import 'package:flutter/material.dart';
import 'package:motintegrated/screens/authentication.dart';

class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Row(
              children: [
                SingleChildScrollView(child: 
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height / 1.75),
                    Text('Miracle',
                        style: TextStyle(
                            fontFamily: 'Jost',
                            color: Color(0xff9D8671),
                            fontSize: 60,
                            height: 1.4,
                            fontWeight: FontWeight.w700)),
                    Text('Of Trash',
                        style: TextStyle(
                            fontFamily: 'Jost',
                            color: Color(0xff9D8671),
                            fontSize: 60,
                            height: 1,
                            fontWeight: FontWeight.w700)),
                    Padding(
                      padding: const EdgeInsets.only(top: 8, bottom: 25),
                      child: Container(
                          width: MediaQuery.of(context).size.width / 1.17,
                          child: Text(
                              'Food waste is valuable, biodegradable waste can be exploited. We take garbage from you. You receive special deals from us.',
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: 'Jost',
                                  color: Color(0xff545454),
                                  height: 1.1,
                                  fontWeight: FontWeight.w500))),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => (Authen())));
                      },
                      style: ElevatedButton.styleFrom(
                          primary: Color(0xFF4A5F30),
                          // elevation: 5,
                          padding: EdgeInsets.symmetric(
                            horizontal: 17,
                            vertical: 6,
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40.0))),
                      child: Row(
                        children: [
                          Text(
                            'Get start',
                            style: TextStyle(
                                fontFamily: 'Jost',
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.w600),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0,),
                            child: Icon(
                              Icons.arrow_forward,
                              size: 30,
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(padding: const EdgeInsets.only(bottom: 15.0,),),
                  ],
                ),
                )
              ],
            ),
          ),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/welcome.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
