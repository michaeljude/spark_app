import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spark_app/application/login/landing_bloc.dart';
import 'package:spark_app/application/login/landing_event.dart';
import 'package:spark_app/application/login/landing_state.dart';

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
        body: Center(
          child: Text("LOGIN")
        ),
      ),
    );
  }

}