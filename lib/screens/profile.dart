import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:motintegrated/widgets/hamburger.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String name = '';
  String email = '';
  String address = '';
  String phone = '';
  String point = '';
  @override
  void initState() {
    super.initState();
    getUser();
  }

  // Future<void> getData() async {
  //   FirebaseAuth auth = await FirebaseAuth.instance;
  //   User user = await auth.currentUser!;
  //   setState(() {
  //     name = user.displayName!;
  //     email = user.email!;
  //   });
  //   print('login by $name');
  // }

  Future<void> getUser() async {
    final firebaseUser = await FirebaseAuth.instance.currentUser!;
    await Firebase.initializeApp().then((value) async {
      await FirebaseFirestore.instance
          .collection('user')
          .doc(firebaseUser.uid)
          .snapshots()
          .listen((event) {
        setState(() {
          name = event.data()!['name'];
          email = event.data()!['email'];
          address = event.data()!['address'];
          phone = event.data()!['phone'];
          point = event.data()!['point'];
        });
        print('event => $point');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavigationDrawerWidget(),
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Profile',
            style: TextStyle(
                color: Color(0xFF323232), fontSize: 21, fontFamily: 'Jost'),
          ),
          iconTheme: IconThemeData(color: Color(0xFF4A5F30)),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        body: Container(
          child: Center(
            child: Container(
                width: MediaQuery.of(context).size.width / 1.2,
                child: SingleChildScrollView(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 90.0),
                          child: Container(
                            child: Stack(
                              alignment: Alignment.center,
                              overflow: Overflow.visible,
                              children: <Widget>[
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                      color: Color(0xFFE6E7C1),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.black26,
                                            blurRadius: 5)
                                      ],
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  child: Column(children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 38.0),
                                      child: Container(
                                          alignment: Alignment.center,
                                          width: 270,
                                          child: SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child: Text(
                                                '$name',
                                                style: TextStyle(
                                                    color: Color(0xFF323232),
                                                    fontSize: 20,
                                                    fontFamily: 'Jost',
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ))),
                                    ),
                                    IconButton(
                                      icon: Icon(Icons.edit,
                                          color: Colors.grey, size: 19),
                                      padding: EdgeInsets.zero,
                                      constraints: BoxConstraints(),
                                      onPressed: () {},
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 7.0),
                                      child: Text('Point',
                                          style: TextStyle(
                                              color: Colors.black54,
                                              fontSize: 16,
                                              fontFamily: 'Jost',
                                              fontWeight: FontWeight.w500)),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 2.0),
                                      child: Text('$point',
                                          style: TextStyle(
                                              height: 1,
                                              color: Color(0xFF4A5F30),
                                              fontSize: 56,
                                              fontFamily: 'Jost',
                                              fontWeight: FontWeight.w600)),
                                    ),
                                  ]),
                                ),
                                Positioned(
                                  top: -110,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 25.0),
                                    child: Container(
                                      width: 115,
                                      height: 115,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                              color: Colors.white, width: 6),
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: AssetImage(
                                                "images/profileja.png"),
                                          )),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15.0),
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: Color(0xFFEDEEC7),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                child: Column(
                                  children: [
                                    Label(
                                      label: 'Email',
                                    ),
                                    UserInfo(info: '$email'),
                                    Label(
                                      label: 'Phone Number',
                                    ),
                                    UserInfo(info: '$phone'),
                                    Label(
                                      label: 'Address',
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 20.0),
                                      child: UserInfo(info: '$address'),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 130)
                              // Button(
                              //     text: 'Save', width: 130.0, onPressed: () {})
                            ],
                          ),
                        ),
                      ]),
                )),
          ),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/profilebg.png"),
              fit: BoxFit.cover,
            ),
          ),
        ));
  }
}

class Label extends StatelessWidget {
  final label;

  Label({this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0, left: 15),
      child: Row(
        children: [
          Text(
            label,
            style: TextStyle(
                fontFamily: 'Jost', color: Color(0xFF323232), fontSize: 19),
          ),
        ],
      ),
    );
  }
}

class UserInfo extends StatelessWidget {
  final info;

  UserInfo({@required this.info});

  void openEdit() {
    print('press');
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 1),
      child: Container(
          width: MediaQuery.of(context).size.width / 1.3,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Colors.white),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.5, horizontal: 12),
            child: Row(
              children: [
                Expanded(
                    flex: 9,
                    child: Container(
                        width: MediaQuery.of(context).size.width / 1.65,
                        child: Text(info,
                            style:
                                TextStyle(fontFamily: 'Jost', fontSize: 19)))),
                Expanded(
                  flex: 1,
                  child: Container(
                    child: IconButton(
                      icon: Icon(Icons.edit, color: Colors.grey, size: 20),
                      padding: EdgeInsets.zero,
                      constraints: BoxConstraints(),
                      onPressed: () {
                        openEdit();
                      },
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
