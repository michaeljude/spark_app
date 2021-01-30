

import 'package:freezed_annotation/freezed_annotation.dart';
part 'transaction_details_response_model.g.dart';
part 'transaction_details_response_model.freezed.dart';

@freezed
abstract class TransactionDetailsResponseModel with _$TransactionDetailsResponseModel {

  factory TransactionDetailsResponseModel({
      @JsonKey(name: 'message') String message,
      @JsonKey(name: 'transaction_time_booked') String bookedTime,
      @JsonKey(name: 'current_server_datetime') String serverTime
  }) = _TransactionDetailsResponseModel;

  factory TransactionDetailsResponseModel.fromJson(Map<String, dynamic> json)
  => _$TransactionDetailsResponseModelFromJson(json);

}