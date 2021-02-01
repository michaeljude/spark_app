import 'package:freezed_annotation/freezed_annotation.dart';
part 'get_status_response_model.g.dart';
part 'get_status_response_model.freezed.dart';

@freezed
abstract class GetStatusResponseModel with _$GetStatusResponseModel {

  factory GetStatusResponseModel({
      @JsonKey(name: 'message') String message,
      @JsonKey(name: 'parking_name') String parkingName,
      @JsonKey(name: 'client_parking_status') String clientParkingStatus,
      @JsonKey(name: 'latitude') double latitude,
      @JsonKey(name: 'longitude') double longitude,
      @JsonKey(name: 'transaction_id') int transaction_id,
  }) = _GetStatusResponseModel;

  factory GetStatusResponseModel.fromJson(Map<String, dynamic> json) 
    => _$GetStatusResponseModelFromJson(json);

}