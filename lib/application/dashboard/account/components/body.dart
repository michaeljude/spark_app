

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rating_dialog/rating_dialog.dart';
import 'package:spark_app/application/dashboard/account/be_our_partner/be_our_partner_screen.dart';
import 'package:store_redirect/store_redirect.dart';
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
          // ProfileMenu(
          //   text: "Settings",
          //   press: () {},
          // ),
          ProfileMenu(
            text: "Help Centre",
            press: () {},
          ),
          ProfileMenu(
            text: "Share Feedback",
            press: () {_showRatingDialog(context);},
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

void _showRatingDialog(BuildContext context) {
  // We use the built in showDialog function to show our Rating Dialog
  final String sparkTextLogo = 'assets/images/spark_text_logo.svg';
  showDialog(
      context: context,
      barrierDismissible: true, // set to false if you want to force a rating
      builder: (context) {
        return RatingDialog(

          // your app's name?
          title: 'Rate Us On Google Play',
          // encourage your user to leave a high rating?
          description:
          'Select Number of Stars 1 - 5 to Rate This App',
          // your app's logo?
          icon: SvgPicture.asset(
            sparkTextLogo,
            semanticsLabel: 'Spark Logo',
            height: 50,
            width: 150,
          ),
          submitButton: 'Submit',
          // onCancelled: () => print('cancelled'),
          onSubmitPressed: (response) {
            print('rating: ${response}, comment: ${response}');
            // TODO: add your own logic
            if (response < 3.0) {
              // send their comments to your email or anywhere you wish
              // ask the user to contact you instead of leaving a bad review
            } else {
              //go to app store
              // StoreRedirect.redirect(
              //     androidAppId: '');
            }
          },
        );
      });
}

