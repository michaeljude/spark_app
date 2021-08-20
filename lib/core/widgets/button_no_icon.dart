
import 'package:flutter/material.dart';

class SparkButton extends StatelessWidget {

  final Color color;
  final String buttonText;
  final Function action;
  final bool isEnabled;
  final Color textcolor;

  SparkButton({
    @required this.color,
    @required this.buttonText,
    @required this.action,
    this.textcolor,
    this.isEnabled = true
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: RaisedButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5)
        ),
        onPressed: isEnabled ? () {
          this.action();
        } : null,
        color: _getBackgroudColor(),
        child: Padding(
          padding: const EdgeInsets.only(top: 14.0, bottom: 14.0),
          child: Text(
            this.buttonText,
            style: TextStyle(
              color: this.textcolor,
              fontSize: 16,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  Color _getBackgroudColor() {
    if(this.isEnabled) {
      return this.color;
    } else return Colors.grey; 
  }

  Color _getFontColor() {
    if(this.isEnabled) {
      return Colors.white;
    } else return Colors.black45; 
  }

}