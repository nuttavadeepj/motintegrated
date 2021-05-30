import 'package:flutter/material.dart';
import 'package:motintegrated/screens/product_detail.dart';

class AllBag extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF8F8ED),
      body: ListView(
        children: <Widget>[
          SizedBox(height: 15),
          Container(
            padding: EdgeInsets.only(right: 15),
            width: MediaQuery.of(context).size.width - 30,
            height: MediaQuery.of(context).size.height - 50,
            child: GridView.count(
                crossAxisCount: 2,
                primary: false,
                crossAxisSpacing: 10,
                mainAxisSpacing: 15.0,
                childAspectRatio: 0.8,
                children: <Widget>[
                  _buildCard(
                      'Orange Trash Bag',
                      '80฿',
                      'images/orangebag.png',
                      'Orange trash bag. It is a trash bag that is used for holding biodegradable garbage with the size 20x30 ”for 20 bags. Once you have purchased, you can scan the garbage bags into the MOT system to redeem many privileges.',
                      false,
                      context),
                  _buildCard(
                      'Purple Trash Bag',
                      '80฿',
                      'images/purplebag.png',
                      'Purple trash bag. It is a trash bag that is used for holding biodegradable garbage with the size 30x40 ”for 12 bags. Once you have purchased, you can scan the garbage bags into the MOT system to redeem many privileges.',
                      false,
                      context),
                  _buildCard(
                      'Pink Trash Bag',
                      '80฿',
                      'images/pinkbag.png',
                      'Pink trash bag. It is a trash bag that is used for holding biodegradable garbage with the size 40 x 60 ”for 6 bags. Once you have purchased, you can scan the garbage bags into the MOT system to redeem many privileges.',
                      false,
                      context),
                ]),
          ),
          SizedBox(height: 15.0)
        ],
      ),
    );
  }

  Widget _buildCard(String name, String price, String imgPath, String detail,
      bool added, context) {
    return Padding(
      padding: EdgeInsets.only(top: 5.0, bottom: 5.0, left: 15.0, right: 5.0),
      child: InkWell(
          onTap: () => {
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => ProductDetail(
                            assetPath: imgPath,
                            productprice: price,
                            productname: name,
                            productdetail: detail,
                          )),
                )
              },
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 3.0,
                      blurRadius: 5.0)
                ],
                color: Colors.white),
            child: Column(
              children: [
                Hero(
                  tag: imgPath,
                  child: Container(
                      height: 130.0,
                      width: 120.0,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(imgPath),
                              fit: BoxFit.contain))),
                ),
                SizedBox(height: 7.0),
                Text(price,
                    style: TextStyle(color: Color(0xff9D8671), fontSize: 26.0, fontWeight: FontWeight.w500)),
                Text(name,
                    style: TextStyle(color: Color(0xff323232), fontSize: 20.0)),
                
              ],
            ),
          )),
    );
  }
}
