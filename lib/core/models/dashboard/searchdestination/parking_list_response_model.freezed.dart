// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'parking_list_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
ParkingListResponseModel _$ParkingListResponseModelFromJson(
    Map<String, dynamic> json) {
  return _ParkingListResponseModel.fromJson(json);
}

/// @nodoc
class _$ParkingListResponseModelTearOff {
  const _$ParkingListResponseModelTearOff();

// ignore: unused_element
  _ParkingListResponseModel call(
      {@JsonKey(name: "message") String message,
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
      @JsonKey(name: "parking_type") String parkingType,
      @JsonKey(name: "isFavorite") bool isFavorite}) {
    return _ParkingListResponseModel(
      message: message,
      parkingId: parkingId,
      ownerParkingId: ownerParkingId,
      parkingName: parkingName,
      parkingFlatrate: parkingFlatrate,
      parkingDuration: parkingDuration,
      parkingExceeding: parkingExceeding,
      parkingStreet: parkingStreet,
      parkingBarangay: parkingBarangay,
      parkingMunicipal: parkingMunicipal,
      parkingProvince: parkingProvince,
      parkingCountry: parkingCountry,
      latitude: latitude,
      longitude: longitude,
      parkingType: parkingType,
      isFavorite: isFavorite,
    );
  }

// ignore: unused_element
  ParkingListResponseModel fromJson(Map<String, Object> json) {
    return ParkingListResponseModel.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $ParkingListResponseModel = _$ParkingListResponseModelTearOff();

/// @nodoc
mixin _$ParkingListResponseModel {
  @JsonKey(name: "message")
  String get message;
  @JsonKey(name: "parking_id")
  int get parkingId;
  @JsonKey(name: "owner_parking_id")
  int get ownerParkingId;
  @JsonKey(name: "parking_name")
  String get parkingName;
  @JsonKey(name: "parking_flatrate")
  double get parkingFlatrate;
  @JsonKey(name: "parking_duration")
  double get parkingDuration;
  @JsonKey(name: "parking_exceeding")
  double get parkingExceeding;
  @JsonKey(name: "parking_street")
  String get parkingStreet;
  @JsonKey(name: "parking_barangay")
  String get parkingBarangay;
  @JsonKey(name: "parking_municipal")
  String get parkingMunicipal;
  @JsonKey(name: "parking_province")
  String get parkingProvince;
  @JsonKey(name: "parking_country")
  String get parkingCountry;
  @JsonKey(name: "latitude")
  double get latitude;
  @JsonKey(name: "longitude")
  double get longitude;
  @JsonKey(name: "parking_type")
  String get parkingType;
  @JsonKey(name: "isFavorite")
  bool get isFavorite;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $ParkingListResponseModelCopyWith<ParkingListResponseModel> get copyWith;
}

/// @nodoc
abstract class $ParkingListResponseModelCopyWith<$Res> {
  factory $ParkingListResponseModelCopyWith(ParkingListResponseModel value,
          $Res Function(ParkingListResponseModel) then) =
      _$ParkingListResponseModelCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: "message") String message,
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
      @JsonKey(name: "parking_type") String parkingType,
      @JsonKey(name: "isFavorite") bool isFavorite});
}

/// @nodoc
class _$ParkingListResponseModelCopyWithImpl<$Res>
    implements $ParkingListResponseModelCopyWith<$Res> {
  _$ParkingListResponseModelCopyWithImpl(this._value, this._then);

  final ParkingListResponseModel _value;
  // ignore: unused_field
  final $Res Function(ParkingListResponseModel) _then;

  @override
  $Res call({
    Object message = freezed,
    Object parkingId = freezed,
    Object ownerParkingId = freezed,
    Object parkingName = freezed,
    Object parkingFlatrate = freezed,
    Object parkingDuration = freezed,
    Object parkingExceeding = freezed,
    Object parkingStreet = freezed,
    Object parkingBarangay = freezed,
    Object parkingMunicipal = freezed,
    Object parkingProvince = freezed,
    Object parkingCountry = freezed,
    Object latitude = freezed,
    Object longitude = freezed,
    Object parkingType = freezed,
    Object isFavorite = freezed,
  }) {
    return _then(_value.copyWith(
      message: message == freezed ? _value.message : message as String,
      parkingId: parkingId == freezed ? _value.parkingId : parkingId as int,
      ownerParkingId: ownerParkingId == freezed
          ? _value.ownerParkingId
          : ownerParkingId as int,
      parkingName:
          parkingName == freezed ? _value.parkingName : parkingName as String,
      parkingFlatrate: parkingFlatrate == freezed
          ? _value.parkingFlatrate
          : parkingFlatrate as double,
      parkingDuration: parkingDuration == freezed
          ? _value.parkingDuration
          : parkingDuration as double,
      parkingExceeding: parkingExceeding == freezed
          ? _value.parkingExceeding
          : parkingExceeding as double,
      parkingStreet: parkingStreet == freezed
          ? _value.parkingStreet
          : parkingStreet as String,
      parkingBarangay: parkingBarangay == freezed
          ? _value.parkingBarangay
          : parkingBarangay as String,
      parkingMunicipal: parkingMunicipal == freezed
          ? _value.parkingMunicipal
          : parkingMunicipal as String,
      parkingProvince: parkingProvince == freezed
          ? _value.parkingProvince
          : parkingProvince as String,
      parkingCountry: parkingCountry == freezed
          ? _value.parkingCountry
          : parkingCountry as String,
      latitude: latitude == freezed ? _value.latitude : latitude as double,
      longitude: longitude == freezed ? _value.longitude : longitude as double,
      parkingType:
          parkingType == freezed ? _value.parkingType : parkingType as String,
      isFavorite:
          isFavorite == freezed ? _value.isFavorite : isFavorite as bool,
    ));
  }
}

/// @nodoc
abstract class _$ParkingListResponseModelCopyWith<$Res>
    implements $ParkingListResponseModelCopyWith<$Res> {
  factory _$ParkingListResponseModelCopyWith(_ParkingListResponseModel value,
          $Res Function(_ParkingListResponseModel) then) =
      __$ParkingListResponseModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: "message") String message,
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
      @JsonKey(name: "parking_type") String parkingType,
      @JsonKey(name: "isFavorite") bool isFavorite});
}

/// @nodoc
class __$ParkingListResponseModelCopyWithImpl<$Res>
    extends _$ParkingListResponseModelCopyWithImpl<$Res>
    implements _$ParkingListResponseModelCopyWith<$Res> {
  __$ParkingListResponseModelCopyWithImpl(_ParkingListResponseModel _value,
      $Res Function(_ParkingListResponseModel) _then)
      : super(_value, (v) => _then(v as _ParkingListResponseModel));

  @override
  _ParkingListResponseModel get _value =>
      super._value as _ParkingListResponseModel;

  @override
  $Res call({
    Object message = freezed,
    Object parkingId = freezed,
    Object ownerParkingId = freezed,
    Object parkingName = freezed,
    Object parkingFlatrate = freezed,
    Object parkingDuration = freezed,
    Object parkingExceeding = freezed,
    Object parkingStreet = freezed,
    Object parkingBarangay = freezed,
    Object parkingMunicipal = freezed,
    Object parkingProvince = freezed,
    Object parkingCountry = freezed,
    Object latitude = freezed,
    Object longitude = freezed,
    Object parkingType = freezed,
    Object isFavorite = freezed,
  }) {
    return _then(_ParkingListResponseModel(
      message: message == freezed ? _value.message : message as String,
      parkingId: parkingId == freezed ? _value.parkingId : parkingId as int,
      ownerParkingId: ownerParkingId == freezed
          ? _value.ownerParkingId
          : ownerParkingId as int,
      parkingName:
          parkingName == freezed ? _value.parkingName : parkingName as String,
      parkingFlatrate: parkingFlatrate == freezed
          ? _value.parkingFlatrate
          : parkingFlatrate as double,
      parkingDuration: parkingDuration == freezed
          ? _value.parkingDuration
          : parkingDuration as double,
      parkingExceeding: parkingExceeding == freezed
          ? _value.parkingExceeding
          : parkingExceeding as double,
      parkingStreet: parkingStreet == freezed
          ? _value.parkingStreet
          : parkingStreet as String,
      parkingBarangay: parkingBarangay == freezed
          ? _value.parkingBarangay
          : parkingBarangay as String,
      parkingMunicipal: parkingMunicipal == freezed
          ? _value.parkingMunicipal
          : parkingMunicipal as String,
      parkingProvince: parkingProvince == freezed
          ? _value.parkingProvince
          : parkingProvince as String,
      parkingCountry: parkingCountry == freezed
          ? _value.parkingCountry
          : parkingCountry as String,
      latitude: latitude == freezed ? _value.latitude : latitude as double,
      longitude: longitude == freezed ? _value.longitude : longitude as double,
      parkingType:
          parkingType == freezed ? _value.parkingType : parkingType as String,
      isFavorite:
          isFavorite == freezed ? _value.isFavorite : isFavorite as bool,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_ParkingListResponseModel implements _ParkingListResponseModel {
  _$_ParkingListResponseModel(
      {@JsonKey(name: "message") this.message,
      @JsonKey(name: "parking_id") this.parkingId,
      @JsonKey(name: "owner_parking_id") this.ownerParkingId,
      @JsonKey(name: "parking_name") this.parkingName,
      @JsonKey(name: "parking_flatrate") this.parkingFlatrate,
      @JsonKey(name: "parking_duration") this.parkingDuration,
      @JsonKey(name: "parking_exceeding") this.parkingExceeding,
      @JsonKey(name: "parking_street") this.parkingStreet,
      @JsonKey(name: "parking_barangay") this.parkingBarangay,
      @JsonKey(name: "parking_municipal") this.parkingMunicipal,
      @JsonKey(name: "parking_province") this.parkingProvince,
      @JsonKey(name: "parking_country") this.parkingCountry,
      @JsonKey(name: "latitude") this.latitude,
      @JsonKey(name: "longitude") this.longitude,
      @JsonKey(name: "parking_type") this.parkingType,
      @JsonKey(name: "isFavorite") this.isFavorite});

  factory _$_ParkingListResponseModel.fromJson(Map<String, dynamic> json) =>
      _$_$_ParkingListResponseModelFromJson(json);

  @override
  @JsonKey(name: "message")
  final String message;
  @override
  @JsonKey(name: "parking_id")
  final int parkingId;
  @override
  @JsonKey(name: "owner_parking_id")
  final int ownerParkingId;
  @override
  @JsonKey(name: "parking_name")
  final String parkingName;
  @override
  @JsonKey(name: "parking_flatrate")
  final double parkingFlatrate;
  @override
  @JsonKey(name: "parking_duration")
  final double parkingDuration;
  @override
  @JsonKey(name: "parking_exceeding")
  final double parkingExceeding;
  @override
  @JsonKey(name: "parking_street")
  final String parkingStreet;
  @override
  @JsonKey(name: "parking_barangay")
  final String parkingBarangay;
  @override
  @JsonKey(name: "parking_municipal")
  final String parkingMunicipal;
  @override
  @JsonKey(name: "parking_province")
  final String parkingProvince;
  @override
  @JsonKey(name: "parking_country")
  final String parkingCountry;
  @override
  @JsonKey(name: "latitude")
  final double latitude;
  @override
  @JsonKey(name: "longitude")
  final double longitude;
  @override
  @JsonKey(name: "parking_type")
  final String parkingType;
  @override
  @JsonKey(name: "isFavorite")
  final bool isFavorite;

  @override
  String toString() {
    return 'ParkingListResponseModel(message: $message, parkingId: $parkingId, ownerParkingId: $ownerParkingId, parkingName: $parkingName, parkingFlatrate: $parkingFlatrate, parkingDuration: $parkingDuration, parkingExceeding: $parkingExceeding, parkingStreet: $parkingStreet, parkingBarangay: $parkingBarangay, parkingMunicipal: $parkingMunicipal, parkingProvince: $parkingProvince, parkingCountry: $parkingCountry, latitude: $latitude, longitude: $longitude, parkingType: $parkingType, isFavorite: $isFavorite)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ParkingListResponseModel &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.parkingId, parkingId) ||
                const DeepCollectionEquality()
                    .equals(other.parkingId, parkingId)) &&
            (identical(other.ownerParkingId, ownerParkingId) ||
                const DeepCollectionEquality()
                    .equals(other.ownerParkingId, ownerParkingId)) &&
            (identical(other.parkingName, parkingName) ||
                const DeepCollectionEquality()
                    .equals(other.parkingName, parkingName)) &&
            (identical(other.parkingFlatrate, parkingFlatrate) ||
                const DeepCollectionEquality()
                    .equals(other.parkingFlatrate, parkingFlatrate)) &&
            (identical(other.parkingDuration, parkingDuration) ||
                const DeepCollectionEquality()
                    .equals(other.parkingDuration, parkingDuration)) &&
            (identical(other.parkingExceeding, parkingExceeding) ||
                const DeepCollectionEquality()
                    .equals(other.parkingExceeding, parkingExceeding)) &&
            (identical(other.parkingStreet, parkingStreet) ||
                const DeepCollectionEquality()
                    .equals(other.parkingStreet, parkingStreet)) &&
            (identical(other.parkingBarangay, parkingBarangay) ||
                const DeepCollectionEquality()
                    .equals(other.parkingBarangay, parkingBarangay)) &&
            (identical(other.parkingMunicipal, parkingMunicipal) ||
                const DeepCollectionEquality()
                    .equals(other.parkingMunicipal, parkingMunicipal)) &&
            (identical(other.parkingProvince, parkingProvince) ||
                const DeepCollectionEquality()
                    .equals(other.parkingProvince, parkingProvince)) &&
            (identical(other.parkingCountry, parkingCountry) ||
                const DeepCollectionEquality()
                    .equals(other.parkingCountry, parkingCountry)) &&
            (identical(other.latitude, latitude) ||
                const DeepCollectionEquality()
                    .equals(other.latitude, latitude)) &&
            (identical(other.longitude, longitude) ||
                const DeepCollectionEquality()
                    .equals(other.longitude, longitude)) &&
            (identical(other.parkingType, parkingType) ||
                const DeepCollectionEquality()
                    .equals(other.parkingType, parkingType)) &&
            (identical(other.isFavorite, isFavorite) ||
                const DeepCollectionEquality()
                    .equals(other.isFavorite, isFavorite)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(parkingId) ^
      const DeepCollectionEquality().hash(ownerParkingId) ^
      const DeepCollectionEquality().hash(parkingName) ^
      const DeepCollectionEquality().hash(parkingFlatrate) ^
      const DeepCollectionEquality().hash(parkingDuration) ^
      const DeepCollectionEquality().hash(parkingExceeding) ^
      const DeepCollectionEquality().hash(parkingStreet) ^
      const DeepCollectionEquality().hash(parkingBarangay) ^
      const DeepCollectionEquality().hash(parkingMunicipal) ^
      const DeepCollectionEquality().hash(parkingProvince) ^
      const DeepCollectionEquality().hash(parkingCountry) ^
      const DeepCollectionEquality().hash(latitude) ^
      const DeepCollectionEquality().hash(longitude) ^
      const DeepCollectionEquality().hash(parkingType) ^
      const DeepCollectionEquality().hash(isFavorite);

  @JsonKey(ignore: true)
  @override
  _$ParkingListResponseModelCopyWith<_ParkingListResponseModel> get copyWith =>
      __$ParkingListResponseModelCopyWithImpl<_ParkingListResponseModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ParkingListResponseModelToJson(this);
  }
}

abstract class _ParkingListResponseModel implements ParkingListResponseModel {
  factory _ParkingListResponseModel(
          {@JsonKey(name: "message") String message,
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
          @JsonKey(name: "parking_type") String parkingType,
          @JsonKey(name: "isFavorite") bool isFavorite}) =
      _$_ParkingListResponseModel;

  factory _ParkingListResponseModel.fromJson(Map<String, dynamic> json) =
      _$_ParkingListResponseModel.fromJson;

  @override
  @JsonKey(name: "message")
  String get message;
  @override
  @JsonKey(name: "parking_id")
  int get parkingId;
  @override
  @JsonKey(name: "owner_parking_id")
  int get ownerParkingId;
  @override
  @JsonKey(name: "parking_name")
  String get parkingName;
  @override
  @JsonKey(name: "parking_flatrate")
  double get parkingFlatrate;
  @override
  @JsonKey(name: "parking_duration")
  double get parkingDuration;
  @override
  @JsonKey(name: "parking_exceeding")
  double get parkingExceeding;
  @override
  @JsonKey(name: "parking_street")
  String get parkingStreet;
  @override
  @JsonKey(name: "parking_barangay")
  String get parkingBarangay;
  @override
  @JsonKey(name: "parking_municipal")
  String get parkingMunicipal;
  @override
  @JsonKey(name: "parking_province")
  String get parkingProvince;
  @override
  @JsonKey(name: "parking_country")
  String get parkingCountry;
  @override
  @JsonKey(name: "latitude")
  double get latitude;
  @override
  @JsonKey(name: "longitude")
  double get longitude;
  @override
  @JsonKey(name: "parking_type")
  String get parkingType;
  @override
  @JsonKey(name: "isFavorite")
  bool get isFavorite;
  @override
  @JsonKey(ignore: true)
  _$ParkingListResponseModelCopyWith<_ParkingListResponseModel> get copyWith;
}
