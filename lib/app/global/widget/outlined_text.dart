import 'package:flutter/material.dart';

Widget outlinedText(
    {required String text,
    String? fontFamily,
    double fontSize = 12,
    double strokeWidth = 2,
    Color textColor = Colors.white,
    Color strokeColor = Colors.black}) {
  return Stack(
    alignment: Alignment.topCenter,
    children: <Widget>[
      Text(
        text,
        style: TextStyle(
          fontSize: fontSize,
          fontFamily: fontFamily,
          foreground: Paint()
            ..style = PaintingStyle.stroke
            ..strokeWidth = strokeWidth
            ..color = strokeColor,
        ),
      ),
      Text(text,
          style: TextStyle(
              fontFamily: fontFamily, fontSize: fontSize, color: textColor)),
    ],
  );
}
