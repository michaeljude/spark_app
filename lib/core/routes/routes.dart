import 'package:flutter/cupertino.dart';
import 'package:spark_app/application/login/landing_screen.dart';
import 'package:spark_app/application/login/login_option_screen.dart';
import 'package:spark_app/application/splash_screen.dart';

class AppRoutes {
  static String initialRoute = SplashScreen.routeName;

  static final routes = {
    SplashScreen.routeName: (BuildContext context) => SplashScreen(),
    LoginOptionScreen.routeName: (BuildContext context) => LoginOptionScreen(),
    LoginScreen.routeName: (BuildContext context) => LoginScreen(),
  };
}