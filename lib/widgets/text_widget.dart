import 'package:flutter/material.dart';
class TextWidget extends StatelessWidget {
  const TextWidget(
      {super.key, required this.text, this.color, this.fontSize = 26, this.fontWeight, this.fontFamily, this.maxLines, this.overflow});
  final String text;
  final Color? color;
  final double fontSize;
  final FontWeight? fontWeight;
  final String? fontFamily;
  final int? maxLines;
  final TextOverflow? overflow;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines:maxLines ,
      overflow: overflow,
      style: TextStyle(
        fontSize: fontSize,
        color: color,
        fontWeight: fontWeight,
        fontFamily: fontFamily,
      ),
    );
  }
}
