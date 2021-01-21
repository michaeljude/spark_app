import 'package:flutter/material.dart';

class RowAligned extends StatelessWidget {

  RowAligned({
    this.padding,
    this.children
  });
  List<Widget> children;
  EdgeInsets padding;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: this.padding,
      child: Row(
          children: children
      ),
    );
  }

}