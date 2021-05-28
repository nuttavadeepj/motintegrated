import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({@required this.text, required this.onPressed});
  final text;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(top: 35.0),
        child: Container(
          width: 150,
        height: 43,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            gradient: LinearGradient(
              colors: [Color(0xFF4A5F30), Color(0xFF65873B)],
              begin: FractionalOffset.centerLeft,
              end: FractionalOffset.centerRight,
            ),
          ),
          child: MaterialButton(
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          shape: StadiumBorder(),
          child: Text(
            text,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: onPressed,
          ),
        ),
      );
}
