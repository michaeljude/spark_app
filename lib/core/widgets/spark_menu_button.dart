import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:spark_app/theme/app_theme.dart';

class SparkMenuButton extends StatelessWidget {

  final double size;
  final String urlImage;
  final Function action;


  SparkMenuButton({
    @required this.size,
    @required this.urlImage,
    @required this.action,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:
        const EdgeInsets.only(top: 30, left: 20, right: 20, bottom: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          mainAxisSize: MainAxisSize.max,

          children: <Widget>[
            Align(
              alignment: Alignment.bottomCenter,
              child: GestureDetector(
                  child: Image.asset(this.urlImage,
                    height: this.size,
                  ),
                  onTap: () {
                   this.action();
                  }
                  ),
            ),
            Padding(padding: const EdgeInsets.only(top: 15),
              child:Align(

                alignment: Alignment
                    .center, // Align however you like (i.e .centerRight, centerLeft)
                child: Text(
                  'Search Destination',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    letterSpacing: 0.27,
                    fontFamily: 'Montserrat',
                    color: HexColor('#525252'),
                  ),
                ),
              ),
            ),
          ],

        ),


    );
  }
}