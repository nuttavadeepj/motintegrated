import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:motintegrated/models/user_model.dart';
import 'package:motintegrated/widgets/textfield.dart';
import 'package:motintegrated/widgets/button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:motintegrated/screens/home.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _emailController = TextEditingController();

  final _nameController = TextEditingController();

  final _passwordController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();

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
                        AuthTextField(
                            controller: _nameController,
                            hintText: 'Name',
                            icon: Icons.account_circle),
                        AuthTextField(
                            controller: _emailController,
                            hintText: 'Email',
                            icon: Icons.email),
                        AuthTextField(
                          controller: _passwordController,
                          hintText: 'Password',
                          icon: Icons.vpn_key,
                          isPassword: true,
                        ),
                        AuthTextField(
                            controller: _phoneController,
                            hintText: "Phone Number",
                            icon: Icons.phone),
                        AuthTextField(
                            controller: _addressController,
                            hintText: "Address",
                            isAddress: true,
                            icon: Icons.house),
                      ],
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.only(bottom: 55.0),
                child: AuthButton(
                    text: 'Sign Up',
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        signup();
                      }
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> signup() async {
    final email = _emailController.text;
    final name = _nameController.text;
    final password = _passwordController.text;
    final phone = _phoneController.text;
    final address = _addressController.text;

    await Firebase.initializeApp().then((value) async {
      print('signup by $email, password: $password, name: $name');
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        await value.user!.updateDisplayName(name).then((value2) async {
          String uid = value.user!.uid;
          print('this is usereid $uid');
          UserModel model = UserModel(
              address: address,
              email: email,
              name: name,
              phone: phone,
              point: '0');
          Map<String, dynamic> data = model.toMap();
          await FirebaseFirestore.instance
              .collection('user')
              .doc(uid)
              .set(data)
              .then((value) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => Home()),
            );
          });
        });
      });
    });
  }
}
