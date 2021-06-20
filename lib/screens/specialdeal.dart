import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:motintegrated/widgets/hamburger.dart';

class SpecialDeal extends StatefulWidget {
  @override
  State<SpecialDeal> createState() => _SpecialDealState();
}

class _SpecialDealState extends State<SpecialDeal> {
  int point = 0;

  @override
  void initState() {
    super.initState();
    getUser();
  }

  Future<void> getUser() async {
    final firebaseUser = await FirebaseAuth.instance.currentUser!;
    await Firebase.initializeApp().then((value) async {
      await FirebaseFirestore.instance
          .collection('user')
          .doc(firebaseUser.uid)
          .snapshots()
          .listen((event) {
        setState(() {
          point = event.data()!['point'];
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    void exchangePoint() {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Center(
                    child: Text('Not enough points',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w400))),
                actions: [
                  FlatButton(
                    textColor: Colors.black,
                    onPressed: () => Navigator.pop(context),
                    child: Text('OK',
                        style:
                            TextStyle(fontSize: 16, color: Color(0xFF4A5F30))),
                  ),
                ],
              ));
    }

    void checkOutOrder() {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Center(
                    child: Text('Exchange',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w500))),
                content: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Text(
                    'Are you sure you want to exchange this product? After confirming, the point in account will be paid off.',
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
                      Navigator.pop(context);
                      exchangePoint();
                    },
                    child: Text('ACCEPT',
                        style:
                            TextStyle(fontSize: 16, color: Color(0xFF4A5F30))),
                  ),
                ],
              ));
    }

    return MaterialApp(
        home: Scaffold(
            resizeToAvoidBottomInset: false,
            drawer: NavigationDrawerWidget(),
            appBar: AppBar(
              iconTheme: IconThemeData(color: Color(0xFF4A5F30)),
              backgroundColor: Color(0xffE6E7C1),
              elevation: 0.0,
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: RichText(
                              text: TextSpan(
                                text: 'Special Deal',
                                style: TextStyle(
                                  fontSize: 33,
                                  fontFamily: 'Jost',
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff323232),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                text: 'Point\n',
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 16,
                                    fontFamily: 'Jost',
                                    fontWeight: FontWeight.w500),
                                children: [
                                  TextSpan(
                                    text: '$point',
                                    style: TextStyle(
                                        height: 1,
                                        color: Color(0xFF4A5F30),
                                        fontSize: 56,
                                        fontFamily: 'Jost',
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      color: Color(0xffE6E7C1)),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                    child: SingleChildScrollView(
                      child: Column(children: <Widget>[
                        DealBox(
                            points: 50,
                            detail:
                                'Get free 1 kg. vegetables from the organic farm.',
                            picture:
                                'https://cdn.britannica.com/17/196817-050-6A15DAC3/vegetables.jpg',
                            onpress: () {
                              checkOutOrder();
                            }),
                        DealBox(
                            points: 50,
                            detail:
                                'Get free 1 icecream from monthlyking shop.',
                            picture:
                                'https://media-cdn.tripadvisor.com/media/photo-s/17/7b/d1/84/ice-cream-cabinet-die.jpg',
                            onpress: () {
                              checkOutOrder();
                            }),
                        DealBox(
                            points: 20,
                            detail:
                                'Get discount 5% coupon at starbuck coffee.',
                            picture:
                                'https://aroi-mark.com/wp-content/uploads/2020/10/shutterstock_1149641465.jpg',
                            onpress: () {
                              checkOutOrder();
                            }),
                        DealBox(
                            points: 50,
                            detail:
                                'Get free 50 g. cosmos seeds from the Cosmos garden.',
                            picture:
                                'https://www.gardeningknowhow.com/wp-content/uploads/2011/05/cosmos1.jpg',
                            onpress: () {
                              checkOutOrder();
                            }),
                        DealBox(
                            points: 30,
                            detail:
                                'Get free a siphon coffee maker with 150 g. coffee beans.',
                            picture:
                                'https://ae01.alicdn.com/kf/H8a6913e216dc482098ef0aa2e6cad1ebq/Japanese-Style-Siphon-Coffee-Maker-Tea-Siphon-Pot-Vacuum-Coffeemaker-Glass-Type-Coffee-Machine-Filter-3Cup.jpg_Q90.jpg_.webp',
                            onpress: () {
                              checkOutOrder();
                            }),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 30,
                          ),
                        )
                      ]),
                    ),
                    color: Color(0xffFFFBF2),
                  ),
                ),
              ],
            )));
  }
}

class DealBox extends StatelessWidget {
  final points;
  final detail;
  final picture;
  final onpress;

  DealBox(
      {@required this.points,
      @required this.detail,
      @required this.picture,
      this.onpress});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 20.0,
      ),
      height: 125,
      color: Color(0xffFFFBF2),
      child: Container(
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Image.network(
                picture,
                width: 125,
                height: 125,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.55,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8, left: 15),
                    child: RichText(
                      textAlign: TextAlign.left,
                      text: TextSpan(
                        text: "Use $points points\n",
                        style: TextStyle(
                            fontFamily: 'Jost',
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                            fontSize: 23),
                        children: [
                          TextSpan(
                            text: detail,
                            style: TextStyle(
                              fontFamily: 'Jost',
                              height: 1.05,
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
                    onPressed: onpress,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.55,
                      child: Text(
                        'Exchange',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Color(0xff4A5F30),
                          fontFamily: 'Jost',
                          height: 0.8,
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
          boxShadow: [BoxShadow(color: Colors.black38, blurRadius: 2)],
        ),
      ),
    );
  }
}
