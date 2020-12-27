import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spark_app/application/login/landing_event.dart';
import 'package:spark_app/application/login/landing_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(LoginState initialState) : super(initialState);

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginViaGuestEvent) {
      yield LoginStartedState();

      await Future<void>.delayed(Duration(milliseconds: 2000));

      yield LoginSuccessState();
    }
  }

}