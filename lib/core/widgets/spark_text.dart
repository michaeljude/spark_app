import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spark_app/core/utils/constant_enums.dart';

class SparkText extends StatefulWidget {
  final String text;
  final double size;
  final bool isRequired;
  final FontWeight fontWeight;
  final TextDecoration textDecoration;
  final Positions position;
  final Color color;
  final TextAlign textAlign;

  @override
  State<StatefulWidget> createState() => _SparkText();

  SparkText(
      {@required this.text,
      this.size = 16,
      this.fontWeight,
      this.color = Colors.black87,
      this.isRequired = false,
      this.position,
      this.textDecoration,
      this.textAlign = TextAlign.left})
      : assert((isRequired == false && position == null) ||
            (isRequired == true && position != null));
}

class _SparkText extends State<SparkText> {
  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: widget.textAlign,
      text: TextSpan(
          style: TextStyle(
              color: widget.color,
              fontSize: widget.size,
              fontWeight: widget.fontWeight,
              fontFamily: 'Montserrat',),
          children: _requiredText()),
    );
  }

  List<TextSpan> _requiredText() {
    if (widget.position == Positions.RIGHT) {
      return [
        TextSpan(
            text: widget.text,
            style: TextStyle(decoration: widget.textDecoration)),
        TextSpan(
            text: widget.isRequired ? "* " : "",
            style: TextStyle(color: Colors.red))
      ];
    } else
      return [
        TextSpan(
            text: widget.isRequired ? " *" : "",
            style: TextStyle(color: Colors.red)),
        TextSpan(
            text: widget.text,
            style: TextStyle(decoration: widget.textDecoration)),
      ];
  }
}
