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
  Future<LoginResponseModel> login({email, password}) async {
    ArgumentError.checkNotNull(email, 'email');
    ArgumentError.checkNotNull(password, 'password');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _data = {'email': email, 'password': password};
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
  Future<List<ParkingListResponseModel>> getParkingList() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<List<dynamic>>('/parking_list.php',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{
              r'include-auth-tokens': null
            },
            extra: _extra,
            contentType: 'application/json',
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) =>
            ParkingListResponseModel.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }
}
