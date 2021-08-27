import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:spark_app/theme/app_theme.dart';

class SparkDivider extends StatelessWidget {






  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:
      const EdgeInsets.only(top: 20, left: 0, right: 0, bottom: 8.0),
      child: Divider(
        color: HexColor('#FAFAFA'),
        height: 20,
        thickness: 7,
      ),
    );
  }
}