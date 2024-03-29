import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:provider/provider.dart';
import 'package:search_map_place/search_map_place.dart';
import 'package:spark_app/application/dashboard/bottom_navigation/bottom_navigation_screen.dart';
import 'package:spark_app/application/login/loginviaguest/landing_bloc.dart';
import 'package:spark_app/application/login/loginviaguest/landing_event.dart';
import 'package:spark_app/application/login/loginviaguest/landing_state.dart';
import 'package:spark_app/application/login/registration/registration_screen.dart';
import 'package:spark_app/core/routes/routes.dart';
import 'package:spark_app/core/widgets/labeled_text_field.dart';
import 'package:spark_app/core/widgets/button_no_icon.dart';

class LoginScreen extends StatefulWidget {
  static final String routeName = "/login-via-guest";

  @override
  State<StatefulWidget> createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  LoginBloc _loginBloc;
  TextEditingController emailController;
  TextEditingController passwordController;
  ProgressDialog _progressDialog;
  String token;

  @override
  void initState() {
    super.initState();
    _loginBloc = BlocProvider.of<LoginBloc>(context);
    this.emailController = TextEditingController(text: "demo_spark@gmail.com");
    this.passwordController = TextEditingController(text: "demospark");

    Provider.of<FirebaseMessaging>(context, listen: false)
        .getToken()
        .then((token) {
      debugPrint(token);
      this.token = token;
    });

    setProgressDialog();
  }

  void setProgressDialog() {
    _progressDialog = ProgressDialog(this.context,
        type: ProgressDialogType.Normal, isDismissible: false, showLogs: true);
    _progressDialog.style(
      message: 'Please wait...',
      borderRadius: 10.0,
      backgroundColor: Colors.white,
      progressWidget: CircularProgressIndicator(),
      elevation: 10.0,
      insetAnimCurve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (BuildContext context, LoginState state) {
        if (state is LoginSuccessState) {
          debugPrint("LoginSuccessState");
          _progressDialog.hide();

          _dashboard(context);
        } else if (state is LoginStartedState) {
          debugPrint("LoginStartedState");
          _progressDialog.show();
        } else if (state is LoginFailedState) {
          debugPrint("LoginFailedState");
          _progressDialog.hide();
        }
      },
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          statusBarColor: Colors.green,
        ),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 100, 20, 20),
                  child: Image.asset(
                    "assets/images/spark_logo_green.png",
                    height: 150,
                    width: 150,
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(left: 40, right: 40),
                  child: Text(
                    "Login to access your account.",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 12.0, left: 30, right: 30),
                  child: Theme(
                    child: LabeledTextField(
                      title: "Email",
                      icon: Icons.account_circle,
                      hint: "Enter Email",
                      textController: emailController,
                    ),
                    data:
                        Theme.of(context).copyWith(primaryColor: Colors.green),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 12.0, left: 30, right: 30),
                  child: Theme(
                    child: LabeledTextField(
                      title: "Password",
                      icon: Icons.lock_rounded,
                      isTappable: true,
                      hint: "Enter Password",
                      textController: passwordController,
                    ),
                    data:
                        Theme.of(context).copyWith(primaryColor: Colors.green),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: InkWell(
                      child: Text("Forgot Password?"),
                      onTap: () {},
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding:
                        const EdgeInsets.only(bottom: 20, right: 30, left: 30),
                    alignment: Alignment.bottomCenter,
                    child: SparkButton(
                      color: const Color(0xff19BA19),
                      buttonText: "LOGIN",
                      action: () {
                        _loginBloc.add(LoginViaGuestEvent(emailController.text,
                            passwordController.text, token));
                      },
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 50, left: 30, right: 30),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        style: TextStyle(color: Colors.black, fontSize: 18),
                        children: <TextSpan>[
                          TextSpan(text: "Don't have an account?\n"),
                          TextSpan(
                              text: 'Register now! ',
                              style: TextStyle(color: Colors.blue),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  debugPrint("REGISTER NOW");
                                  _goToRegistration();
                                }),
                        ]),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _goToRegistration() =>
      Navigator.pushNamed(context, RegistrationScreen.routeName);

  void _dashboard(BuildContext context) => Navigator.pushNamedAndRemoveUntil(
      context, BottomNavigationScreen.routeName, (route) => false);
}
