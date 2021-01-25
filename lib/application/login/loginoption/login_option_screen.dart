import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_version/get_version.dart';
import 'package:spark_app/core/widgets/spark_text.dart';
import 'package:spark_app/theme/presentation/custom_icons.dart';
import 'package:spark_app/application/login/loginviaguest/landing_screen.dart';
import 'package:spark_app/core/widgets/login_button.dart';
import 'package:spark_app/core/widgets/button_no_icon.dart';

class LoginOptionScreen extends StatefulWidget {
  static final String routeName = "/login-option";

  @override
  State<StatefulWidget> createState() => _LoginOptionScreen();
}

class _LoginOptionScreen extends State<LoginOptionScreen> {
  String _version;
  String _versionCode;

  @override
  void initState() {
    super.initState();
    setVersionDetails();
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.fromLTRB(20, 100, 20, 20),
            child: Image.asset(
              "assets/images/spark_logo_white.png",
              height: 200,
              width: 200,
            ),
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.all(40),
            child: Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: SparkButton(
                  color: const Color(0xff117E96),
                  buttonText: "Continue To Login".toUpperCase(),
                  action: () => _loginViaGuest(context),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(28.0),
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
                    style: TextStyle(color: Colors.white),
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
                buttonText: "Sign Up With Google".toUpperCase(),
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
                buttonText: "Sign Up With Facebook".toUpperCase(),
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

  void _loginViaGuest(BuildContext context) =>
      Navigator.of(context).pushNamed(LoginScreen.routeName);

  void _loginViaFacebook(BuildContext context) {}
  void _loginViaGoogle(BuildContext context) {}
}
