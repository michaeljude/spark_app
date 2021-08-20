import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:spark_app/application/dashboard/account/be_our_partner/be_our_partner_screen.dart';
import 'profile_menu.dart';
import 'profile_pic.dart';
import 'package:spark_app/core/repository/persistence/local_persistence.dart';
import 'package:spark_app/application/login/loginoption/login_option_screen.dart';

class Body extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    const _url = 'https://flutter.dev';
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          ProfilePic(),
          SizedBox(height: 20),
          ProfileMenu(
            text: "Personal Information",
            press: () => {},
          ),

          ProfileMenu(
            text: "Vehicle Infromation",

            press: () {},
          ),
          ProfileMenu(
            text: "Be Our Partner",

            press: () {_beOurPartner(context);},
          ),
          ProfileMenu(
            text: "Settings",
            press: () {},
          ),
          ProfileMenu(
            text: "Help Centre",
            press: () {},
          ),
          ProfileMenu(
            text: "Share Feedback",
            press: () {},
          ),
          ProfileMenu(
            text: "Log Out",
            press: () {logoutUser(context);},
          ),
        ],
      ),
    );
  }


}


void logoutUser(BuildContext context){
  var _localPersistence = LocalPersistence.instance();
  _localPersistence.clearAppToken( LocalPersistence.appToken,
      LocalPersistence.currentUser);

  Navigator.pushReplacement(context, new MaterialPageRoute(
      builder: (context) =>
      new LoginOptionScreen())
  );
}

void _beOurPartner(BuildContext context){


  Navigator.push(context, new MaterialPageRoute(
      builder: (context) =>
      new BeOurPartnerScreen())
  );
}

