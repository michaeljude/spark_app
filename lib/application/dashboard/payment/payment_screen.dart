import 'package:flutter/material.dart';

class PaymentScreen extends StatefulWidget {
  static final String routeName = "/payment";

  final String text;

  PaymentScreen({this.text}) : super();

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('${widget.text}'),
      ),
    );
  }
}