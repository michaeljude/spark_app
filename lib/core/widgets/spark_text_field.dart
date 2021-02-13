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
    this.controller
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        controller: this.controller,
        readOnly: this.readOnly,
        onTap: () => this.onTap(),
        decoration: InputDecoration(
          hintText: this.placeholder,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10)
          )
        ),
      )
    );
  }
}