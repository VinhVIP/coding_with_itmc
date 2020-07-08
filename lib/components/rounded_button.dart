import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Color textColor, backgroundColor, borderColor;
  final Function onPressed;

  RoundedButton(
      {Key key,
        this.text,
        this.textColor,
        this.backgroundColor,
        this.borderColor,
        this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        height: 45,
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: BoxDecoration(
          border: Border.all(
              color: borderColor, style: BorderStyle.solid, width: 1.3),
          borderRadius: BorderRadius.circular(25),
        ),
        child: MaterialButton(
          onPressed: onPressed,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          color: backgroundColor,
          elevation: 5,
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
              fontSize: 16,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
            ),
          ),
        ),
      ),
    );
  }
}