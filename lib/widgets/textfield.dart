import 'package:flutter/material.dart';

class StyledTextField extends StatelessWidget {
  final label;
  final hintText;
  final isPassword;
  final isAddress;
  final errorText;

  StyledTextField(
      {@required this.label,
      @required this.hintText,
      this.isPassword = false,
      this.isAddress = false,
      @required this.errorText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                label,
                style: TextStyle(
                    fontFamily: 'Jost', color: Color(0xFF323232), fontSize: 19),
              ),
            ],
          ),
          Container(
            width: MediaQuery.of(context).size.width / 1.23,
            child: TextFormField(
              maxLines: isAddress ? 3 : 1,
              obscureText: isPassword,
              style: TextStyle(fontSize: 19, fontFamily: 'Jost'),
              decoration: InputDecoration(
                hintText: hintText,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Color(0xFF323232)),
                  borderRadius: BorderRadius.circular(5),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Color(0xFF323232)),
                  borderRadius: BorderRadius.circular(5),
                ),
                isDense: true,
                fillColor: Colors.white,
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 12, vertical: 6),
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
