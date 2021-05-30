import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class Cart extends StatelessWidget {
  // Shopping List
  final List<String> shopPictureList = [
    "https://cdn.pixabay.com/photo/2017/12/03/18/04/christmas-balls-2995437_960_720.jpg",
    "https://cdn.pixabay.com/photo/2017/12/13/00/23/christmas-3015776_960_720.jpg",
    "https://cdn.pixabay.com/photo/2019/12/19/10/55/christmas-market-4705877_960_720.jpg",
    "https://cdn.pixabay.com/photo/2019/12/20/00/03/road-4707345_960_720.jpg",
    "https://cdn.pixabay.com/photo/2016/11/22/07/09/spruce-1848543__340.jpg"
  ];

  final List<String> shopNameTagList = [
    'The First product',
    'The Second product',
    'The Third product',
    'The Fourth product',
    'The Fifth product',
  ];

  final List<int> shopPriceList = [
    100,
    200,
    100,
    300,
    200,
  ];

  @override
  Widget build(BuildContext context) {
    int _currentIndex = 0;
    int _currentIndex2 = 0;
    return MaterialApp(
      home: Scaffold(
        body: Container(
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 60,
              ),
            ),
            Text(
              'My Cart',
              style: TextStyle(
                  fontSize: 35,
                  fontFamily: 'Jost',
                  fontWeight: FontWeight.w600),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 20,
              ),
            ),
            GFCarousel(
              autoPlay: true,
              autoPlayAnimationDuration: new Duration(seconds: 3),
              items: shopPictureList.map(
                (url) {
                  var image = Image.network(
                    url,
                    fit: BoxFit.cover,
                    width: 1000,
                  );
                  var item = Text(
                    "${shopNameTagList[_currentIndex++]}",
                    style: TextStyle(
                        color: Color(0xff9D8671),
                        fontFamily: 'Jost',
                        fontWeight: FontWeight.w500,
                        fontSize: 28),
                  );
                  var price = Text(
                    "${shopPriceList[_currentIndex2++]} ฿",
                    style: TextStyle(
                        color: Color(0xff000000),
                        fontFamily: 'Jost',
                        fontWeight: FontWeight.normal,
                        fontSize: 20),
                  );
                  return Container(
                    margin: EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Expanded(
                            child: image,
                          ),
                          // ClipRRect(
                          //   child: item,
                          // ),
                          // ClipRRect(
                          //   child: item,
                          //)
                          // Expanded(child: item),
                          // Expanded(child: price),
                          
                          // Padding(
                          //   padding: const EdgeInsets.only(
                          //     bottom: 0,left: 0,
                          //   ),
                          //   child:
                          // item,
                          // ),item,
                          // Padding(
                          //   padding: const EdgeInsets.only(
                          //     left: 0,
                          //   ),
                          //   child:
                          // price,
                          // ),
                        ],
                      ),
                    ),
                  );
                },
              ).toList(),
              onPageChanged: (index) {},
            ),
            Padding(
              padding: const EdgeInsets.only(top: 180, left: 30, right: 30),
              child: new Container(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Purchase amount',
                              style: TextStyle(
                                  fontFamily: 'Jost',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 28,
                                  height: 1.6,
                                  color: Color(0xff000000)),
                            ),
                          ],
                        ),
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: '900',
                            style: TextStyle(
                                fontFamily: 'Jost',
                                fontWeight: FontWeight.normal,
                                fontSize: 28,
                                height: 1.6,
                                color: Color(0xff000000)),
                          ),
                        ],
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: ' ฿',
                            style: TextStyle(
                                fontFamily: 'Jost',
                                fontWeight: FontWeight.normal,
                                fontSize: 28,
                                height: 1.6,
                                color: Color(0xff000000)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: new Container(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Delivery fee',
                              style: TextStyle(
                                  fontFamily: 'Jost',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 28,
                                  height: 1.6,
                                  color: Color(0xff000000)),
                            ),
                          ],
                        ),
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: '50',
                            style: TextStyle(
                                fontFamily: 'Jost',
                                fontWeight: FontWeight.normal,
                                fontSize: 28,
                                height: 1.6,
                                color: Color(0xff000000)),
                          ),
                        ],
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: ' ฿',
                            style: TextStyle(
                                fontFamily: 'Jost',
                                fontWeight: FontWeight.normal,
                                fontSize: 28,
                                height: 1.6,
                                color: Color(0xff000000)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 20, left: 30, right: 30, bottom: 20),
              child: new Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 1.5, color: Color(0xff4A5F30)),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: new Container(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Total',
                              style: TextStyle(
                                  fontFamily: 'Jost',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 28,
                                  height: 1.6,
                                  color: Color(0xff000000)),
                            ),
                          ],
                        ),
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: '950',
                            style: TextStyle(
                                fontFamily: 'Jost',
                                fontWeight: FontWeight.normal,
                                fontSize: 28,
                                height: 1.6,
                                color: Color(0xffED8449)),
                          ),
                        ],
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: ' ฿',
                            style: TextStyle(
                                fontFamily: 'Jost',
                                fontWeight: FontWeight.normal,
                                fontSize: 28,
                                height: 1.6,
                                color: Color(0xffED8449)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40, left: 30, right: 30),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              (Cart()))); //Don't forget to change Navigator location of button
                },
                style: ElevatedButton.styleFrom(
                    primary: Color(0xFF4A5F30),
                    elevation: 5,
                    padding: EdgeInsets.symmetric(
                      horizontal: 25,
                      vertical: 10,
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(40.0))),
                child: Center(
                  child: Text(
                    'Check Out',
                    style: TextStyle(
                        fontFamily: 'Jost',
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
