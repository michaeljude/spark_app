

import 'package:freezed_annotation/freezed_annotation.dart';
part 'booking_response_model.g.dart';
part 'booking_response_model.freezed.dart';

@freezed
abstract class BookingResponseModel with _$BookingResponseModel {

  factory BookingResponseModel({
      @JsonKey(name: 'message') String message,
      @JsonKey(name: 'transaction_id') int transactionId,
  }) = _BookingResponseModel;

  factory BookingResponseModel.fromJson(Map<String, dynamic> json) 
    => _$BookingResponseModelFromJson(json);

}