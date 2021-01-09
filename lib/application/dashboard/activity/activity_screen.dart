import 'package:flutter/material.dart';

class ActivityScreen extends StatefulWidget {
  static final String routeName = "/activity";

  final String text;

  ActivityScreen({this.text}) : super();

  @override
  _ActivityScreenState createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('${widget.text}'),
      ),
    );
  }
}