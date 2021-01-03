
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_response.g.dart';
part 'login_response.freezed.dart';

@freezed
abstract class LoginResponseModel with _$LoginResponseModel {

  factory LoginResponseModel({
    @JsonKey(name: "message") String message,
    @JsonKey(name: "jwt") String token,
  }) = _LoginResponseModel;

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      _$_$_LoginResponseModelFromJson(json);

}