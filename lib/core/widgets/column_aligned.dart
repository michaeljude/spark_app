import 'package:flutter/material.dart';

class ColumnAligned extends StatelessWidget {

  ColumnAligned({
    this.padding,
    this.children
  });
  List<Widget> children;
  EdgeInsets padding;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: this.padding,
      child: Column(
          children: children
      ),
    );
  }

}