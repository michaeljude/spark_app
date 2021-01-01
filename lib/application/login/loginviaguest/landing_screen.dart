import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spark_app/application/login/loginviaguest/landing_bloc.dart';
import 'package:spark_app/application/login/loginviaguest/landing_event.dart';
import 'package:spark_app/application/login/loginviaguest/landing_state.dart';
import 'package:spark_app/core/widgets/labeled_text_field.dart';
import 'package:spark_app/core/widgets/login_button.dart';

class LoginScreen extends StatefulWidget {

  static final String routeName = "/login-via-guest";

  @override
  State<StatefulWidget> createState() => _LoginScreen();

}

class _LoginScreen extends State<LoginScreen> {

  LoginBloc _loginBloc;

  @override
  void initState() {
    super.initState();
    _loginBloc = BlocProvider.of<LoginBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (BuildContext context, LoginState state) {
        if (state is LoginSuccessState) {

        }
        else if (state is LoginStartedState) {

        }
        else if (state is LoginFailedState) {

        }
      },
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
                margin: EdgeInsets.all(40),
                child: Text(
                  "Login to access your account.",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,

                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: LabeledTextField(
                  title: "Email",
                  icon: Icons.account_circle,
                  hint: "Enter Email",
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: LabeledTextField(
                  title: "Password",
                  icon: Icons.lock_rounded,
                  isPasswordField: true,
                  hint: "Enter Password",
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: InkWell(
                    child: Text("Forgot Password?"),
                    onTap: () {

                    },
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(bottom: 20, right: 30, left: 30),
                  alignment: Alignment.bottomCenter,
                  child: LogoButton(
                    color: const Color(0xff19BA19),
                    buttonText: "LOGIN",
                    action: () {
                      print("LOGIN");
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 50, left: 30, right: 30),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: TextStyle(color: Colors.black, fontSize: 18),
                    children: <TextSpan> [
                      TextSpan(text: "Don't have an account?"),
                      TextSpan(
                        text: '\nRegister now! ',
                        style: TextStyle(color: Colors.blue),
                        recognizer: TapGestureRecognizer()..onTap = () => {
                          print("OnTap")
                        }
                      ),
                    ]
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

}