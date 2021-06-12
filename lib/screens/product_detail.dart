import 'package:flutter/material.dart';
import 'package:motintegrated/screens/cart.dart';

class ProductDetail extends StatelessWidget {
  final assetPath, productprice, productname, productdetail;
  ProductDetail(
      {this.assetPath,
      this.productprice,
      this.productname,
      this.productdetail});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Color(0xff4A5F30)),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text('Pickup',
            style: TextStyle(fontSize: 25.0, color: Color(0xff4A5F30))),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.shopping_basket),
              iconSize: 30.0,
              color: Color(0xff4A5F30),
              onPressed: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Cart()),
                    )
                  })
        ],
      ),
      body: ListView(
        children: [
          SizedBox(height: 15.0),
          Padding(
            padding: const EdgeInsets.only(right: 250),
            child: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage("images/logo.png"),
              )),
            ),
          ),
          SizedBox(height: 15.0),
          Hero(
              tag: assetPath,
              child: Image.asset(assetPath,
                  height: 250.0, width: 250.0, fit: BoxFit.contain)),
          SizedBox(height: 20.0),
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width - 50.0,
              child: Text(
                productprice,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 30.0,
                    color: Color(0xff9D8671),
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
          SizedBox(height: 10.0),
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width - 50.0,
              child: Text(
                productname,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30.0, color: Color(0xff323232)),
              ),
            ),
          ),
          SizedBox(height: 20.0),
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width - 50.0,
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, bottom: 20),
                child: Text(
                  productdetail,
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 20.0, color: Color(0xff4A5F30)),
                ),
              ),
            ),
          ),
          SizedBox(height: 20.0),
          Center(
              child: Container(
            width: MediaQuery.of(context).size.width - 50.0,
            height: 50.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
                color: Color(0xff4A5F30)),
            child: Center(
              child: Text(
                'Add to cart',
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xffFFFBF2)),
              ),
            ),
          ))
        ],
      ),
    );
  }
}
