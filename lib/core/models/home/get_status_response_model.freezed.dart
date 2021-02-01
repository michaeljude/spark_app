// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'get_status_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
GetStatusResponseModel _$GetStatusResponseModelFromJson(
    Map<String, dynamic> json) {
  return _GetStatusResponseModel.fromJson(json);
}

/// @nodoc
class _$GetStatusResponseModelTearOff {
  const _$GetStatusResponseModelTearOff();

// ignore: unused_element
  _GetStatusResponseModel call(
      {@JsonKey(name: 'message') String message,
      @JsonKey(name: 'parking_name') String parkingName,
      @JsonKey(name: 'client_parking_status') String clientParkingStatus,
      @JsonKey(name: 'latitude') double latitude,
      @JsonKey(name: 'longitude') double longitude,
      @JsonKey(name: 'transaction_id') int transaction_id}) {
    return _GetStatusResponseModel(
      message: message,
      parkingName: parkingName,
      clientParkingStatus: clientParkingStatus,
      latitude: latitude,
      longitude: longitude,
      transaction_id: transaction_id,
    );
  }

// ignore: unused_element
  GetStatusResponseModel fromJson(Map<String, Object> json) {
    return GetStatusResponseModel.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $GetStatusResponseModel = _$GetStatusResponseModelTearOff();

/// @nodoc
mixin _$GetStatusResponseModel {
  @JsonKey(name: 'message')
  String get message;
  @JsonKey(name: 'parking_name')
  String get parkingName;
  @JsonKey(name: 'client_parking_status')
  String get clientParkingStatus;
  @JsonKey(name: 'latitude')
  double get latitude;
  @JsonKey(name: 'longitude')
  double get longitude;
  @JsonKey(name: 'transaction_id')
  int get transaction_id;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $GetStatusResponseModelCopyWith<GetStatusResponseModel> get copyWith;
}

/// @nodoc
abstract class $GetStatusResponseModelCopyWith<$Res> {
  factory $GetStatusResponseModelCopyWith(GetStatusResponseModel value,
          $Res Function(GetStatusResponseModel) then) =
      _$GetStatusResponseModelCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'message') String message,
      @JsonKey(name: 'parking_name') String parkingName,
      @JsonKey(name: 'client_parking_status') String clientParkingStatus,
      @JsonKey(name: 'latitude') double latitude,
      @JsonKey(name: 'longitude') double longitude,
      @JsonKey(name: 'transaction_id') int transaction_id});
}

/// @nodoc
class _$GetStatusResponseModelCopyWithImpl<$Res>
    implements $GetStatusResponseModelCopyWith<$Res> {
  _$GetStatusResponseModelCopyWithImpl(this._value, this._then);

  final GetStatusResponseModel _value;
  // ignore: unused_field
  final $Res Function(GetStatusResponseModel) _then;

  @override
  $Res call({
    Object message = freezed,
    Object parkingName = freezed,
    Object clientParkingStatus = freezed,
    Object latitude = freezed,
    Object longitude = freezed,
    Object transaction_id = freezed,
  }) {
    return _then(_value.copyWith(
      message: message == freezed ? _value.message : message as String,
      parkingName:
          parkingName == freezed ? _value.parkingName : parkingName as String,
      clientParkingStatus: clientParkingStatus == freezed
          ? _value.clientParkingStatus
          : clientParkingStatus as String,
      latitude: latitude == freezed ? _value.latitude : latitude as double,
      longitude: longitude == freezed ? _value.longitude : longitude as double,
      transaction_id: transaction_id == freezed
          ? _value.transaction_id
          : transaction_id as int,
    ));
  }
}

/// @nodoc
abstract class _$GetStatusResponseModelCopyWith<$Res>
    implements $GetStatusResponseModelCopyWith<$Res> {
  factory _$GetStatusResponseModelCopyWith(_GetStatusResponseModel value,
          $Res Function(_GetStatusResponseModel) then) =
      __$GetStatusResponseModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'message') String message,
      @JsonKey(name: 'parking_name') String parkingName,
      @JsonKey(name: 'client_parking_status') String clientParkingStatus,
      @JsonKey(name: 'latitude') double latitude,
      @JsonKey(name: 'longitude') double longitude,
      @JsonKey(name: 'transaction_id') int transaction_id});
}

/// @nodoc
class __$GetStatusResponseModelCopyWithImpl<$Res>
    extends _$GetStatusResponseModelCopyWithImpl<$Res>
    implements _$GetStatusResponseModelCopyWith<$Res> {
  __$GetStatusResponseModelCopyWithImpl(_GetStatusResponseModel _value,
      $Res Function(_GetStatusResponseModel) _then)
      : super(_value, (v) => _then(v as _GetStatusResponseModel));

  @override
  _GetStatusResponseModel get _value => super._value as _GetStatusResponseModel;

  @override
  $Res call({
    Object message = freezed,
    Object parkingName = freezed,
    Object clientParkingStatus = freezed,
    Object latitude = freezed,
    Object longitude = freezed,
    Object transaction_id = freezed,
  }) {
    return _then(_GetStatusResponseModel(
      message: message == freezed ? _value.message : message as String,
      parkingName:
          parkingName == freezed ? _value.parkingName : parkingName as String,
      clientParkingStatus: clientParkingStatus == freezed
          ? _value.clientParkingStatus
          : clientParkingStatus as String,
      latitude: latitude == freezed ? _value.latitude : latitude as double,
      longitude: longitude == freezed ? _value.longitude : longitude as double,
      transaction_id: transaction_id == freezed
          ? _value.transaction_id
          : transaction_id as int,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_GetStatusResponseModel implements _GetStatusResponseModel {
  _$_GetStatusResponseModel(
      {@JsonKey(name: 'message') this.message,
      @JsonKey(name: 'parking_name') this.parkingName,
      @JsonKey(name: 'client_parking_status') this.clientParkingStatus,
      @JsonKey(name: 'latitude') this.latitude,
      @JsonKey(name: 'longitude') this.longitude,
      @JsonKey(name: 'transaction_id') this.transaction_id});

  factory _$_GetStatusResponseModel.fromJson(Map<String, dynamic> json) =>
      _$_$_GetStatusResponseModelFromJson(json);

  @override
  @JsonKey(name: 'message')
  final String message;
  @override
  @JsonKey(name: 'parking_name')
  final String parkingName;
  @override
  @JsonKey(name: 'client_parking_status')
  final String clientParkingStatus;
  @override
  @JsonKey(name: 'latitude')
  final double latitude;
  @override
  @JsonKey(name: 'longitude')
  final double longitude;
  @override
  @JsonKey(name: 'transaction_id')
  final int transaction_id;

  @override
  String toString() {
    return 'GetStatusResponseModel(message: $message, parkingName: $parkingName, clientParkingStatus: $clientParkingStatus, latitude: $latitude, longitude: $longitude, transaction_id: $transaction_id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _GetStatusResponseModel &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.parkingName, parkingName) ||
                const DeepCollectionEquality()
                    .equals(other.parkingName, parkingName)) &&
            (identical(other.clientParkingStatus, clientParkingStatus) ||
                const DeepCollectionEquality()
                    .equals(other.clientParkingStatus, clientParkingStatus)) &&
            (identical(other.latitude, latitude) ||
                const DeepCollectionEquality()
                    .equals(other.latitude, latitude)) &&
            (identical(other.longitude, longitude) ||
                const DeepCollectionEquality()
                    .equals(other.longitude, longitude)) &&
            (identical(other.transaction_id, transaction_id) ||
                const DeepCollectionEquality()
                    .equals(other.transaction_id, transaction_id)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(parkingName) ^
      const DeepCollectionEquality().hash(clientParkingStatus) ^
      const DeepCollectionEquality().hash(latitude) ^
      const DeepCollectionEquality().hash(longitude) ^
      const DeepCollectionEquality().hash(transaction_id);

  @JsonKey(ignore: true)
  @override
  _$GetStatusResponseModelCopyWith<_GetStatusResponseModel> get copyWith =>
      __$GetStatusResponseModelCopyWithImpl<_GetStatusResponseModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_GetStatusResponseModelToJson(this);
  }
}

abstract class _GetStatusResponseModel implements GetStatusResponseModel {
  factory _GetStatusResponseModel(
          {@JsonKey(name: 'message') String message,
          @JsonKey(name: 'parking_name') String parkingName,
          @JsonKey(name: 'client_parking_status') String clientParkingStatus,
          @JsonKey(name: 'latitude') double latitude,
          @JsonKey(name: 'longitude') double longitude,
          @JsonKey(name: 'transaction_id') int transaction_id}) =
      _$_GetStatusResponseModel;

  factory _GetStatusResponseModel.fromJson(Map<String, dynamic> json) =
      _$_GetStatusResponseModel.fromJson;

  @override
  @JsonKey(name: 'message')
  String get message;
  @override
  @JsonKey(name: 'parking_name')
  String get parkingName;
  @override
  @JsonKey(name: 'client_parking_status')
  String get clientParkingStatus;
  @override
  @JsonKey(name: 'latitude')
  double get latitude;
  @override
  @JsonKey(name: 'longitude')
  double get longitude;
  @override
  @JsonKey(name: 'transaction_id')
  int get transaction_id;
  @override
  @JsonKey(ignore: true)
  _$GetStatusResponseModelCopyWith<_GetStatusResponseModel> get copyWith;
}
