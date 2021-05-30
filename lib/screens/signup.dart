import 'package:flutter/material.dart';
import 'package:motintegrated/widgets/authtextfield.dart';
import 'package:motintegrated/widgets/authbutton.dart';
import 'package:motintegrated/screens/home.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8F8ED),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 1.0, horizontal: 40),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        StyledInputText(
                            hintText: "Name",
                            icon: Icons.account_circle,
                            errorText: "error"),
                        StyledInputText(
                            hintText: "Email",
                            icon: Icons.email,
                            errorText: "error"),
                        StyledInputText(
                            hintText: "Password",
                            icon: Icons.vpn_key,
                            errorText: "error",
                            isPassword: true),
                        StyledInputText(
                            hintText: "Phone Number",
                            icon: Icons.phone,
                            errorText: "error"),
                        StyledInputText(
                            hintText: "Address",
                            isAddress: true,
                            icon: Icons.house,
                            errorText: "error"),
                      ],
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.only(bottom: 55.0),
                child: AuthButton(
                    text: 'Sign Up',
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => (Home())));
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
