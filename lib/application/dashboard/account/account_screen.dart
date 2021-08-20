import 'package:flutter/material.dart';
import 'package:spark_app/theme/app_theme.dart';

import 'components/body.dart';

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
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: HexColor('#ffffff'),
        elevation: 0.0,
        title: Text("Account",
        style: TextStyle(

            color: HexColor('#525252'),
            fontSize: 18,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w500),
        ),
      ),
      body: Body(),
    );
  }
}