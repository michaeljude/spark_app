import 'package:freezed_annotation/freezed_annotation.dart';
part 'parking_list_response_model.g.dart';
part 'parking_list_response_model.freezed.dart';

@freezed
abstract class ParkingListResponseModel with _$ParkingListResponseModel {
  factory ParkingListResponseModel({
    @JsonKey(name: "message") String message,
    @JsonKey(name: "parking_id") int parkingId,
    @JsonKey(name: "owner_parking_id") int ownerParkingId,
    @JsonKey(name: "parking_name") String parkingName,
    @JsonKey(name: "parking_flatrate") double parkingFlatrate,
    @JsonKey(name: "parking_duration") double parkingDuration,
    @JsonKey(name: "parking_exceeding") double parkingExceeding,
    @JsonKey(name: "parking_street") String parkingStreet,
    @JsonKey(name: "parking_barangay") String parkingBarangay,
    @JsonKey(name: "parking_municipal") String parkingMunicipal,
    @JsonKey(name: "parking_province") String parkingProvince,
    @JsonKey(name: "parking_country") String parkingCountry,
    @JsonKey(name: "latitude") double latitude,
    @JsonKey(name: "longitude") double longitude,
  }) = _ParkingListResponseModel;

  factory ParkingListResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ParkingListResponseModelFromJson(json);

}
