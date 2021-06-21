import 'package:flutter/material.dart';
import 'package:motintegrated/widgets/textfield.dart';
import 'package:motintegrated/widgets/button.dart';
import 'package:motintegrated/screens/track.dart';


class CheckOut extends StatefulWidget {
  @override
  _CheckOutState createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {

  void purchaseSuccess() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Center(
                  child: Text('Saved Image!',
                      style: TextStyle(
                          fontSize: 25, fontWeight: FontWeight.w500))),
              content: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Text(
                  'Tracking number will be shown within 2 days after you make purchase.',
                  textAlign: TextAlign.center,
                ),
              ),
              actions: [
                FlatButton(
                  textColor: Colors.black,
                  onPressed: () => Navigator.pop(context),
                  child: Text('CLOSE',
                      style: TextStyle(color: Colors.black54, fontSize: 16)),
                ),
                FlatButton(
                  textColor: Colors.black,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => TrackPage()));
                  },
                  child: Text('TRACKING',
                      style: TextStyle(fontSize: 16, color: Color(0xFF4A5F30))),
                ),
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Check Out',
            style: TextStyle(
                color: Color(0xFF323232), fontSize: 21, fontFamily: 'Jost'),
          ),
          iconTheme: IconThemeData(color: Color(0xFF4A5F30)),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        body: Container(
          alignment: Alignment.center,
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.only(top: 48.0),
              child: Container(
                padding: EdgeInsets.only(top: 30, left: 30, right: 30),
                decoration: BoxDecoration(
                  color: Color(0xFFE6E7C1),
                  gradient: LinearGradient(
                      colors: [Color(0xFFF2F3C3), Color(0xFFE6E7C1)],
                      begin: FractionalOffset.centerLeft,
                      end: FractionalOffset.centerRight),
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
                ),
                width: MediaQuery.of(context).size.width / 1.23,
                child: Column(children: [
                  Text(
                    'Scan this qrcode to make a purchase.',
                    style: TextStyle(
                        fontFamily: 'Jost',
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                    textAlign: TextAlign.center,
                  ),
                  Image.asset(
                    'images/qrcode.png',
                    width: 300,
                    height: 300,
                  ),
                  // CheckOutTextField(
                  //     hintText: 'Cardholder Name', errorText: 'Error'),
                  // CheckOutTextField(
                  //     hintText: 'Card Number', errorText: 'Error'),
                  // CheckOutTextField(hintText: 'CVV', errorText: 'Error'),
                  // CheckOutTextField(
                  //     hintText: 'EXP. (MM/YYYY)', errorText: 'Error'),
                  // CheckOutTextField(
                  //     hintText: 'Address',
                  //     isAddress: true,
                  //     errorText: 'Error'),
                  Button(
                      text: 'Save Image',
                      width: 180.0,
                      onPressed: () async {
                         purchaseSuccess();
                      }),
                ]),
              ),
            ),
          ]),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/checkout.png"),
              fit: BoxFit.cover,
            ),
          ),
        ));
  }
}
