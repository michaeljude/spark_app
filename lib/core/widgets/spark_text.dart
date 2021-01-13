import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SparkText extends StatelessWidget {

  SparkText({
    @required this.text,
    this.size = 16,
    this.isBold = false,
    this.isCenter = false,
    this.bottomMargin = 24
  });

  final String text;
  double size;
  bool isBold;
  bool isCenter;
  double bottomMargin;

  @override
  Widget build(BuildContext context) {

    Alignment alignment = Alignment.centerLeft;
    if (isCenter) alignment = Alignment.center;

    FontWeight fontWeight;
    if(isBold) fontWeight = FontWeight.bold;

    return Container(
      alignment: alignment,
      padding: EdgeInsets.only(bottom: bottomMargin),
      child: Text(
        text,
        style: TextStyle(
          fontSize: this.size,
          fontWeight: fontWeight
        ),
      ),
    );
  }

}