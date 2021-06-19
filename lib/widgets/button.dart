import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button(
      {@required this.text, @required this.width, required this.onPressed});
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
              border: Border.all(color: Color(0xff4A5F30), width: 3.0),
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

class CollectButton extends StatelessWidget {
  const CollectButton(
      {@required this.text, @required this.width, required this.onPressed});
  final text;
  final width;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) => Container(
        width: width,
        height: 20,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            color: Color(0xFF4A5F30)),
        child: MaterialButton(
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            shape: StadiumBorder(),
            child: Text(
              text,
              style: TextStyle(
                  color: Colors.white, fontSize: 12, fontFamily: 'Jost'),
            ),
            onPressed: onPressed),
      );
}

class WaitingButton extends StatelessWidget {
  const WaitingButton(
      {@required this.text, @required this.width, required this.onPressed});
  final text;
  final width;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) => Container(
        width: width,
        height: 20,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            color: Colors.black38),
        child: MaterialButton(
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            shape: StadiumBorder(),
            child: Text(
              text,
              style: TextStyle(
                  color: Colors.white, fontSize: 12, fontFamily: 'Jost'),
            ),
            onPressed: onPressed),
      );
}

