// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'booking_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
BookingResponseModel _$BookingResponseModelFromJson(Map<String, dynamic> json) {
  return _BookingResponseModel.fromJson(json);
}

/// @nodoc
class _$BookingResponseModelTearOff {
  const _$BookingResponseModelTearOff();

// ignore: unused_element
  _BookingResponseModel call(
      {@JsonKey(name: 'message') String message,
      @JsonKey(name: 'transaction_id') int transactionId}) {
    return _BookingResponseModel(
      message: message,
      transactionId: transactionId,
    );
  }

// ignore: unused_element
  BookingResponseModel fromJson(Map<String, Object> json) {
    return BookingResponseModel.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $BookingResponseModel = _$BookingResponseModelTearOff();

/// @nodoc
mixin _$BookingResponseModel {
  @JsonKey(name: 'message')
  String get message;
  @JsonKey(name: 'transaction_id')
  int get transactionId;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $BookingResponseModelCopyWith<BookingResponseModel> get copyWith;
}

/// @nodoc
abstract class $BookingResponseModelCopyWith<$Res> {
  factory $BookingResponseModelCopyWith(BookingResponseModel value,
          $Res Function(BookingResponseModel) then) =
      _$BookingResponseModelCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'message') String message,
      @JsonKey(name: 'transaction_id') int transactionId});
}

/// @nodoc
class _$BookingResponseModelCopyWithImpl<$Res>
    implements $BookingResponseModelCopyWith<$Res> {
  _$BookingResponseModelCopyWithImpl(this._value, this._then);

  final BookingResponseModel _value;
  // ignore: unused_field
  final $Res Function(BookingResponseModel) _then;

  @override
  $Res call({
    Object message = freezed,
    Object transactionId = freezed,
  }) {
    return _then(_value.copyWith(
      message: message == freezed ? _value.message : message as String,
      transactionId: transactionId == freezed
          ? _value.transactionId
          : transactionId as int,
    ));
  }
}

/// @nodoc
abstract class _$BookingResponseModelCopyWith<$Res>
    implements $BookingResponseModelCopyWith<$Res> {
  factory _$BookingResponseModelCopyWith(_BookingResponseModel value,
          $Res Function(_BookingResponseModel) then) =
      __$BookingResponseModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'message') String message,
      @JsonKey(name: 'transaction_id') int transactionId});
}

/// @nodoc
class __$BookingResponseModelCopyWithImpl<$Res>
    extends _$BookingResponseModelCopyWithImpl<$Res>
    implements _$BookingResponseModelCopyWith<$Res> {
  __$BookingResponseModelCopyWithImpl(
      _BookingResponseModel _value, $Res Function(_BookingResponseModel) _then)
      : super(_value, (v) => _then(v as _BookingResponseModel));

  @override
  _BookingResponseModel get _value => super._value as _BookingResponseModel;

  @override
  $Res call({
    Object message = freezed,
    Object transactionId = freezed,
  }) {
    return _then(_BookingResponseModel(
      message: message == freezed ? _value.message : message as String,
      transactionId: transactionId == freezed
          ? _value.transactionId
          : transactionId as int,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_BookingResponseModel implements _BookingResponseModel {
  _$_BookingResponseModel(
      {@JsonKey(name: 'message') this.message,
      @JsonKey(name: 'transaction_id') this.transactionId});

  factory _$_BookingResponseModel.fromJson(Map<String, dynamic> json) =>
      _$_$_BookingResponseModelFromJson(json);

  @override
  @JsonKey(name: 'message')
  final String message;
  @override
  @JsonKey(name: 'transaction_id')
  final int transactionId;

  @override
  String toString() {
    return 'BookingResponseModel(message: $message, transactionId: $transactionId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _BookingResponseModel &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.transactionId, transactionId) ||
                const DeepCollectionEquality()
                    .equals(other.transactionId, transactionId)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(transactionId);

  @JsonKey(ignore: true)
  @override
  _$BookingResponseModelCopyWith<_BookingResponseModel> get copyWith =>
      __$BookingResponseModelCopyWithImpl<_BookingResponseModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_BookingResponseModelToJson(this);
  }
}

abstract class _BookingResponseModel implements BookingResponseModel {
  factory _BookingResponseModel(
          {@JsonKey(name: 'message') String message,
          @JsonKey(name: 'transaction_id') int transactionId}) =
      _$_BookingResponseModel;

  factory _BookingResponseModel.fromJson(Map<String, dynamic> json) =
      _$_BookingResponseModel.fromJson;

  @override
  @JsonKey(name: 'message')
  String get message;
  @override
  @JsonKey(name: 'transaction_id')
  int get transactionId;
  @override
  @JsonKey(ignore: true)
  _$BookingResponseModelCopyWith<_BookingResponseModel> get copyWith;
}
