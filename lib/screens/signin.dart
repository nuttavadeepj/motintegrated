import 'package:flutter/material.dart';
import 'package:motintegrated/widgets/textfield.dart';
import 'package:motintegrated/widgets/button.dart';
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
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFFF8F8ED),
      body: Container(
        child: Column(
          children: [
            Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 1.0, horizontal: 40),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      AuthTextField(
                          hintText: "Email",
                          icon: Icons.email,
                          errorText: "error"),
                      AuthTextField(
                          hintText: "Password",
                          icon: Icons.vpn_key,
                          errorText: "error",
                          isPassword: true),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () => {},
                              child: Text(
                                'Forget password?',
                                style: TextStyle(
                                  color: Color(0xFF545454),
                                  fontFamily: 'Jost',
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
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