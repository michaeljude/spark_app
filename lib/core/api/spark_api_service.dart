

import 'package:dio/dio.dart' hide Headers;
import 'package:flutter/cupertino.dart';
import 'package:retrofit/retrofit.dart';
import 'package:spark_app/core/models/dashboard/searchdestination/parking_list_response_model.dart';
import 'package:spark_app/core/models/login/login_response.dart';
import 'package:spark_app/core/models/registration/registration_response.dart';

part 'spark_api_service.g.dart';

@RestApi(baseUrl: "http://sparkph.net/Spark-Admin/api")
abstract class SparkApiService {
    factory SparkApiService(Dio dio, {String baseUrl}) = _SparkApiService;

    @POST('/login.php')
    Future<LoginResponseModel> login({
        @required @Field() String email,
        @required @Field() String password,
    });

    @POST('/create_user.php')
    Future<RegistrationResponseModel> register({
        @required @Field() String firstname,
        @required @Field() String lastname,
        @required @Field() String email,
        @required @Field() String password,
        @required @Field() String contact_no,
        @required @Field() String gender,
        @required @Field() String birthday,
        @required @Field() String plate_no,
        @required @Field() String car_model,
        @required @Field() car_description,
        @required @Field() String car_photo,
        @required @Field() String driver_license
    });

    @POST('/parking_list.php')
    @Headers(<String, dynamic>{
      "include-auth-tokens": true
      })
    Future<List<ParkingListResponseModel>> getParkingList();
}