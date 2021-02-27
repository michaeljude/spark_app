// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spark_api_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _SparkApiService implements SparkApiService {
  _SparkApiService(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    baseUrl ??= 'http://sparkph.net/Spark-Admin/api';
  }

  final Dio _dio;

  String baseUrl;

  @override
  Future<LoginResponseModel> login({email, password, device_token}) async {
    ArgumentError.checkNotNull(email, 'email');
    ArgumentError.checkNotNull(password, 'password');
    ArgumentError.checkNotNull(device_token, 'device_token');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _data = {
      'email': email,
      'password': password,
      'device_token': device_token
    };
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.request<Map<String, dynamic>>('/login.php',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = LoginResponseModel.fromJson(_result.data);
    return value;
  }

  @override
  Future<RegistrationResponseModel> register(
      {firstname,
      lastname,
      email,
      password,
      contact_no,
      gender,
      birthday,
      plate_no,
      car_model,
      car_description,
      car_photo,
      driver_license}) async {
    ArgumentError.checkNotNull(firstname, 'firstname');
    ArgumentError.checkNotNull(lastname, 'lastname');
    ArgumentError.checkNotNull(email, 'email');
    ArgumentError.checkNotNull(password, 'password');
    ArgumentError.checkNotNull(contact_no, 'contact_no');
    ArgumentError.checkNotNull(gender, 'gender');
    ArgumentError.checkNotNull(birthday, 'birthday');
    ArgumentError.checkNotNull(plate_no, 'plate_no');
    ArgumentError.checkNotNull(car_model, 'car_model');
    ArgumentError.checkNotNull(car_description, 'car_description');
    ArgumentError.checkNotNull(car_photo, 'car_photo');
    ArgumentError.checkNotNull(driver_license, 'driver_license');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _data = {
      'firstname': firstname,
      'lastname': lastname,
      'email': email,
      'password': password,
      'contact_no': contact_no,
      'gender': gender,
      'birthday': birthday,
      'plate_no': plate_no,
      'car_model': car_model,
      'car_description': car_description,
      'car_photo': car_photo,
      'driver_license': driver_license
    };
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.request<Map<String, dynamic>>('/create_user.php',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = RegistrationResponseModel.fromJson(_result.data);
    return value;
  }

  @override
  Future<List<ParkingListResponseModel>> getParkingList(customerID) async {
    ArgumentError.checkNotNull(customerID, 'customerID');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = {'customerID': customerID};
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.request<List<dynamic>>('/parking_list.php',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{r'include-auth-tokens': null},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) =>
            ParkingListResponseModel.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<BookingResponseModel> bookNow(parkID, customerID) async {
    ArgumentError.checkNotNull(parkID, 'parkID');
    ArgumentError.checkNotNull(customerID, 'customerID');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = {'parkID': parkID, 'customerID': customerID};
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.request<Map<String, dynamic>>(
        '/create_transaction.php',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{r'include-auth-tokens': null},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = BookingResponseModel.fromJson(_result.data);
    return value;
  }

  @override
  Future<GetStatusResponseModel> getUserStatus({customerID}) async {
    ArgumentError.checkNotNull(customerID, 'customerID');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'customerID': customerID};
    queryParameters.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>('/user_status.php',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{r'include-auth-tokens': null},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = GetStatusResponseModel.fromJson(_result.data);
    return value;
  }

  @override
  Future<GenericResponseModel> setUserParked(
      {customerID, transactionID}) async {
    ArgumentError.checkNotNull(customerID, 'customerID');
    ArgumentError.checkNotNull(transactionID, 'transactionID');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _data = {'customerID': customerID, 'transactionID': transactionID};
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.request<Map<String, dynamic>>('/user_parked.php',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{r'include-auth-tokens': null},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = GenericResponseModel.fromJson(_result.data);
    return value;
  }

  @override
  Future<TransactionDetailsResponseModel> getUserTransactionDetails(
      transactionID) async {
    ArgumentError.checkNotNull(transactionID, 'transactionID');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'transactionID': transactionID};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        '/user_transaction_details.php',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{r'include-auth-tokens': null},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = TransactionDetailsResponseModel.fromJson(_result.data);
    return value;
  }
}
