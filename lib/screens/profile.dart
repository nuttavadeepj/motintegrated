import 'package:flutter/material.dart';
import 'package:motintegrated/widgets/hamburger.dart';
import 'package:motintegrated/widgets/textfield.dart';
import 'package:motintegrated/widgets/button.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  void saveEdit() {
    print('save');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavigationDrawerWidget(),
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Profile',
            style: TextStyle(
                color: Color(0xFF323232), fontSize: 26, fontFamily: 'Jost'),
          ),
          iconTheme: IconThemeData(color: Color(0xFF4A5F30)),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        body: Center(
          child: Container(
              width: MediaQuery.of(context).size.width / 1.23,
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
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                child: Column(children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 38.0),
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: 260,
                                      child: Expanded(
                                          child: SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Text(
                                          'Nuttavadee Autsavapanakit',
                                          style: TextStyle(
                                              color: Color(0xFF323232),
                                              fontSize: 20,
                                              fontFamily: 'Jost',
                                              fontWeight: FontWeight.w600),
                                        ),
                                        // StyledTextField(
                                        //     hintText: 'Nuttavadee Autsavapanakit',
                                        //     errorText: 'Error')
                                      )),
                                    ),
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.edit,
                                        color: Colors.grey, size: 20),
                                    padding: EdgeInsets.zero,
                                    constraints: BoxConstraints(),
                                    onPressed: () {
                                      // openEdit();
                                    },
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Text('Point',
                                        style: TextStyle(
                                            color: Colors.black54,
                                            fontSize: 17,
                                            fontFamily: 'Jost',
                                            fontWeight: FontWeight.w500)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 4.0),
                                    child: Text('0',
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
                                          image:
                                              AssetImage("images/profile.jpg"),
                                        )),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Label(
                            label: 'Email',
                          ),
                          // StyledTextField(
                          //     hintText: 'Email', errorText: 'Error'),
                          UserInfo(info: 'hello@gmail.com'),
                          Label(
                            label: 'Phone Number',
                          ),
                          // StyledTextField(
                          //     hintText: 'Phone Number', errorText: 'Error'),
                          UserInfo(info: '0811234567'),
                          Label(
                            label: 'Address',
                          ),
                          // StyledTextField(
                          //     hintText: 'Address',
                          //     errorText: 'Error',
                          //     isAddress: true),
                          UserInfo(
                              info:
                                  '123/456, soi sathupradit 11, sathupradit, banananana, banananaa bangkok 10120 '),
                          ProfileButton(
                              text: 'Save',
                              width: 130.0,
                              onPressed: () {
                                saveEdit();
                              })
                        ],
                      ),
                    ]),
              )),
        ));
  }
}

class Label extends StatelessWidget {
  final label;

  Label({this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
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
          width: MediaQuery.of(context).size.width / 1.23,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              border: Border.all(color: Color(0xff4A5F30), width: 1.0),
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
