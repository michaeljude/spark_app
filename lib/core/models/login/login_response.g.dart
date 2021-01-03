// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LoginResponseModel _$_$_LoginResponseModelFromJson(
    Map<String, dynamic> json) {
  return _$_LoginResponseModel(
    message: json['message'] as String,
    token: json['jwt'] as String,
  );
}

Map<String, dynamic> _$_$_LoginResponseModelToJson(
        _$_LoginResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'jwt': instance.token,
    };
