import 'package:flutter/material.dart';

class ProfileButton extends StatelessWidget {
  const ProfileButton({@required this.text,@required  this.width, required this.onPressed});
  final text;
  final width;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(top: 35, bottom: 35),
        child: Container(
          width: width,
          height: 43,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              color: Color(0xFF4A5F30)),
          child: MaterialButton(
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              shape: StadiumBorder(),
              child: Text(
                text,
                style: TextStyle(
                    color: Colors.white, fontSize: 20, fontFamily: 'Jost'),
              ),
              onPressed: onPressed),
        ),
      );
}

class AboutButton extends StatelessWidget {
  const AboutButton(
      {@required this.text, this.width, this.height, required this.onPressed});
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
              border: Border.all(color: Color(0xff4A5F30),width: 3.0),
              color: Colors.white),
          child: MaterialButton(
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              shape: StadiumBorder(),
              child: Text(
                text,
                style: TextStyle(
                    color: Colors.black, fontSize: 20, fontFamily: 'Jost'),
              ),
              onPressed: onPressed),
        ),
      );
}
