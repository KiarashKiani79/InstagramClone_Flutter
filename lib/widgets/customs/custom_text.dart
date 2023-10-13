import 'package:flutter/material.dart';

import '../../utils/device_size.dart';

class MyTitleText extends StatelessWidget {
  const MyTitleText({
    super.key,
    required this.text,
    this.color,
    this.fontSize,
    this.fontWeight,
    this.fontFamily,
  });

  final String text;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final String? fontFamily;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: fontSize ?? Device.largeTextSize,
        fontWeight: fontWeight ?? FontWeight.normal,
        fontFamily: fontFamily,
      ),
    );
  }
}

class MySubtitleText extends StatelessWidget {
  const MySubtitleText({
    super.key,
    required this.text,
    this.color,
    this.fontSize,
    this.fontWeight,
    this.fontFamily,
  });

  final String text;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final String? fontFamily;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: fontSize ?? Device.mediumTextSize,
        fontWeight: fontWeight ?? FontWeight.normal,
        fontFamily: fontFamily,
      ),
    );
  }
}
