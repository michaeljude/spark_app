// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BookingResponseModel _$_$_BookingResponseModelFromJson(
    Map<String, dynamic> json) {
  return _$_BookingResponseModel(
    message: json['message'] as String,
    transactionId: json['transaction_id'] as String,
  );
}

Map<String, dynamic> _$_$_BookingResponseModelToJson(
        _$_BookingResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'transaction_id': instance.transactionId,
    };
