import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:motintegrated/models/order_model.dart';
import 'package:motintegrated/screens/checkout.dart';
import 'package:motintegrated/screens/shop.dart';
import 'package:motintegrated/provider/cartProvider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:motintegrated/widgets/button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Cart extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    Provider.of<CartProvider>(context, listen: false).fetchItem();
    Provider.of<CartProvider>(context, listen: false).sumOfProducts();
    CartProvider cartProvider = Provider.of<CartProvider>(context);

    void conAllDelete() {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Center(
                    child: Text('Clear your Cart',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w500))),
                content: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Text(
                    'Are you sure you want to delete all products in your Cart?',
                    textAlign: TextAlign.center,
                  ),
                ),
                actions: [
                  FlatButton(
                    textColor: Colors.black,
                    onPressed: () => Navigator.pop(context),
                    child: Text('CANCEL',
                        style: TextStyle(color: Colors.black54, fontSize: 16)),
                  ),
                  FlatButton(
                    textColor: Colors.black,
                    onPressed: () {
                      Provider.of<CartProvider>(context, listen: false)
                          .removeAllFromCart();
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => (Cart())));
                    },
                    child: Text('ACCEPT',
                        style:
                            TextStyle(fontSize: 16, color: Color(0xFF4A5F30))),
                  ),
                ],
              ));
    }

    Future<void> createOrder() async {
      final firebaseUser = await FirebaseAuth.instance.currentUser!;

      DocumentReference order = await FirebaseFirestore.instance
          .collection('user')
          .doc(firebaseUser.uid)
          .collection('orderid')
          .doc();
      OrderModel model = OrderModel(
          orderid: '${order.id}',
          product: ['${cartProvider.items2}'],
          trackno: 'in progress',
          price: cartProvider.summ,
          userid: '${firebaseUser.uid}',
          date: FieldValue.serverTimestamp());
      Map<String, dynamic> data = model.toMap();
      order.set(data).then((value) async {
        await FirebaseFirestore.instance
            .collection('order')
            .doc(order.id)
            .set(data);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => CheckOut()),
        );

        print('orderid is ${order.id}');
      });
    }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Column(
            children: [
              Text(
                'My Cart',
                style: TextStyle(
                    color: Color(0xFF323232), fontSize: 26, fontFamily: 'Jost'),
              ),
            ],
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.remove_shopping_cart_rounded,
                size: 30,
              ),
              onPressed: () {
                conAllDelete();
              },
              color: Colors.red,
            ),
          ],
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
                                children: <Widget>[
                                  Container(
                                    child: Image(
                                      image: AssetImage(cart.items![index]),
                                    ),
                                    width: 100,
                                    height: 100,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(12.0),
                                            bottomLeft: Radius.circular(12.0)),
                                        color: Color(0xffE6E7C1)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 15,
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          '${cart.items2![index]}',
                                          style: TextStyle(
                                              color: Color(0xff9D8671),
                                              fontFamily: 'Jost',
                                              fontWeight: FontWeight.bold,
                                              fontSize: 22),
                                        ),
                                        Text(
                                          '${cart.items3![index]} ฿',
                                          style: TextStyle(
                                              fontFamily: 'Jost',
                                              fontWeight: FontWeight.normal,
                                              fontSize: 20),
                                        ),
                                        //Text('${cart.summ}'),
                                      ],
                                    ),
                                  ),
                                  Container(
                                      child: Column(children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 45, top: 5),
                                    ),
                                    Text.rich(
                                      TextSpan(
                                        children: [
                                          WidgetSpan(
                                            child: IconButton(
                                              icon: const Icon(
                                                Icons.clear_rounded,
                                                size: 25,
                                              ),
                                              color: Colors.red,
                                              onPressed: () {
                                                Provider.of<CartProvider>(
                                                        context,
                                                        listen: false)
                                                    .removeFromCart(
                                                        cart.items![index],
                                                        cart.items2![index],
                                                        cart.items3![index]);
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            (Cart())));
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ]))
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
              // Container(
              //     child: Consumer<CartProvider>(
              //   builder: (ctx, data, _) => Text('${data.summ}'),
              // )), Example of Consumer
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30, top: 50),
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
                                    fontSize: 25,
                                    height: 1.6,
                                    color: Color(0xff000000)),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                          child: Consumer<CartProvider>(
                        builder: (ctx, data, _) => Text(
                          '${data.summ}',
                          style: TextStyle(
                              fontFamily: 'Jost',
                              fontWeight: FontWeight.normal,
                              fontSize: 25,
                              height: 1.6,
                              color: Color(0xff000000)),
                        ),
                      )),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: ' ฿',
                              style: TextStyle(
                                  fontFamily: 'Jost',
                                  fontWeight: FontWeight.normal,
                                  fontSize: 25,
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
                                    fontSize: 25,
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
                              text: '0',
                              style: TextStyle(
                                  fontFamily: 'Jost',
                                  fontWeight: FontWeight.normal,
                                  fontSize: 25,
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
                                  fontSize: 25,
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
                      Container(
                          child: Consumer<CartProvider>(
                        builder: (ctx, data, _) => Text(
                          '${data.summ}',
                          style: TextStyle(
                              fontFamily: 'Jost',
                              fontWeight: FontWeight.normal,
                              fontSize: 28,
                              height: 1.6,
                              color: Color(0xffED8449)),
                        ),
                      )),
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
                  child: Button(
                      text: 'Check Out',
                      width: 350.0,
                      onPressed: () {
                        createOrder();
                      }))
              // ElevatedButton(
              //   onPressed: () {
              //     Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //             builder: (context) =>
              //                 (CheckOut()))); //Don't forget to change Navigator location of button
              //   },
              //   style: ElevatedButton.styleFrom(
              //       primary: Color(0xFF4A5F30),
              //       elevation: 5,
              //       padding: EdgeInsets.symmetric(
              //         horizontal: 25,
              //         vertical: 10,
              //       ),
              //       shape: RoundedRectangleBorder(
              //           borderRadius: new BorderRadius.circular(40.0))),
              //   child: Center(
              //     child: Text(
              //       'Check Out',
              //       style: TextStyle(
              //           fontFamily: 'Jost',
              //           color: Colors.white,
              //           fontSize: 28,
              //           fontWeight: FontWeight.bold),
              //     ),
              //   ),
              // ),
              // )
            ]),
          ),
        ),
      ),
    );
  }
}
