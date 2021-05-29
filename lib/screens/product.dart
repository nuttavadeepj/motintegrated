import 'package:flutter/material.dart';

class Product extends StatelessWidget {
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
                      'Bag1', '80฿', 'images/yellow_bag.png', false, context),
                  _buildCard(
                      'Bag2', '80฿', 'images/blue_bag.png', false, context),
                  _buildCard(
                      'Bag3', '80฿', 'images/yellow_bag.png', false, context),
                  _buildCard(
                      'Gas1', '300฿', 'images/yellow_bag.png', false, context),
                  _buildCard(
                      'Gas2', '300฿', 'images/yellow_bag.png', false, context),
                  _buildCard(
                      'Gas3', '300฿', 'images/yellow_bag.png', false, context),
                ]),
          )
        ],
      ),
    );
  }

  Widget _buildCard(
      String name, String price, String imgPath, bool added, context) {
    return Padding(
      padding: EdgeInsets.only(top: 15, bottom: 5, left: 15, right: 5),
      child: InkWell(
          onTap: () {},
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
                      height: 75.0,
                      width: 75.0,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(imgPath),
                              fit: BoxFit.contain))),
                ),
                SizedBox(height: 7.0)
              ],
            ),
          )),
    );
  }
}
