import 'package:flutter/cupertino.dart';
import 'package:spark_app/application/login/loginviaguest/landing_screen.dart';
import 'package:spark_app/application/login/loginoption/login_option_screen.dart';
import 'package:spark_app/application/login/registration/registration_screen.dart';
import 'package:spark_app/application/splash_screen.dart';

class AppRoutes {
  static String initialRoute = SplashScreen.routeName;

  static final routes = {
    SplashScreen.routeName: (BuildContext context) => SplashScreen(),
    LoginOptionScreen.routeName: (BuildContext context) => LoginOptionScreen(),
    LoginScreen.routeName: (BuildContext context) => LoginScreen(),
    RegistrationScreen.routeName: (BuildContext context) => RegistrationScreen(),
  };
}