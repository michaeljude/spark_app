import 'package:alice/alice.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:spark_app/core/api/spark_api_service.dart';
import 'package:spark_app/core/app.dart';
import 'package:spark_app/core/models/login/login_response.dart';

class ApiService {

  static Alice _alice = globalAlice;

  SparkApiService _sparkApiService;
  Dio _dio;

  static ApiService instance = ApiService();

  void setDio(Dio dio) {
    this._dio = dio;
    _sparkApiService = SparkApiService(this._dio);
  }

  void resetInterceptors() {
    _dio.interceptors.clear();
  }

  Future<LoginResponseModel> login({@required String email, @required String password}) =>
      _sparkApiService.login(email: email, password: password);

}
