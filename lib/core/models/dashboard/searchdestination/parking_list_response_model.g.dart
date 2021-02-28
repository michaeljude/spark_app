// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parking_list_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ParkingListResponseModel _$_$_ParkingListResponseModelFromJson(
    Map<String, dynamic> json) {
  return _$_ParkingListResponseModel(
    message: json['message'] as String,
    parkingId: json['parking_id'] as int,
    ownerParkingId: json['owner_parking_id'] as int,
    parkingName: json['parking_name'] as String,
    parkingFlatrate: (json['parking_flatrate'] as num)?.toDouble(),
    parkingDuration: (json['parking_duration'] as num)?.toDouble(),
    parkingExceeding: (json['parking_exceeding'] as num)?.toDouble(),
    parkingStreet: json['parking_street'] as String,
    parkingBarangay: json['parking_barangay'] as String,
    parkingMunicipal: json['parking_municipal'] as String,
    parkingProvince: json['parking_province'] as String,
    parkingCountry: json['parking_country'] as String,
    latitude: (json['latitude'] as num)?.toDouble(),
    longitude: (json['longitude'] as num)?.toDouble(),
    parkingType: json['parking_type'] as String,
    isFavorite: json['isFavorite'] as bool,
  );
}

Map<String, dynamic> _$_$_ParkingListResponseModelToJson(
        _$_ParkingListResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'parking_id': instance.parkingId,
      'owner_parking_id': instance.ownerParkingId,
      'parking_name': instance.parkingName,
      'parking_flatrate': instance.parkingFlatrate,
      'parking_duration': instance.parkingDuration,
      'parking_exceeding': instance.parkingExceeding,
      'parking_street': instance.parkingStreet,
      'parking_barangay': instance.parkingBarangay,
      'parking_municipal': instance.parkingMunicipal,
      'parking_province': instance.parkingProvince,
      'parking_country': instance.parkingCountry,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'parking_type': instance.parkingType,
      'isFavorite': instance.isFavorite,
    };
