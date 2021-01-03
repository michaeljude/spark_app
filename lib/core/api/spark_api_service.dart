
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:retrofit/http.dart';
import 'package:spark_app/core/models/login/login_response.dart';

part 'spark_api_service.g.dart';

@RestApi(baseUrl: "http://sparkph.net/Spark-Admin/api")
abstract class SparkApiService {
    factory SparkApiService(Dio dio, {String baseUrl}) = _SparkApiService;

    @POST('/login.php')
    Future<LoginResponseModel> login({
        @required @Field() String email,
        @required @Field() String password,
    });
}