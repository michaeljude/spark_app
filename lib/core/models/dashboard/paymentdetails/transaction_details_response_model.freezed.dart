// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'transaction_details_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
TransactionDetailsResponseModel _$TransactionDetailsResponseModelFromJson(
    Map<String, dynamic> json) {
  return _TransactionDetailsResponseModel.fromJson(json);
}

/// @nodoc
class _$TransactionDetailsResponseModelTearOff {
  const _$TransactionDetailsResponseModelTearOff();

// ignore: unused_element
  _TransactionDetailsResponseModel call(
      {@JsonKey(name: 'message') String message,
      @JsonKey(name: 'transaction_time_booked') String bookedTime,
      @JsonKey(name: 'current_server_datetime') String serverTime}) {
    return _TransactionDetailsResponseModel(
      message: message,
      bookedTime: bookedTime,
      serverTime: serverTime,
    );
  }

// ignore: unused_element
  TransactionDetailsResponseModel fromJson(Map<String, Object> json) {
    return TransactionDetailsResponseModel.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $TransactionDetailsResponseModel =
    _$TransactionDetailsResponseModelTearOff();

/// @nodoc
mixin _$TransactionDetailsResponseModel {
  @JsonKey(name: 'message')
  String get message;
  @JsonKey(name: 'transaction_time_booked')
  String get bookedTime;
  @JsonKey(name: 'current_server_datetime')
  String get serverTime;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $TransactionDetailsResponseModelCopyWith<TransactionDetailsResponseModel>
      get copyWith;
}

/// @nodoc
abstract class $TransactionDetailsResponseModelCopyWith<$Res> {
  factory $TransactionDetailsResponseModelCopyWith(
          TransactionDetailsResponseModel value,
          $Res Function(TransactionDetailsResponseModel) then) =
      _$TransactionDetailsResponseModelCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'message') String message,
      @JsonKey(name: 'transaction_time_booked') String bookedTime,
      @JsonKey(name: 'current_server_datetime') String serverTime});
}

/// @nodoc
class _$TransactionDetailsResponseModelCopyWithImpl<$Res>
    implements $TransactionDetailsResponseModelCopyWith<$Res> {
  _$TransactionDetailsResponseModelCopyWithImpl(this._value, this._then);

  final TransactionDetailsResponseModel _value;
  // ignore: unused_field
  final $Res Function(TransactionDetailsResponseModel) _then;

  @override
  $Res call({
    Object message = freezed,
    Object bookedTime = freezed,
    Object serverTime = freezed,
  }) {
    return _then(_value.copyWith(
      message: message == freezed ? _value.message : message as String,
      bookedTime:
          bookedTime == freezed ? _value.bookedTime : bookedTime as String,
      serverTime:
          serverTime == freezed ? _value.serverTime : serverTime as String,
    ));
  }
}

/// @nodoc
abstract class _$TransactionDetailsResponseModelCopyWith<$Res>
    implements $TransactionDetailsResponseModelCopyWith<$Res> {
  factory _$TransactionDetailsResponseModelCopyWith(
          _TransactionDetailsResponseModel value,
          $Res Function(_TransactionDetailsResponseModel) then) =
      __$TransactionDetailsResponseModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'message') String message,
      @JsonKey(name: 'transaction_time_booked') String bookedTime,
      @JsonKey(name: 'current_server_datetime') String serverTime});
}

/// @nodoc
class __$TransactionDetailsResponseModelCopyWithImpl<$Res>
    extends _$TransactionDetailsResponseModelCopyWithImpl<$Res>
    implements _$TransactionDetailsResponseModelCopyWith<$Res> {
  __$TransactionDetailsResponseModelCopyWithImpl(
      _TransactionDetailsResponseModel _value,
      $Res Function(_TransactionDetailsResponseModel) _then)
      : super(_value, (v) => _then(v as _TransactionDetailsResponseModel));

  @override
  _TransactionDetailsResponseModel get _value =>
      super._value as _TransactionDetailsResponseModel;

  @override
  $Res call({
    Object message = freezed,
    Object bookedTime = freezed,
    Object serverTime = freezed,
  }) {
    return _then(_TransactionDetailsResponseModel(
      message: message == freezed ? _value.message : message as String,
      bookedTime:
          bookedTime == freezed ? _value.bookedTime : bookedTime as String,
      serverTime:
          serverTime == freezed ? _value.serverTime : serverTime as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_TransactionDetailsResponseModel
    implements _TransactionDetailsResponseModel {
  _$_TransactionDetailsResponseModel(
      {@JsonKey(name: 'message') this.message,
      @JsonKey(name: 'transaction_time_booked') this.bookedTime,
      @JsonKey(name: 'current_server_datetime') this.serverTime});

  factory _$_TransactionDetailsResponseModel.fromJson(
          Map<String, dynamic> json) =>
      _$_$_TransactionDetailsResponseModelFromJson(json);

  @override
  @JsonKey(name: 'message')
  final String message;
  @override
  @JsonKey(name: 'transaction_time_booked')
  final String bookedTime;
  @override
  @JsonKey(name: 'current_server_datetime')
  final String serverTime;

  @override
  String toString() {
    return 'TransactionDetailsResponseModel(message: $message, bookedTime: $bookedTime, serverTime: $serverTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _TransactionDetailsResponseModel &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.bookedTime, bookedTime) ||
                const DeepCollectionEquality()
                    .equals(other.bookedTime, bookedTime)) &&
            (identical(other.serverTime, serverTime) ||
                const DeepCollectionEquality()
                    .equals(other.serverTime, serverTime)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(bookedTime) ^
      const DeepCollectionEquality().hash(serverTime);

  @JsonKey(ignore: true)
  @override
  _$TransactionDetailsResponseModelCopyWith<_TransactionDetailsResponseModel>
      get copyWith => __$TransactionDetailsResponseModelCopyWithImpl<
          _TransactionDetailsResponseModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_TransactionDetailsResponseModelToJson(this);
  }
}

abstract class _TransactionDetailsResponseModel
    implements TransactionDetailsResponseModel {
  factory _TransactionDetailsResponseModel(
          {@JsonKey(name: 'message') String message,
          @JsonKey(name: 'transaction_time_booked') String bookedTime,
          @JsonKey(name: 'current_server_datetime') String serverTime}) =
      _$_TransactionDetailsResponseModel;

  factory _TransactionDetailsResponseModel.fromJson(Map<String, dynamic> json) =
      _$_TransactionDetailsResponseModel.fromJson;

  @override
  @JsonKey(name: 'message')
  String get message;
  @override
  @JsonKey(name: 'transaction_time_booked')
  String get bookedTime;
  @override
  @JsonKey(name: 'current_server_datetime')
  String get serverTime;
  @override
  @JsonKey(ignore: true)
  _$TransactionDetailsResponseModelCopyWith<_TransactionDetailsResponseModel>
      get copyWith;
}
