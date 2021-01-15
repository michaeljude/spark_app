import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SparkText extends StatefulWidget {

  final String text;
  final double size;
  final bool isRequired;
  final FontWeight fontWeight;

  @override
  State<StatefulWidget> createState() => _SparkText();

  SparkText({
    @required this.text,
    this.size = 16,
    this.fontWeight,
    this.isRequired = false
  });

}

class _SparkText extends State<SparkText> {


  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(style: TextStyle(
          color: Colors.black87,
          fontSize: widget.size,
          fontWeight: widget.fontWeight
      ),
          children: <TextSpan> [
            TextSpan(text: widget.text),
            TextSpan(
                text: widget.isRequired ? " *" : "",
                style: TextStyle(
                    color: Colors.red
                )
            )
          ]
      ),
    );
  }

}