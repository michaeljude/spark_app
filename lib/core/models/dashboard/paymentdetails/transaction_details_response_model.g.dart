// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_details_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TransactionDetailsResponseModel _$_$_TransactionDetailsResponseModelFromJson(
    Map<String, dynamic> json) {
  return _$_TransactionDetailsResponseModel(
    message: json['message'] as String,
    bookedTime: json['transaction_time_booked'] as String,
    serverTime: json['current_server_datetime'] as String,
  );
}

Map<String, dynamic> _$_$_TransactionDetailsResponseModelToJson(
        _$_TransactionDetailsResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'transaction_time_booked': instance.bookedTime,
      'current_server_datetime': instance.serverTime,
    };
