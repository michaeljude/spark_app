import 'package:flutter/material.dart';
import 'package:spark_app/app_theme.dart';

class HomeScreen extends StatefulWidget {

  static final String routeName = "/home";

  final String text;

  HomeScreen({this.text}) : super();

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  AnimationController animationController;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('${widget.text}'),
      ),
    );
  }
}