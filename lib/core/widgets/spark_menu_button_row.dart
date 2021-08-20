import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:spark_app/theme/app_theme.dart';

class SparkMenuButtonRow extends StatelessWidget {

  final double size;
  final String urlImage;
  final Function action;
  final String label;


  SparkMenuButtonRow({
    @required this.size,
    @required this.urlImage,
    @required this.action,
    @required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: <Widget>[
          GestureDetector(
            child: Image.asset(
              this.urlImage,
              height: this.size,
            ),
            onTap: () {
              this.action();
            },
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(
              this.label,
              style: TextStyle(
                fontSize: 14,
                letterSpacing: 0.27,
                fontFamily: 'Montserrat',
                color: HexColor('#525252'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}