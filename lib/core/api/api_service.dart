import 'package:alice/alice.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:spark_app/core/api/api_interceptor.dart';
import 'package:spark_app/core/api/spark_api_service.dart';
import 'package:spark_app/core/app.dart';
import 'package:spark_app/core/models/login/login_response.dart';
import 'package:spark_app/core/repository/persistence/local_persistence.dart';

class ApiService {

  static Alice _alice = globalAlice;

  static bool isLoggingUiEnabled = true;

  SparkApiService _sparkApiService;
  Dio _dio;

  static ApiService instance = ApiService();

  void setDio(Dio dio) {
    this._dio = dio;
    resetInterceptors();
    _sparkApiService = SparkApiService(this._dio);
  }

  void resetInterceptors() {
    _dio.interceptors.clear();
    _dio.interceptors.add(ApiInterceptor(localPersistence: LocalPersistence.instance()));
    _dio.interceptors.add(PrettyDioLogger(requestHeader: true, requestBody: true));
    _dio.interceptors.add(globalAlice.getDioInterceptor());
  }

  Future<LoginResponseModel> login({@required String email, @required String password}) =>
      _sparkApiService.login(email: email, password: password);

}