
import 'package:flutter/material.dart';

class SparkButton extends StatelessWidget {

  final Color color;
  final String buttonText;
  final Function action;
  final bool isEnabled;

  SparkButton({
    @required this.color,
    @required this.buttonText,
    @required this.action,
    this.isEnabled = true
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
        onPressed: isEnabled ? () {
          this.action();
        } : null,
        color: _getBackgroudColor(),
        child: Text(
          this.buttonText,
          style: TextStyle(
            color: _getFontColor(),
            fontSize: 17,
          ),
          textAlign: TextAlign.center,
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