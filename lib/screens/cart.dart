import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:motintegrated/screens/checkout.dart';
import 'package:motintegrated/screens/shop.dart';
import 'package:motintegrated/provider/cartProvider.dart';
import 'package:provider/provider.dart';

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
    Provider.of<CartProvider>(context, listen: false).fetchItem();
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Column(
            children: [
              Text(
                'My Cart',
                style: TextStyle(
                    color: Color(0xFF323232),
                    fontSize: 35,
                    fontFamily: 'Jost',
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
          iconTheme: IconThemeData(color: Color(0xFF4A5F30)),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Color(0xff4A5F30)),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => (ShopPage())));
            },
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                ),
              ),
              Container(
                height: 300,
                child: Consumer<CartProvider>(
                    builder: (ctx, cart, _) => ListView.builder(
                          itemBuilder: (ctx, index) => ListTile(
                            title: Container(
                              child: Row(
                                //'${index}'
                                children: [
                                  Container(
                                    width: 100,
                                    height: 100,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(topLeft: Radius.circular(12.0),bottomLeft: Radius.circular(12.0)),
                                        color: Colors.amber),
                                  ),
                                  // Text(
                                  //   cart.items![index],
                                    
                                  // ),
                                    Text(cart.items2![index]),
                                    Text(cart.items3![index]),
                                ],
                              ),
                              height: 100,
                              decoration: BoxDecoration(
                                color: Color(0xffFFFBF2),
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 1,
                                    blurRadius: 7,
                                    offset: Offset(
                                        3, 4), // changes position of shadow
                                  ),
                                ],
                              ),
                              margin: EdgeInsets.only(
                                top: 15,
                              ),
                            ),
                          ),
                          itemCount: cart.items!.length,
                          
                        )),
              ),
              // GFCarousel(
              //   // autoPlay: true,
              //   // autoPlayAnimationDuration: new Duration(seconds: 3),
              //   items: shopPictureList.map(
              //     (url) {
              //       var image = ClipRRect(
              //         borderRadius: BorderRadius.circular(15.0),
              //         child: Image.network(
              //           url,

              //           fit: BoxFit.fill,
              //           // width: 1000,
              //           // height: double.infinity,
              //         ),
              //       );
              //       var item = Text(
              //         "  ${shopNameTagList[_currentIndex++]}",
              //         style: TextStyle(
              //             color: Color(0xff9D8671),
              //             fontFamily: 'Jost',
              //             fontWeight: FontWeight.w500,
              //             fontSize: 28),
              //       );
              //       var price = Text(
              //         "   ${shopPriceList[_currentIndex2++]} ฿",
              //         style: TextStyle(
              //             color: Color(0xff000000),
              //             fontFamily: 'Jost',
              //             fontWeight: FontWeight.normal,
              //             fontSize: 20),
              //       );
              //       var delete = TextButton(
              //         style: TextButton.styleFrom(
              //           textStyle: const TextStyle(
              //             fontSize: 18,
              //           ),
              //         ),
              //         onPressed: () {},
              //         child: Text(
              //           'DELETE',
              //           style: TextStyle(
              //             color: Color(0xffFF0000),
              //             fontFamily: 'Jost',
              //             fontWeight: FontWeight.bold,
              //             decoration: TextDecoration.underline,
              //           ),
              //         ),
              //       );
              //       return Scaffold(
              //         body: Container(
              //           decoration: BoxDecoration(
              //             boxShadow: [
              //               BoxShadow(color: Colors.black, blurRadius: 0.5)
              //             ],
              //             borderRadius: BorderRadius.circular(15.0),
              //             color: Color(0xffE6E7C1),
              //           ),
              //           // children: [
              //           //   Container(
              //           margin: EdgeInsets.all(8.0),

              //           child: Column(
              //             // borderRadius: BorderRadius.all(
              //             //   Radius.circular(15.0),
              //             // ),
              //             crossAxisAlignment: CrossAxisAlignment.stretch,

              //             // child: image,
              //             // child: Column(
              //             children: <Widget>[
              //               Expanded(
              //                 child: image,
              //               ),
              //               Container(
              //                 child: item,
              //               ),
              //               Row(
              //                 children: [price,

              //                 delete],
              //               )
              //             ],
              //           ),

              //           height: 90000.0,
              //         ),
              //       );
              //     },
              //   ).toList(),
              //   onPageChanged: (index) {},
              // ),
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
                padding: const EdgeInsets.only(
                    top: 40, left: 30, right: 30, bottom: 20),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                (CheckOut()))); //Don't forget to change Navigator location of button
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
      ),
    );
  }
}
