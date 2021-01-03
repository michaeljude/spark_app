import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spark_app/application/login/loginviaguest/landing_event.dart';
import 'package:spark_app/application/login/loginviaguest/landing_state.dart';
import 'package:spark_app/core/api/spark_api_service.dart';
import 'package:spark_app/core/repository/loginrepository/login_repository.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({this.repository}) : super(LoginInitialState());

  LoginRepository repository;

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginViaGuestEvent) {

      yield LoginStartedState();

      try {

        var response = await repository.login(email: event.email, password: event.password);

        if(response.message == "Successful login.") {
          yield LoginSuccessState();
        }

      } catch (e) {
        yield LoginFailedState();
      }

    }
  }



}