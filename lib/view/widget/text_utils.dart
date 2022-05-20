import 'package:flutter/material.dart';

class TextUtlis extends StatelessWidget {
  final String title;
  final double fontSize, letterSpacing;
  final Color textColor;
  final FontWeight fontWeight;

  TextUtlis({
    required this.title,
    required this.fontSize,
    required this.textColor,
    required this.fontWeight,
    required this.letterSpacing,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
          color: textColor,
          fontSize: fontSize,
          fontWeight: fontWeight,
          letterSpacing: letterSpacing),
    );
  }
}
