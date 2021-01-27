// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'generic_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
GenericResponseModel _$GenericResponseModelFromJson(Map<String, dynamic> json) {
  return _GenericResponseModel.fromJson(json);
}

/// @nodoc
class _$GenericResponseModelTearOff {
  const _$GenericResponseModelTearOff();

// ignore: unused_element
  _GenericResponseModel call({@JsonKey(name: 'message') String message}) {
    return _GenericResponseModel(
      message: message,
    );
  }

// ignore: unused_element
  GenericResponseModel fromJson(Map<String, Object> json) {
    return GenericResponseModel.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $GenericResponseModel = _$GenericResponseModelTearOff();

/// @nodoc
mixin _$GenericResponseModel {
  @JsonKey(name: 'message')
  String get message;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $GenericResponseModelCopyWith<GenericResponseModel> get copyWith;
}

/// @nodoc
abstract class $GenericResponseModelCopyWith<$Res> {
  factory $GenericResponseModelCopyWith(GenericResponseModel value,
          $Res Function(GenericResponseModel) then) =
      _$GenericResponseModelCopyWithImpl<$Res>;
  $Res call({@JsonKey(name: 'message') String message});
}

/// @nodoc
class _$GenericResponseModelCopyWithImpl<$Res>
    implements $GenericResponseModelCopyWith<$Res> {
  _$GenericResponseModelCopyWithImpl(this._value, this._then);

  final GenericResponseModel _value;
  // ignore: unused_field
  final $Res Function(GenericResponseModel) _then;

  @override
  $Res call({
    Object message = freezed,
  }) {
    return _then(_value.copyWith(
      message: message == freezed ? _value.message : message as String,
    ));
  }
}

/// @nodoc
abstract class _$GenericResponseModelCopyWith<$Res>
    implements $GenericResponseModelCopyWith<$Res> {
  factory _$GenericResponseModelCopyWith(_GenericResponseModel value,
          $Res Function(_GenericResponseModel) then) =
      __$GenericResponseModelCopyWithImpl<$Res>;
  @override
  $Res call({@JsonKey(name: 'message') String message});
}

/// @nodoc
class __$GenericResponseModelCopyWithImpl<$Res>
    extends _$GenericResponseModelCopyWithImpl<$Res>
    implements _$GenericResponseModelCopyWith<$Res> {
  __$GenericResponseModelCopyWithImpl(
      _GenericResponseModel _value, $Res Function(_GenericResponseModel) _then)
      : super(_value, (v) => _then(v as _GenericResponseModel));

  @override
  _GenericResponseModel get _value => super._value as _GenericResponseModel;

  @override
  $Res call({
    Object message = freezed,
  }) {
    return _then(_GenericResponseModel(
      message: message == freezed ? _value.message : message as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_GenericResponseModel implements _GenericResponseModel {
  _$_GenericResponseModel({@JsonKey(name: 'message') this.message});

  factory _$_GenericResponseModel.fromJson(Map<String, dynamic> json) =>
      _$_$_GenericResponseModelFromJson(json);

  @override
  @JsonKey(name: 'message')
  final String message;

  @override
  String toString() {
    return 'GenericResponseModel(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _GenericResponseModel &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(message);

  @JsonKey(ignore: true)
  @override
  _$GenericResponseModelCopyWith<_GenericResponseModel> get copyWith =>
      __$GenericResponseModelCopyWithImpl<_GenericResponseModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_GenericResponseModelToJson(this);
  }
}

abstract class _GenericResponseModel implements GenericResponseModel {
  factory _GenericResponseModel({@JsonKey(name: 'message') String message}) =
      _$_GenericResponseModel;

  factory _GenericResponseModel.fromJson(Map<String, dynamic> json) =
      _$_GenericResponseModel.fromJson;

  @override
  @JsonKey(name: 'message')
  String get message;
  @override
  @JsonKey(ignore: true)
  _$GenericResponseModelCopyWith<_GenericResponseModel> get copyWith;
}
