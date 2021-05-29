import 'package:flutter/material.dart';

class ShopPage extends StatefulWidget {
  @override
  _ShopPageState createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xff4A5F30)),
          onPressed: () {},
        ),
        title: Text('Pickup',
            style: TextStyle(fontSize: 20.0, color: Color(0xff4A5F30))),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.shopping_cart),
              color: Color(0xff4A5F30),
              onPressed: () {})
        ],
      ),
      body: ListView(
        
      ),
    );
  }
}
