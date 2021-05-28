import 'package:flutter/material.dart';
import 'package:motintegrated/screens/signin.dart';

class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        body: Container(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.only(top: 440, left: 30),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Miracle',
                        style: TextStyle(
                          fontFamily: 'Jost',
                            color: Color(0xff9D8671),
                            fontSize: 57,
                            height: 1.4,
                            fontWeight: FontWeight.w700)),
                    Text('Of Trash',
                        style: TextStyle(
                          fontFamily: 'Jost',
                            color: Color(0xff9D8671),
                            fontSize: 57,
                            height: 1,
                            fontWeight: FontWeight.w700)),
                    Padding(
                      padding: const EdgeInsets.only(top: 8, bottom: 30),
                      child: Container(
                          width: 340,
                          child: Text(
                              'MOT is an application for something bra bra barbrba lxdfjsd dfjsdf sdfkjsdkfjdjf that iedjd dskfjsd is to the moon doi theerjsdfo sjkdfs sjkdf dzkf',
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                fontFamily: 'Jost',
                                  color: Color(0xff545454),
                                  height: 1.3,
                                  fontWeight: FontWeight.w500))),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => (SignIn())));
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
                      child: 
                      Row(
                        children: [
                          Text(
                            'Get start',
                            style: TextStyle(
                              fontFamily: 'Jost',
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Icon(Icons.arrow_forward, size: 30,),
                          )
                        ],
                      ),
                    )
                  ],
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
