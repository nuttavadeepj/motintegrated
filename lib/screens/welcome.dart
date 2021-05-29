import 'package:flutter/material.dart';
import 'package:motintegrated/screens/authen.dart';

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
                      padding: const EdgeInsets.only(top: 8, bottom: 30),
                      child: Container(
                          width: MediaQuery.of(context).size.width / 1.17,
                          child: Text(
                              'Would it be better if the garbage you left every day can create benefits for you. We will change your food waste into biogas! It is not just you give a garbage  for us, but in MOT you will get reward points to redeem items in special deal.',
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                  fontSize: 13.5,
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
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Icon(
                              Icons.arrow_forward,
                              size: 30,
                            ),
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
