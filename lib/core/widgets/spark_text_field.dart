import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SparkTextField extends StatelessWidget {

  final String placeholder;
  final Function onTap;
  final bool readOnly;
  final TextEditingController controller;

  SparkTextField({
    this.placeholder,
    this.onTap,
    this.readOnly = false,
    this.controller, InputDecoration decoration
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        controller: this.controller,
        readOnly: this.readOnly,
        style: TextStyle(fontFamily: 'Montserrat'),
        onTap: () => this.onTap(),
        decoration: InputDecoration(
          hintText: this.placeholder,
          labelStyle: TextStyle(fontFamily: 'Montserrat'),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10)
          )
        ),
      )
    );
  }
}