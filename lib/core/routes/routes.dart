import 'package:flutter/cupertino.dart';
import 'package:spark_app/application/dashboard/home/search_destination/searchlocation/search_location_modal.dart';
import 'package:spark_app/application/login/loginviaguest/landing_screen.dart';
import 'package:spark_app/application/login/loginoption/login_option_screen.dart';
import 'package:spark_app/application/login/registration/driver_detail_screen.dart';
import 'package:spark_app/application/login/registration/registration_screen.dart';
import 'package:spark_app/application/reusablescreens/camera_screen.dart';
import 'package:spark_app/application/splash_screen.dart';
import 'package:spark_app/application/walkthrough_onboarding.dart';
import 'package:spark_app/application/dashboard/bottom_navigation/bottom_navigation_screen.dart';
import 'package:spark_app/application/dashboard/home/home_screen.dart';
import 'package:spark_app/application/dashboard/activity/activity_screen.dart';
import 'package:spark_app/application/dashboard/payment/payment_screen.dart';
import 'package:spark_app/application/dashboard/message/messagelist/message_screen.dart';
import 'package:spark_app/application/dashboard/account/account_screen.dart';
import 'package:spark_app/application/dashboard/home/search_destination/search_destination_screen.dart';
import 'package:spark_app/application/dashboard/account/be_our_partner/be_our_partner_screen.dart';
import 'package:spark_app/application/dashboard/home/walkin_parking/walkin_parking_screen.dart';


class AppRoutes {
  static String initialRoute = SplashScreen.routeName;

  static final routes = {
    SplashScreen.routeName: (BuildContext context) => SplashScreen(),
    WalkthroughOnboarding.routeName: (BuildContext context) => WalkthroughOnboarding(),
    LoginOptionScreen.routeName: (BuildContext context) => LoginOptionScreen(),
    LoginScreen.routeName: (BuildContext context) => LoginScreen(),
    HomeScreen.routeName: (BuildContext context) => HomeScreen(),
    ActivityScreen.routeName: (BuildContext context) => ActivityScreen(),
    PaymentScreen.routeName: (BuildContext context) => PaymentScreen(),
    MessageScreen.routeName: (BuildContext context) => MessageScreen(),
    AccountScreen.routeName: (BuildContext context) => AccountScreen(),
    BottomNavigationScreen.routeName: (BuildContext context) => new BottomNavigationScreen(),
    RegistrationScreen.routeName: (BuildContext context) => RegistrationScreen(),
    // PersonalInformationScreen.routeName: (BuildContext context) => PersonalInformationScreen(),
    CameraScreen.routeName: (BuildContext context) => CameraScreen(),
    SearchDestinationScreen.routeName: (BuildContext context) => SearchDestinationScreen(),
    SearchLocationModal.routeName: (context) => SearchLocationModal(),
    BeOurPartnerScreen.routeName: (BuildContext context) => BeOurPartnerScreen(),
    WalkInParkingScreen.routeName: (BuildContext context) => WalkInParkingScreen()
  };
}