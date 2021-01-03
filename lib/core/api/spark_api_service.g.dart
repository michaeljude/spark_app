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
}
