import 'package:flutter/material.dart';
import 'package:motintegrated/screens/signin.dart';

class Authen extends StatefulWidget {
  @override
  _AuthenState createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
      resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xFFF8F8ED),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(260),
          child: Padding(
            padding: const EdgeInsets.only(top: 100),
            child: new AppBar(
              backgroundColor: Color(0xFFF8F8ED),
              elevation: 0,
              flexibleSpace: new Column(
                children: [
                  new Container(
                    height: 100,
                    color: Color(0xFFF8F8ED),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 25),
                          child: Container(
                            width: 170,
                            height: 170,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                              image: AssetImage("images/logo.png"),
                            )),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 40.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TabBar(
                          isScrollable: true,
                          // indicatorWeight: 0.01,
                          indicatorColor: Color(0xFF4A5F30),
                          labelColor: Color(0xff2D2727),
                          labelStyle:
                              TextStyle(fontWeight: FontWeight.bold, fontSize: 22, fontFamily: 'Jost', color: Color(0xFF545454)),
                          unselectedLabelStyle: TextStyle(fontSize: 22, fontFamily: 'Jost'),
                          tabs: <Widget>[
                            Tab(
                              text: "Sign In",
                            ),
                            Tab(
                              text: "Sign Up",
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                   SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ),
        body: TabBarView(children: [
          Container(height: 200, child: SignIn()),
          Container(
            height: 200,
            child: Center(
              child: Text(
                "Sign Up",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
