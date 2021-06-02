import 'package:flutter/material.dart';

class SpacialDeal extends StatelessWidget {
  final List<String> shopPictureList = [
    "https://cdn.pixabay.com/photo/2017/12/03/18/04/christmas-balls-2995437_960_720.jpg",
    "https://cdn.pixabay.com/photo/2017/12/13/00/23/christmas-3015776_960_720.jpg",
    "https://cdn.pixabay.com/photo/2019/12/19/10/55/christmas-market-4705877_960_720.jpg",
    "https://cdn.pixabay.com/photo/2019/12/20/00/03/road-4707345_960_720.jpg",
    "https://cdn.pixabay.com/photo/2016/11/22/07/09/spruce-1848543__340.jpg"
  ];

  Widget build(BuildContext context) {
    void openDialog() {
      showDialog(
        context: context,
        builder: (context) => SimpleDialog(
          title: ListTile(
            title: Center(
              child: Text(
                'Change password',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          children: [
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 33),
                child: Form(
                    child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(labelText: ('Enter your email')),
                  // validator: (value) {
                  //   if (value.isEmpty) {
                  //     return "Please input an email";
                  //   }
                  // },
                  onChanged: (value) {},
                ))),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      style: ElevatedButton.styleFrom(
                          minimumSize: Size(103, 30),
                          primary: Colors.grey,
                          padding: EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 8,
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(5.0))),
                      child: Text(
                        'Cancel',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                  Padding(
                    padding: EdgeInsets.all(5.0),
                  ),
                  // ElevatedButton(
                  //   onPressed: () {
                  //     if (_formKey.currentState.validate()) {
                  //       auth.sendPasswordResetEmail(email: _email);
                  //       Navigator.of(context).pop();
                  //       print("Password was sent");
                  //       openCheckEmail();
                  //     }
                  //   },
                  //   style: ElevatedButton.styleFrom(
                  //       minimumSize: Size(103, 30),
                  //       primary: Color(0xFFE17262),
                  //       padding: EdgeInsets.symmetric(
                  //         horizontal: 25,
                  //         vertical: 8,
                  //       ),
                  //       shape: RoundedRectangleBorder(
                  //           borderRadius: new BorderRadius.circular(5.0))),
                  //   child: Text(
                  //     'Request',
                  //     style: TextStyle(
                  //       color: Colors.white,
                  //       fontSize: 14,
                  //       fontWeight: FontWeight.bold,
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    double detail = MediaQuery.of(context).size.width * 0.9;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Container(
          child: Container(
              width: detail,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 60, bottom: 15.0),
                    child: RichText(
                      text: TextSpan(
                        text: 'Spacial Deal',
                        style: TextStyle(
                          fontSize: 35,
                          fontFamily: 'Jost',
                          fontWeight: FontWeight.w600,
                          color: Color(0xff323232),
                        ),
                      ),
                    ),
                  ),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: 'points\n',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                          fontSize: 16),
                      children: [
                        TextSpan(
                          text: '0',
                          style: TextStyle(
                            fontFamily: 'Jost',
                            height: 1.1,
                            fontSize: 65,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff4A5F30),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              color: Color(0xffE6E7C1)),
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.only(left: 20, right: 20.0),
            child: Center(
              child: Column(children: [
                Container(
                  margin: const EdgeInsets.only(
                    top: 30.0,
                  ),
                  height: 130,
                  color: Color(0xffFFFBF2),
                  child: Container(
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15.0),
                          child: Image.network(
                            'https://picsum.photos/250?image=9',
                          ),
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 10, left: 15),
                              child: RichText(
                                textAlign: TextAlign.left,
                                text: TextSpan(
                                  text: 'Use 50 points\n',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                      fontSize: 28),
                                  children: [
                                    TextSpan(
                                      text:
                                          'Get free 1 kg. vegetables from \nthe organic farm.',
                                      style: TextStyle(
                                        fontFamily: 'Jost',
                                        height: 1.1,
                                        fontSize: 15,
                                        fontWeight: FontWeight.normal,
                                        color: Color(0xff000000),
                                      ),
                                    
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(color: Colors.black, blurRadius: 3)
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  color: Colors.amber[500],
                  child: const Center(child: Text('Entry B')),
                ),
                Container(
                  height: 50,
                  color: Colors.amber[100],
                  child: const Center(child: Text('Entry C')),
                ),
              ]),
            ),
            color: Color(0xffFFFBF2),
          ),
        ),
      ],
    );
  }
}
