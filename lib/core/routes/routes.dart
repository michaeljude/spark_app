import 'package:flutter/cupertino.dart';
import 'package:spark_app/application/login/loginviaguest/landing_screen.dart';
import 'package:spark_app/application/login/loginoption/login_option_screen.dart';
import 'package:spark_app/application/login/registration/registration_screen.dart';
import 'package:spark_app/application/splash_screen.dart';
import 'package:spark_app/application/dashboard/bottom_navigation/bottom_navigation_screen.dart';
import 'package:spark_app/application/dashboard/home/home_screen.dart';
import 'package:spark_app/application/dashboard/activity/activity_screen.dart';
import 'package:spark_app/application/dashboard/payment/payment_screen.dart';
import 'package:spark_app/application/dashboard/message/message_screen.dart';
import 'package:spark_app/application/dashboard/account/account_screen.dart';

class AppRoutes {
  static String initialRoute = SplashScreen.routeName;

  static final routes = {
    SplashScreen.routeName: (BuildContext context) => SplashScreen(),
    LoginOptionScreen.routeName: (BuildContext context) => LoginOptionScreen(),
    LoginScreen.routeName: (BuildContext context) => LoginScreen(),
    HomeScreen.routeName: (BuildContext context) => HomeScreen(),
    ActivityScreen.routeName: (BuildContext context) => ActivityScreen(),
    PaymentScreen.routeName: (BuildContext context) => PaymentScreen(),
    MessageScreen.routeName: (BuildContext context) => MessageScreen(),
    AccountScreen.routeName: (BuildContext context) => AccountScreen(),
    BottomNavigationScreen.routeName: (BuildContext context) => BottomNavigationScreen(),
    RegistrationScreen.routeName: (BuildContext context) => RegistrationScreen(),
    PersonalInformationScreen.routeName: (BuildContext context) => PersonalInformationScreen(),
  };
}