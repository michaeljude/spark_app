import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ErrorTextWithIcon extends StatelessWidget {

  ErrorTextWithIcon({this.text, this.isVisible = false});

  String text;
  bool isVisible;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isVisible,
      child: Container(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
          child: Row(
            children: <Widget>[
              Icon(Icons.add_circle, color: Colors.redAccent,),
              Padding(
                padding: const EdgeInsets.only(left: 44),
                child: Text(text, style: TextStyle(fontSize: 14, color: Colors.red),),
              )
            ],
          ),
        ),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.red, width: 2),
          borderRadius: BorderRadius.circular(8),
          color: Color.fromRGBO(255, 0, 0, 0.2)
        )
      ),
    );
  }

}