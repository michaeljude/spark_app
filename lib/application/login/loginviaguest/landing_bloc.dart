import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:spark_app/application/login/loginviaguest/landing_event.dart';
import 'package:spark_app/application/login/loginviaguest/landing_state.dart';
import 'package:spark_app/core/repository/loginrepository/login_repository.dart';
import 'package:spark_app/core/repository/persistence/local_persistence.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({this.repository, this.buildContext}) : super(LoginInitialState());

  LoginRepository repository;
  BuildContext buildContext;

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginViaGuestEvent) {
      yield LoginStartedState();

        try {
          var response = await repository.login(
              email: event.email, password: event.password, token: event.token);
          var _localPersistence = LocalPersistence.instance();
          if (response.message == "Successful login.") {
            await _localPersistence.setCurrentUser(
                LocalPersistence.currentUser, event.email);
            await _localPersistence.setAppToken(
                LocalPersistence.appToken + event.email,
                response.token
            );
            yield LoginSuccessState();
          }
        } on DioError catch (e) {
          yield LoginFailedState();
        } catch (e) {
          yield LoginFailedState();
        }
      

    }
  }



}