import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExpandedSparkText extends StatefulWidget {
  final String text;
  final double size;
  final bool isRequired;
  final FontWeight fontWeight;
  final TextDecoration textDecoration;
  final Color color;

  @override
  State<StatefulWidget> createState() => _ExpandedSparkText();

  ExpandedSparkText(
      {@required this.text,
      this.size = 16,
      this.fontWeight,
      this.color = Colors.black87,
      this.isRequired = false,
      this.textDecoration});
}

class _ExpandedSparkText extends State<ExpandedSparkText> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RichText(
        text: TextSpan(
            style: TextStyle(
                color: widget.color,
                fontSize: widget.size,
                fontWeight: widget.fontWeight),
            children: <TextSpan>[
              TextSpan(
                  text: widget.text,
                  style: TextStyle(decoration: widget.textDecoration)),
              TextSpan(
                  text: widget.isRequired ? " *" : "",
                  style: TextStyle(color: Colors.red))
            ]),
      ),
    );
  }
}
