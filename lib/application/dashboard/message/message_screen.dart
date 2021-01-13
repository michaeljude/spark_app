import 'package:flutter/material.dart';

class MessageScreen extends StatefulWidget {
  static final String routeName = "/message";

  final String text;

  MessageScreen({this.text}) : super();

  @override
  _MessageScreenState createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('${widget.text}'),
      ),
    );
  }
}