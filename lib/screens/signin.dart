import 'package:flutter/material.dart';
import 'package:motintegrated/widgets/styleinputtext.dart';
import 'package:motintegrated/widgets/authbutton.dart';
import 'package:motintegrated/screens/home.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8F8ED),
      body: Container(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 38, top: 70),
                  child: Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage("images/logo.png"),
                    )),
                  ),
                ),
              ],
            ),
            Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 1.0, horizontal: 40),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      StyledInputText(
                          hintText: "Email",
                          icon: Icons.email,
                          errorText: "error"),
                      StyledInputText(
                          hintText: "Password",
                          icon: Icons.vpn_key,
                          errorText: "error",
                          isPassword: true),
                    ],
                  ),
                )),
            AuthButton(
                text: 'Sign In',
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => (Home())));
                })
          ],
        ),
      ),
    );
  }
}
