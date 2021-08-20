

import 'package:dio/dio.dart' hide Headers;
import 'package:flutter/cupertino.dart';
import 'package:retrofit/retrofit.dart';
import 'package:spark_app/core/models/dashboard/paymentdetails/transaction_details_response_model.dart';
import 'package:spark_app/core/models/dashboard/searchdestination/bookingmodel/booking_response_model.dart';
import 'package:spark_app/core/models/dashboard/searchdestination/parking_list_response_model.dart';
import 'package:spark_app/core/models/generic_response.dart';
import 'package:spark_app/core/models/home/get_status_response_model.dart';
import 'package:spark_app/core/models/login/login_response.dart';
import 'package:spark_app/core/models/registration/registration_response.dart';

part 'spark_api_service.g.dart';

@RestApi(baseUrl: "https://sparkph.net/Spark-Admin/api")
abstract class SparkApiService {
    factory SparkApiService(Dio dio, {String baseUrl}) = _SparkApiService;

    @POST('/login.php')
    Future<LoginResponseModel> login({
        @required @Field() String email,
        @required @Field() String password,
        @required @Field() String device_token,
    });

    @POST('/create_user.php')
    Future<RegistrationResponseModel> register_user({
        @required @Field() String firstname,
        @required @Field() String lastname,
        @required @Field() String email,
        @required @Field() String password,
        @required @Field() String contact_no
    });

    @POST('/parking_list.php')
    @Headers(<String, dynamic>{
      "include-auth-tokens": true
      })
    Future<List<ParkingListResponseModel>> getParkingList(
      @Field() String customerID
    );

    @POST('/create_transaction.php')
    @Headers(<String, dynamic>{
      "include-auth-tokens": true
    })
    Future<BookingResponseModel> bookNow(
      @Field() int parkID,
      @Field() String customerID
    );

    @GET('/user_status.php')
    @Headers(<String, dynamic>{
      "include-auth-tokens": true
    })
    Future<GetStatusResponseModel> getUserStatus({
      @required @Query('customerID') String customerID
    });

    @POST('/user_parked.php')
    @Headers(<String, dynamic>{
      "include-auth-tokens": true
    })
    Future<GenericResponseModel> setUserParked({
      @required @Field() String customerID,
      @required @Field() int transactionID
    });

    @POST('/favorite.php')
    @Headers(<String, dynamic>{
      "include-auth-tokens": true
    })
    Future<List<ParkingListResponseModel>> favorite({
      @required @Field() String customerID,
      @required @Field() int parkID,
      @required @Field() String action
    });

    @GET('/user_transaction_details.php')
    @Headers(<String, dynamic>{
      "include-auth-tokens": true
    })
    Future<TransactionDetailsResponseModel> getUserTransactionDetails(
      @Query('transactionID') int transactionID
    );
}