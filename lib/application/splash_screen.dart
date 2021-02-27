import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spark_app/application/dashboard/bottom_navigation/bottom_navigation_screen.dart';
import 'package:spark_app/application/login/loginoption/login_option_screen.dart';
import 'package:spark_app/core/repository/persistence/local_persistence.dart';

class SplashScreen extends StatefulWidget {
  static final routeName = "/splash-screen";

  @override
  State<StatefulWidget> createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen> {
  var _opacity;

  @override
  void initState() {
    super.initState();
    _opacity = 0.0;

    _startSparkSplash();
    _goToNextPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [const Color(0xff92CC12), const Color(0xff19BA19)],
              tileMode: TileMode.repeated)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                  padding: const EdgeInsets.fromLTRB(20, 200, 20, 20),
                  child: AnimatedOpacity(
                    opacity: _opacity,
                    duration: Duration(milliseconds: 500),
                    child: Image.asset(
                      "assets/images/spark_logo_white.png",
                      height: 200,
                      width: 200,
                    ),
                  )),
            ],
          )
        ],
      ),
    ));
  }

  Future<void> _startSparkSplash() {
    return Future<void>.delayed(Duration(milliseconds: 1000), () {
      setState(() {
        _opacity = 1.0;
      });
    });
  }

  Future<void> _goToNextPage() async {
    bool hasUser = await LocalPersistence.instance().hasUser();
    return Future<void>.delayed(Duration(milliseconds: 5000), () {
      if (!hasUser) {
        Navigator.pushReplacementNamed(context, LoginOptionScreen.routeName);
      } else {
        Navigator.pushReplacement(context, BottomNavigationScreen.route());
      }
    });
  }
}
