import 'package:flutter/material.dart';
import 'package:yum/constants.dart';

class LoginSignUpButton extends StatelessWidget {
  final String text;
  final Function press;
  final Color color, textColor;
  const LoginSignUpButton({
    Key key,
    this.text,
    this.press,
    this.color = kPrimaryButtonColor,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      width: size.width * 0.8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(40),
        child: FlatButton(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
          color: color,
          onPressed: press,
          child: Text(
            text,
            style: TextStyle(color: textColor),
          ),
        ),
      ),
    );
  }
}
