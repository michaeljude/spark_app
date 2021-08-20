import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_version/get_version.dart';
import 'package:spark_app/application/login/registration/registration_screen.dart';
import 'package:spark_app/core/widgets/spark_text.dart';
import 'package:spark_app/theme/presentation/custom_icons.dart';
import 'package:spark_app/application/login/loginviaguest/landing_screen.dart';
import 'package:spark_app/core/widgets/login_button.dart';
import 'package:spark_app/core/widgets/button_no_icon.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginOptionScreen extends StatefulWidget {
  static final String routeName = "/login-option";


  @override
  State<StatefulWidget> createState() => _LoginOptionScreen();
}

class _LoginOptionScreen extends State<LoginOptionScreen> {
  String _version;
  String _versionCode;
  final String sparkLogo = 'assets/images/login_option_logo.svg';

  @override
  void initState() {
    super.initState();
    setVersionDetails();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: const Color(0xff92CC12)
    ));
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [const Color(0xff92CC12), const Color(0xff19BA19)],
              tileMode: TileMode.repeated)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.fromLTRB(20, 100, 20, 20),
            child:
            // Image.asset(
            //   "assets/images/spark_logo_white.png",

            // ),
            SvgPicture.asset(
                sparkLogo,
                semanticsLabel: 'Spark Logo',
                height: 170,
                width: 170,
            ),
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(left: 40, right: 40, bottom: 30),
            child: Text(
              "You need to sign in or create an account to continue.",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only( top: 20, left: 20, right: 20, bottom: 10),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: SparkButton(
                  color: const Color(0xff117E96),
                  textcolor: const Color(0xffffffff),
                  buttonText: "Continue To Login".toUpperCase(),
                  action: () => _loginViaGuest(context),
                ),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: SparkButton(
                  color: const Color(0xffffffff),
                  buttonText: "Create account to login".toUpperCase(),
                  textcolor: const Color(0xff117E96),
                  action: () => _CreateAccount(context),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 28.0, right: 28, bottom: 20),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Divider(
                    thickness: 1,
                    color: Colors.white,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: Text(
                    "or",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                ),
                Expanded(
                  child: Divider(
                    thickness: 1,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
              child: LogoButton(
                color: Colors.red,
                icon: CustomIcons.google,
                iconColor: Colors.white,
                buttonText: "Sign In With Google".toUpperCase(),
                action: () => _loginViaGoogle(context),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: LogoButton(
                color: const Color(0xff3B5998),
                icon: CustomIcons.facebook,
                iconColor: Colors.white,
                buttonText: "Sign In With Facebook".toUpperCase(),
                action: () => _loginViaFacebook(context),
              ),
            ),
          ),
          Expanded(
            child: Align(
                alignment: Alignment.bottomCenter,
                child: SparkText(
                  text: "${_version ?? ''} (${_versionCode ?? ''})",
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  size: 18,
                )),
          ),
          SizedBox(height: 10,),
        ],
      ),
    ));
  }

  void setVersionDetails() async {
    try {
      String version = await GetVersion.projectVersion;
      String code = await GetVersion.projectCode;
      setState(() {
        this._version = version;
        this._versionCode = code;
      });
    } on PlatformException {
      this._version = '';
      this._versionCode = '';
    }
  }
  //
  // void _loginViaGuest(BuildContext context) =>
  //     Navigator.of(context).pushNamed(LoginScreen.routeName);

  void _loginViaGuest(BuildContext context) =>
      Navigator.push(context, new MaterialPageRoute(
          builder: (context) =>
          new LoginScreen())
      );

  void _CreateAccount(BuildContext context) =>
      Navigator.push(context, new MaterialPageRoute(
          builder: (context) =>
          new RegistrationScreen())
      );
  void _loginViaFacebook(BuildContext context) {}
  void _loginViaGoogle(BuildContext context) {}
}
