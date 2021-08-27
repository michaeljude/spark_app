// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registration_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RegistrationResponseModel _$_$_RegistrationResponseModelFromJson(
    Map<String, dynamic> json) {
  return _$_RegistrationResponseModel(
    message: json['message'] as String,
    token: json['jwt'] as String,
  );
}

Map<String, dynamic> _$_$_RegistrationResponseModelToJson(
        _$_RegistrationResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'jwt': instance.token,
    };
