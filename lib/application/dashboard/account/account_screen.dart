import 'package:flutter/material.dart';

class AccountScreen extends StatefulWidget {
  static final String routeName = "/account";

  final String text;

  AccountScreen({this.text}) : super();

  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('${widget.text}'),
      ),
    );
  }
}