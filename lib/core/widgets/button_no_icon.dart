
import 'package:flutter/material.dart';

class ButtonNoIcon extends StatelessWidget {

  final Color color;
  final String buttonText;
  final Function action;

  ButtonNoIcon({
    @required this.color,
    @required this.buttonText,
    @required this.action,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: RaisedButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8)
        ),
        onPressed: () {
          this.action();
        },
        color: this.color,
        child: Text(
          this.buttonText,
          style: TextStyle(
            color: Colors.white,
            fontSize: 17,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }


}