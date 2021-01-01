import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spark_app/application/login/landing_screen.dart';

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

          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                        padding: const EdgeInsets.fromLTRB(20, 100, 20, 20),
                        child: Image.asset(
                          "assets/images/spark_logo.png",
                          height: 200,
                          width: 200,
                        ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.all(40),
                        child: Flexible(
                          child: Text(
                            "dkhawkudai diuwahdukaw dka khdawkh dawhdwaui dhwad awihd iuawhdwaio d",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,

                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: FlatButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)
                            ),
                            onPressed: () {
                                _goToLoginViaGuest(context);
                            },
                            color: const Color(0xff117E96),
                            highlightColor: Colors.white,
                            child: Text(
                              "Continue To Login".toUpperCase(),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,

                              ),
                              textAlign: TextAlign.center,
                            ),
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
                        child: SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: RaisedButton.icon(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)
                            ),
                            onPressed: () {

                            },
                            color: Colors.red,
                            highlightColor: Colors.white,
                            icon: Icon(
                              Icons.account_circle_outlined
                            ),
                            label: Text(
                              "Sign Up With Google".toUpperCase(),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,

                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: RaisedButton.icon(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)
                            ),
                            onPressed: () {

                            },
                            icon: Icon(
                                Icons.accessibility_sharp
                            ),
                            color: const Color(0xff3B5998),
                            highlightColor: Colors.white,
                            label: Text(
                              "Sign Up With Facebook".toUpperCase(),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,

                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        )
    );
  }

  void _goToLoginViaGuest(BuildContext context) => Navigator.pushNamed(context, LoginScreen.routeName);

}