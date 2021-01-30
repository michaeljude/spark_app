import 'package:flutter/material.dart';

class SparkScaffold extends StatelessWidget {

  final Widget body;
  final Function onLeadingIconFunction;
  final Icon icon;
  final Color backgroundColor;

  SparkScaffold({
    this.body,
    this.onLeadingIconFunction,
    this.icon,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              backgroundColor: this.backgroundColor,
              elevation: 0.0,
              leading: IconButton(
                icon: this.icon,
                onPressed: () {
                  this.onLeadingIconFunction();
                },
              ),
            ),
            body: this.body
    );
  }

}