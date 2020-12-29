
import 'package:flutter/material.dart';

class LogoButton extends StatelessWidget {

  final Color color;
  final IconData icon;
  final String buttonText;
  final Function action;

  LogoButton({
    @required this.color,
    this.icon,
    @required this.buttonText,
    @required this.action,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: RaisedButton.icon(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8)
        ),
        onPressed: () {
          this.action();
        },
        color: this.color,
        icon: Icon(
            icon
        ),
        label: Text(
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