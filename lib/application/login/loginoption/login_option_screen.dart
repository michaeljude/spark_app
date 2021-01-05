import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spark_app/application/login/loginviaguest/landing_screen.dart';
import 'package:spark_app/core/widgets/login_button.dart';

class LoginOptionScreen extends StatelessWidget {

  static final String routeName = "/login-option";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    const Color(0xff92CC12),
                    const Color(0xff19BA19)
                  ],
                  tileMode: TileMode.repeated
              )
          ),
          child: Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
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
                          "dkhawkudai diuwahdukaw dka khdawkh dawhdwaui dhwad awihd iuawhdwaio d",
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
                          child: LogoButton(
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
                          icon: Icons.account_circle_outlined,
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
                          icon: Icons.accessibility_sharp,
                          buttonText: "Sign Up With Facebook".toUpperCase(),
                          action: () => _loginViaFacebook(context),
                        ),
                      ),
                    ),
                  ],
                ),
              )
        )
    );
  }

  void _loginViaGuest(BuildContext context) => Navigator.pushNamed(context, LoginScreen.routeName);

  void _loginViaFacebook(BuildContext context) {
    
  }
  void _loginViaGoogle(BuildContext context) {
    
  }
  
}
