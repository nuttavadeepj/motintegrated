import 'package:flutter/material.dart';

class ProfileButton extends StatelessWidget {
  const ProfileButton({@required this.text, this.width, this.height, required this.onPressed});
  final text;
  final width;
  final height;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(top: 35, bottom: 35),
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              color: Color(0xFF4A5F30)),
          child: MaterialButton(
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              shape: StadiumBorder(),
              child: Text(
                text,
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: onPressed),
        ),
      );
}
