import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SparkText extends StatefulWidget {

  final String text;
  final double size;
  final bool isRequired;
  final FontWeight fontWeight;
  final TextDecoration textDecoration;
  final Color color;

  @override
  State<StatefulWidget> createState() => _SparkText();

  SparkText({
    @required this.text,
    this.size = 16,
    this.fontWeight,
    this.color = Colors.black87,
    this.isRequired = false,
    this.textDecoration
  });

}

class _SparkText extends State<SparkText> {


  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(style: TextStyle(
          color: widget.color,
          fontSize: widget.size,
          fontWeight: widget.fontWeight
      ),
          children: <TextSpan> [
            TextSpan(text: widget.text, style: TextStyle(decoration: widget.textDecoration)),
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