import 'package:flutter/cupertino.dart';
import 'package:spark_app/core/api/api_service.dart';
import 'package:spark_app/core/models/login/login_response.dart';

class LoginRepository {

  LoginRepository(this._apiService);
  final ApiService _apiService;

  Future<LoginResponseModel> login({@required String email, @required String password}) =>
    _apiService.login(email: email, password: password);

}