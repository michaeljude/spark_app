// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'registration_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
RegistrationResponseModel _$RegistrationResponseModelFromJson(
    Map<String, dynamic> json) {
  return _RegistrationResponseModel.fromJson(json);
}

/// @nodoc
class _$RegistrationResponseModelTearOff {
  const _$RegistrationResponseModelTearOff();

// ignore: unused_element
  _RegistrationResponseModel call(
      {@JsonKey(name: "message") String message,
      @JsonKey(name: "jwt") String token}) {
    return _RegistrationResponseModel(
      message: message,
      token: token,
    );
  }

// ignore: unused_element
  RegistrationResponseModel fromJson(Map<String, Object> json) {
    return RegistrationResponseModel.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $RegistrationResponseModel = _$RegistrationResponseModelTearOff();

/// @nodoc
mixin _$RegistrationResponseModel {
  @JsonKey(name: "message")
  String get message;
  @JsonKey(name: "jwt")
  String get token;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $RegistrationResponseModelCopyWith<RegistrationResponseModel> get copyWith;
}

/// @nodoc
abstract class $RegistrationResponseModelCopyWith<$Res> {
  factory $RegistrationResponseModelCopyWith(RegistrationResponseModel value,
          $Res Function(RegistrationResponseModel) then) =
      _$RegistrationResponseModelCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: "message") String message,
      @JsonKey(name: "jwt") String token});
}

/// @nodoc
class _$RegistrationResponseModelCopyWithImpl<$Res>
    implements $RegistrationResponseModelCopyWith<$Res> {
  _$RegistrationResponseModelCopyWithImpl(this._value, this._then);

  final RegistrationResponseModel _value;
  // ignore: unused_field
  final $Res Function(RegistrationResponseModel) _then;

  @override
  $Res call({
    Object message = freezed,
    Object token = freezed,
  }) {
    return _then(_value.copyWith(
      message: message == freezed ? _value.message : message as String,
      token: token == freezed ? _value.token : token as String,
    ));
  }
}

/// @nodoc
abstract class _$RegistrationResponseModelCopyWith<$Res>
    implements $RegistrationResponseModelCopyWith<$Res> {
  factory _$RegistrationResponseModelCopyWith(_RegistrationResponseModel value,
          $Res Function(_RegistrationResponseModel) then) =
      __$RegistrationResponseModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: "message") String message,
      @JsonKey(name: "jwt") String token});
}

/// @nodoc
class __$RegistrationResponseModelCopyWithImpl<$Res>
    extends _$RegistrationResponseModelCopyWithImpl<$Res>
    implements _$RegistrationResponseModelCopyWith<$Res> {
  __$RegistrationResponseModelCopyWithImpl(_RegistrationResponseModel _value,
      $Res Function(_RegistrationResponseModel) _then)
      : super(_value, (v) => _then(v as _RegistrationResponseModel));

  @override
  _RegistrationResponseModel get _value =>
      super._value as _RegistrationResponseModel;

  @override
  $Res call({
    Object message = freezed,
    Object token = freezed,
  }) {
    return _then(_RegistrationResponseModel(
      message: message == freezed ? _value.message : message as String,
      token: token == freezed ? _value.token : token as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_RegistrationResponseModel implements _RegistrationResponseModel {
  _$_RegistrationResponseModel(
      {@JsonKey(name: "message") this.message,
      @JsonKey(name: "jwt") this.token});

  factory _$_RegistrationResponseModel.fromJson(Map<String, dynamic> json) =>
      _$_$_RegistrationResponseModelFromJson(json);

  @override
  @JsonKey(name: "message")
  final String message;
  @override
  @JsonKey(name: "jwt")
  final String token;

  @override
  String toString() {
    return 'RegistrationResponseModel(message: $message, token: $token)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _RegistrationResponseModel &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.token, token) ||
                const DeepCollectionEquality().equals(other.token, token)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(token);

  @JsonKey(ignore: true)
  @override
  _$RegistrationResponseModelCopyWith<_RegistrationResponseModel>
      get copyWith =>
          __$RegistrationResponseModelCopyWithImpl<_RegistrationResponseModel>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_RegistrationResponseModelToJson(this);
  }
}

abstract class _RegistrationResponseModel implements RegistrationResponseModel {
  factory _RegistrationResponseModel(
      {@JsonKey(name: "message") String message,
      @JsonKey(name: "jwt") String token}) = _$_RegistrationResponseModel;

  factory _RegistrationResponseModel.fromJson(Map<String, dynamic> json) =
      _$_RegistrationResponseModel.fromJson;

  @override
  @JsonKey(name: "message")
  String get message;
  @override
  @JsonKey(name: "jwt")
  String get token;
  @override
  @JsonKey(ignore: true)
  _$RegistrationResponseModelCopyWith<_RegistrationResponseModel> get copyWith;
}
