import 'package:flutter/material.dart';
import 'package:motintegrated/screens/cart.dart';
import 'package:motintegrated/widgets/button.dart';

class ProductDetail extends StatefulWidget {
  final assetPath, productprice, productname, productdetail;
  ProductDetail(
      {this.assetPath,
      this.productprice,
      this.productname,
      this.productdetail});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  void addToCart() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Center(
                  child: Text('Add to cart already!',
                      style: TextStyle(
                          fontSize: 23, fontWeight: FontWeight.w500))),
              actions: [
                FlatButton(
                  textColor: Colors.black,
                  onPressed: () {},
                  child: Text('',
                      style: TextStyle(color: Colors.black54, fontSize: 16)),
                ),
                FlatButton(
                  textColor: Colors.black,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Cart()));
                  },
                  child: Text('GO TO CART',
                      style: TextStyle(fontSize: 15, color: Color(0xFF4A5F30))),
                ),
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Color(0xFF323232)),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text('Pickup',
            style: TextStyle(
                color: Color(0xFF323232), fontSize: 25, fontFamily: 'Jost')),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.shopping_basket),
              iconSize: 30.0,
              color: Color(0xFF323232),
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
          SizedBox(height: 20.0),
          // Padding(
          //   padding: const EdgeInsets.only(right: 250),
          //   child: Container(
          //     width: 80,
          //     height: 80,
          //     decoration: BoxDecoration(
          //         image: DecorationImage(
          //       image: AssetImage("images/logo.png"),
          //     )),
          //   ),
          // ),
          SizedBox(height: 15.0),
          Hero(
              tag: widget.assetPath,
              child: Image.asset(widget.assetPath,
                  height: 250.0, width: 250.0, fit: BoxFit.contain)),
          SizedBox(height: 20.0),
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width - 50.0,
              child: Text(
                widget.productprice,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 30.0,
                    fontFamily: 'Jost',
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
                widget.productname,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 30.0,
                    color: Color(0xff323232),
                    fontFamily: 'Jost'),
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
                  widget.productdetail,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Color(0xff4A5F30),
                      fontFamily: 'Jost',
                      height: 1.1),
                ),
              ),
            ),
          ),
          SizedBox(height: 20.0),

          Center(
              child: Container(
            width: MediaQuery.of(context).size.width - 50.0,
            child: Button(
                text: 'Add to cart',
                width: 35.0,
                onPressed: () {
                  addToCart();
                }),
          ))
        ],
      ),
    );
  }
}
