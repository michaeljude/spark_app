
import 'package:flutter/material.dart';

class LogoButton extends StatelessWidget {

  final Color color;
  final IconData icon;
  final Color iconColor;
  final String buttonText;
  final Function action;

  LogoButton({
    @required this.color,
    this.icon,
    this.iconColor,
    @required this.buttonText,
    @required this.action,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: RaisedButton.icon(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8)
        ),
        onPressed: () {
          this.action();
        },
        color: this.color,
        icon: Icon(
            this.icon,
          color: this.iconColor,

        ),
        label: Padding(
          padding: const EdgeInsets.only(top: 14, bottom: 14),
          child: Text(
            this.buttonText,
            style: TextStyle(
              color: Colors.white,
              fontSize: 17,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }



}