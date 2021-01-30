import 'package:alice/alice.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:spark_app/core/api/api_interceptor.dart';
import 'package:spark_app/core/api/spark_api_service.dart';
import 'package:spark_app/core/app.dart';
import 'package:spark_app/core/models/dashboard/paymentdetails/transaction_details_response_model.dart';
import 'package:spark_app/core/models/dashboard/searchdestination/bookingmodel/booking_response_model.dart';
import 'package:spark_app/core/models/dashboard/searchdestination/parking_list_response_model.dart';
import 'package:spark_app/core/models/generic_response.dart';
import 'package:spark_app/core/models/home/get_status_response_model.dart';
import 'package:spark_app/core/models/login/login_response.dart';
import 'package:spark_app/core/models/registration/registration_response.dart';
import 'package:spark_app/core/repository/persistence/local_persistence.dart';

class ApiService {

  static Alice _alice = globalAlice;

  static bool isLoggingUiEnabled = true;

  SparkApiService _sparkApiService;
  Dio _dio;
  BuildContext context;

  ApiService({this.context});

  void setDio(Dio dio) {
    this._dio = dio;
    resetInterceptors();
    _sparkApiService = SparkApiService(this._dio);
  }

  void resetInterceptors() {
    _dio.interceptors.clear();
    _dio.interceptors.add(ApiInterceptor(context: context));
    _dio.interceptors.add(PrettyDioLogger(requestHeader: true, requestBody: true));
    _dio.interceptors.add(globalAlice.getDioInterceptor());
  }

  Future<LoginResponseModel> login({@required String email, @required String password}) =>
      _sparkApiService.login(email: email, password: password);

  Future<RegistrationResponseModel> register({
    @required String firstname,
    @required String lastname,
    @required String email,
    @required String password,
    @required String contact_no,
    @required String gender,
    @required String birthday,
    @required String plate_no,
    @required String car_model,
    @required String car_description,
    @required String car_photo,
    @required String driver_license
  }) =>
      _sparkApiService.register(
          firstname: firstname,
          lastname: lastname,
          email: email,
          password: password,
          contact_no: contact_no,
          gender: gender,
          birthday: birthday,
          plate_no: plate_no,
          car_model: car_model,
          car_description: car_description,
          car_photo: car_photo,
          driver_license: driver_license
      );

  Future<List<ParkingListResponseModel>> getParkingList() => _sparkApiService.getParkingList();

  Future<BookingResponseModel> bookNow(
    int parkingId,
    String customerId
  ) => _sparkApiService.bookNow(parkingId, customerId);

  Future<GetStatusResponseModel> getUserStatus(
    String customerId
  ) => _sparkApiService.getUserStatus(customerID: customerId);

  Future<GenericResponseModel> setUserAsParked(
    String customerId, int transationId
  ) => _sparkApiService.setUserParked(customerID: customerId, transactionID: transationId);

  Future<TransactionDetailsResponseModel> getTransactionDetails({
      int transactionID
  }) => _sparkApiService.getUserTransactionDetails(transactionID);
}
