import 'package:flutter/material.dart';

class SparkScaffold extends StatelessWidget {
  SparkScaffold({
    @required this.body,
    @required this.backgroundColor,
    this.scaffoldBgColor,
    this.onLeadingIconFunction,
    this.icon,
    this.leading,
    this.appBar,
  });

  SparkScaffold.withCustomAppBar({
    this.body,
    this.onLeadingIconFunction,
    this.icon,
    this.backgroundColor,
    this.appBar,
    this.scaffoldBgColor,
    this.leading,
  });

  final Widget body;
  final Function onLeadingIconFunction;
  final Icon icon;
  final Color backgroundColor;
  final Color scaffoldBgColor;
  final Widget leading;
  final PreferredSizeWidget appBar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: scaffoldBgColor,
        resizeToAvoidBottomInset: false,
        appBar: appBar ??
            AppBar(
              backgroundColor: backgroundColor,
              elevation: 0.0,
              leading: IconButton(
                icon: icon,
                onPressed: () {
                  onLeadingIconFunction();
                },
              ),
            ),
        body: body);
  }
}
