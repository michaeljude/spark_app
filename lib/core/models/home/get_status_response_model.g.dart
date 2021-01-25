// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_status_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GetStatusResponseModel _$_$_GetStatusResponseModelFromJson(
    Map<String, dynamic> json) {
  return _$_GetStatusResponseModel(
    message: json['message'] as String,
    clientParkingStatus: json['client_parking_status'] as String,
    latitude: (json['latitude'] as num)?.toDouble(),
    longitude: (json['longitude'] as num)?.toDouble(),
    transaction_id: json['transaction_id'] as int,
  );
}

Map<String, dynamic> _$_$_GetStatusResponseModelToJson(
        _$_GetStatusResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'client_parking_status': instance.clientParkingStatus,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'transaction_id': instance.transaction_id,
    };
