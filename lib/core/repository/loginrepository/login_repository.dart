import 'package:flutter/cupertino.dart';
import 'package:spark_app/core/api/api_service.dart';
import 'package:spark_app/core/models/login/login_response.dart';

class LoginRepository {

  LoginRepository(this.apiService);

  ApiService apiService;

  Future<LoginResponseModel> login({@required String email, @required String password}) =>
    apiService.login(email: email, password: password);

}