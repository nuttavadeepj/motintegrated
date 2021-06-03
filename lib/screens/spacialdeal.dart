import 'package:flutter/material.dart';

class SpacialDeal extends StatelessWidget {
  final List<String> shopPictureList = [
    "https://cdn.pixabay.com/photo/2017/12/03/18/04/christmas-balls-2995437_960_720.jpg",
    "https://cdn.pixabay.com/photo/2017/12/13/00/23/christmas-3015776_960_720.jpg",
    "https://cdn.pixabay.com/photo/2019/12/19/10/55/christmas-market-4705877_960_720.jpg",
    "https://cdn.pixabay.com/photo/2019/12/20/00/03/road-4707345_960_720.jpg",
    "https://cdn.pixabay.com/photo/2016/11/22/07/09/spruce-1848543__340.jpg"
  ];

  final List<String> spacialDetailList = [
    "Get free 1 kg. vegetables from the organic farm.",
    "Get free 1 icecream from monthlyking shop.",
    "get discount 5% coupon at starduck coffee.",
    "Get free 1 kg. vegetables from the organic farm.",
    "Get free 1 icecream from monthlyking shop."
  ];

  final List<int> spacialPriceList = [
    50,
    20,
    50,
    50,
    20,
  ];

  Widget build(BuildContext context) {
    double c_width = MediaQuery.of(context).size.width * 0.58;
    void _showcontent() {
      showDialog(
        context: context, barrierDismissible: false, // user must tap button!

        builder: (BuildContext context) {
          return new AlertDialog(
            title: new Text('You clicked on'),
            content: new SingleChildScrollView(
              child: new ListBody(
                children: [
                  new Text('This is a Dialog Box. Click OK to Close.'),
                ],
              ),
            ),
            actions: [
              new FlatButton(
                child: new Text('Ok'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    var box = Container(
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
            Container(
              width: c_width,
              child: Column(
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
                                'Get free 1 kg. vegetables from the organic farm.',
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
                  TextButton(
                    onPressed: _showcontent,
                    child:
                        // crossAxisAlignment: CrossAxisAlignment.end,
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,

                        Container(
                      width: c_width,
                      child: Text(
                        'Exchange',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Color(0xff4A5F30),
                          fontFamily: 'Jost',
                          fontWeight: FontWeight.normal,
                          fontSize: 15,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.black, blurRadius: 3)],
        ),
      ),
    );
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
        // SingleChildScrollView(
        //   child:
        // SingleChildScrollView(
        //   child: Container(
        //     child:

        Expanded(
          child: Container(
            padding: const EdgeInsets.only(left: 20, right: 20.0),
            child: SingleChildScrollView(
              child: Column(children: <Widget>[
                box,
                box,
                box,
                box,
                box,
              ]),
            ),
            // ),
            color: Color(0xffFFFBF2),
          ),
        ),
        // Padding(padding: const EdgeInsets.only(bottom: 20.0),)

        //   ),
        // ),
        // ),
      ],
    );
  }
}
