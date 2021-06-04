import 'package:flutter/material.dart';

class SpecialDeal extends StatelessWidget {
  final List<String> shopPictureList = [
    "https://cdn.britannica.com/17/196817-050-6A15DAC3/vegetables.jpg",
    "https://media-cdn.tripadvisor.com/media/photo-s/17/7b/d1/84/ice-cream-cabinet-die.jpg",
    "https://aroi-mark.com/wp-content/uploads/2020/10/shutterstock_1149641465.jpg",
    "https://www.gardeningknowhow.com/wp-content/uploads/2011/05/cosmos1.jpg",
    "https://ae01.alicdn.com/kf/H8a6913e216dc482098ef0aa2e6cad1ebq/Japanese-Style-Siphon-Coffee-Maker-Tea-Siphon-Pot-Vacuum-Coffeemaker-Glass-Type-Coffee-Machine-Filter-3Cup.jpg_Q90.jpg_.webp"
  ];

  final List<String> specialDetailList = [
    "Get free 1 kg. vegetables from the organic farm.",
    "Get free 1 icecream from monthlyking shop.",
    "get discount 5% coupon at starduck coffee.",
    "Get free 50 g. cosmos seeds from the Cosmos garden.",
    "Get free a siphon coffee maker with 150 g. coffee beans."
  ];

  final List<int> specialPriceList = [
    50,
    20,
    50,
    30,
    1000,
  ];

  Widget build(BuildContext context) {
    double c_width = MediaQuery.of(context).size.width * 0.58;
    int _currentIndex = 0;
    int _currentIndex2 = 0;
    int _currentIndex3 = 0;

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
                        text: 'Special Deal',
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
                      text: 'Point\n',
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
                            '${shopPictureList[_currentIndex++]}',
                            width: 130,
                            height: 130,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                          width: c_width,
                          child: Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 8, left: 15),
                                child: RichText(
                                  textAlign: TextAlign.left,
                                  text: TextSpan(
                                    text:
                                        "Use ${specialPriceList[_currentIndex2++]} points\n",
                                    style: TextStyle(
                                        fontFamily: 'Jost',
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black,
                                        fontSize: 28),
                                    children: [
                                      TextSpan(
                                        text:
                                            "${specialDetailList[_currentIndex3++]}",
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
                      boxShadow: [
                        BoxShadow(color: Colors.black, blurRadius: 3)
                      ],
                    ),
                  ),
                ),
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
                            '${shopPictureList[_currentIndex++]}',
                            width: 130,
                            height: 130,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                          width: c_width,
                          child: Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 8, left: 15),
                                child: RichText(
                                  textAlign: TextAlign.left,
                                  text: TextSpan(
                                    text:
                                        "Use ${specialPriceList[_currentIndex2++]} points\n",
                                    style: TextStyle(
                                        fontFamily: 'Jost',
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black,
                                        fontSize: 28),
                                    children: [
                                      TextSpan(
                                        text:
                                            "${specialDetailList[_currentIndex3++]}",
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
                      boxShadow: [
                        BoxShadow(color: Colors.black, blurRadius: 3)
                      ],
                    ),
                  ),
                ),
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
                            '${shopPictureList[_currentIndex++]}',
                            width: 130,
                            height: 130,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                          width: c_width,
                          child: Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 8, left: 15),
                                child: RichText(
                                  textAlign: TextAlign.left,
                                  text: TextSpan(
                                    text:
                                        "Use ${specialPriceList[_currentIndex2++]} points\n",
                                    style: TextStyle(
                                        fontFamily: 'Jost',
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black,
                                        fontSize: 28),
                                    children: [
                                      TextSpan(
                                        text:
                                            "${specialDetailList[_currentIndex3++]}",
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
                      boxShadow: [
                        BoxShadow(color: Colors.black, blurRadius: 3)
                      ],
                    ),
                  ),
                ),
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
                            '${shopPictureList[_currentIndex++]}',
                            width: 130,
                            height: 130,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                          width: c_width,
                          child: Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 8, left: 15),
                                child: RichText(
                                  textAlign: TextAlign.left,
                                  text: TextSpan(
                                    text:
                                        "Use ${specialPriceList[_currentIndex2++]} points\n",
                                    style: TextStyle(
                                        fontFamily: 'Jost',
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black,
                                        fontSize: 28),
                                    children: [
                                      TextSpan(
                                        text:
                                            "${specialDetailList[_currentIndex3++]}",
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
                      boxShadow: [
                        BoxShadow(color: Colors.black, blurRadius: 3)
                      ],
                    ),
                  ),
                ),
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
                            '${shopPictureList[_currentIndex++]}',
                            width: 130,
                            height: 130,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                          width: c_width,
                          child: Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 8, left: 15),
                                child: RichText(
                                  textAlign: TextAlign.left,
                                  text: TextSpan(
                                    text:
                                        "Use ${specialPriceList[_currentIndex2++]} points\n",
                                    style: TextStyle(
                                        fontFamily: 'Jost',
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black,
                                        fontSize: 28),
                                    children: [
                                      TextSpan(
                                        text:
                                            "${specialDetailList[_currentIndex3++]}",
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
                      boxShadow: [
                        BoxShadow(color: Colors.black, blurRadius: 3)
                      ],
                    ),
                  ),
                ),
                Padding(padding: const EdgeInsets.only(top: 30,),)
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
