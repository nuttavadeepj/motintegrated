import 'package:flutter/material.dart';

class StyledInputText extends StatelessWidget {
  final hintText;
  final icon;
  final isName;
  final isPassword;
  final isAddress;
  final errorText;

  StyledInputText(
      {@required this.hintText,
      this.icon,
      this.isName = false,
      this.isPassword = false,
      this.isAddress = false,
      @required this.errorText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25.0),
      child: Container(
        width: MediaQuery.of(context).size.width / 1.2,
        padding: EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Colors.white,
            boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)]),
        child: TextFormField(
          maxLines: isAddress ? 3 : 1,
          obscureText: isPassword,
          style: TextStyle(fontSize: 20, fontFamily: 'Jost'),
          decoration: InputDecoration(
            hintText: hintText,
            icon: isAddress
                ? Padding(
                  padding: const EdgeInsets.only(bottom: 55.0),
                  child: Icon(icon, color: Colors.grey[700], size: 22),
                )
                : Icon(icon, color: Colors.grey[700], size: 22),
            fillColor: Colors.white,
            border: InputBorder.none,
            isDense: true,
            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
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
    );
  }
}
