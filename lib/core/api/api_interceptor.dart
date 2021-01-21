import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:spark_app/core/repository/persistence/local_persistence.dart';

class ApiInterceptor extends Interceptor {

  ApiInterceptor({this.context});

  BuildContext context;

  static const String includeAuthTokensHeader = 'include-auth-tokens';

  @override
  Future<RequestOptions> onRequest(RequestOptions options) async {
    if(options.headers.containsKey("include-auth-tokens")) {
      options.headers.remove("include-auth-tokens");

      var _localPersistence = LocalPersistence.instance();
      String currentUser = await _localPersistence.getCurrentUser();
      String token = await _localPersistence.getAppToken(LocalPersistence.appToken+currentUser);

      options.headers.addAll(<String, String> {
        "jwt": token,
        "Content-type": "application/json; charset=UTF-8"
      });
    }
    return options;
  }

}