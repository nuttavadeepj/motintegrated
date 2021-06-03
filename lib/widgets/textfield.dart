import 'package:flutter/material.dart';

class ProfileTextField extends StatelessWidget {
  final hintText;
  final isPassword;
  final isAddress;
  final errorText;

  ProfileTextField(
      {@required this.hintText,
      this.isPassword = false,
      this.isAddress = false,
      @required this.errorText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 1.0),
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            child: TextFormField(
              maxLines: isAddress ? 3 : 1,
              obscureText: isPassword,
              style: TextStyle(fontSize: 19, fontFamily: 'Jost'),
              decoration: InputDecoration(
                hintText: hintText,
                fillColor: Colors.white,
                suffixIcon: IconButton(
                  icon: Icon(Icons.check),
                  padding: EdgeInsets.zero,
                  constraints: BoxConstraints(),
                  onPressed: () {
                    print('click');
                  },
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Color(0xFF323232)),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Color(0xFF323232)),
                  borderRadius: BorderRadius.circular(10),
                ),
                isDense: true,
                contentPadding: EdgeInsets.symmetric(horizontal: 12),
              ),

              // validator: (value) {
              //   if (value.isEmpty) {
              //     return errorText;
              //   }
              //   if (isName) {
              //     if ((value.length > 14) && value.isNotEmpty) {
              //       return "Name must not more than 14 characters";
              //     }
              //   }
              //   if (isPassword) {
              //     if ((value.length < 6) && value.isNotEmpty) {
              //       return "Password contains at least 6 characters";
              //     }
              //   }
              //   return null;
              // },
            ),
          ),
        ],
      ),
    );
  }
}

class CheckOutTextField extends StatelessWidget {
  final hintText;
  final isAddress;
  final errorText;

  CheckOutTextField(
      {@required this.hintText,
      this.isAddress = false,
      @required this.errorText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            child: TextFormField(
              maxLines: isAddress ? 3 : 1,
              style: TextStyle(fontSize: 19, fontFamily: 'Jost'),
              decoration: InputDecoration(
                  hintText: hintText,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                     borderSide: BorderSide.none
                  ),
                  isDense: true,
                  fillColor: Colors.white,
                  filled: true,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 12, vertical: 7)),

              // validator: (value) {
              //   if (value.isEmpty) {
              //     return errorText;
              //   }
              //   if (isName) {
              //     if ((value.length > 14) && value.isNotEmpty) {
              //       return "Name must not more than 14 characters";
              //     }
              //   }
              //   if (isPassword) {
              //     if ((value.length < 6) && value.isNotEmpty) {
              //       return "Password contains at least 6 characters";
              //     }
              //   }
              //   return null;
              // },
            ),
          ),
        ],
      ),
    );
  }
}
