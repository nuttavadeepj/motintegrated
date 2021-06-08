import 'package:flutter/material.dart';
import 'package:motintegrated/widgets/textfield.dart';
import 'package:motintegrated/widgets/button.dart';
import 'package:motintegrated/screens/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
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
                          controller: _emailController,
                          icon: Icons.email,
                          hintText: 'Email'),
                      AuthTextField(
                          controller: _passwordController,
                          hintText: 'Password',
                          icon: Icons.vpn_key,
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
                  if (_formKey.currentState!.validate()) {
                    signin();
                  }
                })
          ],
        ),
      ),
    );
  }

  Future<void> signin() async {
    final email = _emailController.text;
    final password = _passwordController.text;
    await Firebase.initializeApp().then((value) async {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Home()),
        );
      });
    });
    
  }
}
