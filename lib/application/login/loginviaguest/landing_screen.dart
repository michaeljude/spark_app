import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
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
import "package:flutter_feather_icons/flutter_feather_icons.dart";
import 'package:spark_app/theme/app_theme.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

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

  bool visibilityError= false;
  bool isLoading = false;
  String errorType;
  final String sparkTextLogo = 'assets/images/spark_text_logo.svg';

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
          isLoading = false;

          _dashboard(context);
        } else if (state is LoginStartedState) {
          debugPrint("LoginStartedState");
          _progressDialog.show();
          isLoading = true;
        } else if (state is LoginFailedState) {
          setState(() {
            visibilityError = true;
            errorType = 'failed';
          }
          );
          debugPrint("LoginFailedState" + errorType);
          _progressDialog.hide();
        }

      },
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          statusBarColor: Colors.green,
        ),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: HexColor('#ffffff'),

          appBar: AppBar(
            backgroundColor: HexColor('#ffffff'),
            elevation: 0.0,

            leading: IconButton(
              padding: const EdgeInsets.only(left:0, top: 10),
              icon: Icon(
                FeatherIcons.chevronLeft,
                color: HexColor('#626262'),
                size: 30,
              ),
              onPressed: () {
                SystemChannels.textInput.invokeMethod('TextInput.hide');
                Navigator.pop(context);
              },
              tooltip: "BackButton",
            ),
          ),
          body: Container(



            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 40, 20, 10),
                  child:
                  SvgPicture.asset(
                    sparkTextLogo,
                    semanticsLabel: 'Spark Logo',
                    height: 50,
                    width: 150,
                  ),
                ),
                Container(

                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Tired of always finding the right spot?",
                              style: TextStyle(
                              color: HexColor('#525252'),
                              fontSize: 20,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w500,

                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                              child: Text(
                                "Login in now!",
                                style: TextStyle(
                                  color: HexColor('#525252'),
                                  fontSize: 18,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                    // textAlign: TextAlign.center,
                  ),
                ),

                visibilityError ? Padding(
            padding:
            const EdgeInsets.only(bottom: 12.0, left: 20, right: 20),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: HexColor('#fceaea'),
                border: Border.all(
                    style: BorderStyle.solid, color: HexColor('#ea5859'))),

                    child: Padding(
                      padding:
                      const EdgeInsets.only(bottom: 10, top: 10, left: 15, right: 15),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Icon(
                          FeatherIcons.alertCircle,
                          size: 16,
                        color: HexColor('#ea5859'),),

                        if(errorType == 'failed')  Text("  Invalid email and password.",
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: HexColor('#ea5859'),
                          )
                        )
                        else Text("  Please fill out the required fields.",
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: HexColor('#ea5859'),
                            ),
                        ),
                      ],
                    ),
                    ),
                  ),
                ) :
                Padding(
                  padding:
                  const EdgeInsets.only(bottom: 12.0, left: 20, right: 20),

                ),

                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 12.0, left: 20, right: 20),
                  child: Theme(
                    child: LabeledTextField(
                      title: "Email",
                      icon: FeatherIcons.mail,
                      hint: "Enter Email",
                      textController: emailController,
                    ),
                    data:
                        Theme.of(context).copyWith(primaryColor: Colors.green),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 12.0, left: 20, right: 20),
                  child: Theme(
                    child: LabeledTextField(
                      title: "Password",
                      icon: FeatherIcons.lock,
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
                      child: Text("Forgot Password?",
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w300,
                          color: HexColor('#626262'),
                        ),
                      ),

                      onTap: () {},
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding:
                        const EdgeInsets.only(bottom: 20, right: 20, left: 20),
                    alignment: Alignment.bottomCenter,
                    child: SparkButton(
                      color: const Color(0xff19BA19),
                      textcolor: const Color(0xffffffff),
                      buttonText: "LOGIN",
                      action: () {
                        if(emailController.text.isEmpty || passwordController.text.isEmpty){
                          setState(() {
                            visibilityError = true;
                            errorType = 'empty';
                          }
                          );
                        }else {
                          _loginBloc.add(
                              LoginViaGuestEvent(emailController.text,
                                  passwordController.text, token));
                        }
                      },
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 50, left: 30, right: 30),
                  child: Align(
                    alignment: Alignment.center,
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                          style: TextStyle(color: Colors.black, fontSize: 16),
                          children: <TextSpan>[
                            TextSpan(text: "Don't have an account?\n",
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w400,
                                color: HexColor('#525252'),
                              ),
                            ),
                            TextSpan(
                                text: 'Register now! ',
                                style: TextStyle(
                                  color: HexColor('#117E96'),
                                  fontSize: 16,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w500,),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    debugPrint("REGISTER NOW");
                                    _goToRegistration();
                                }),
                          ]),
                    ),
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
