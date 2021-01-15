
import 'package:freezed_annotation/freezed_annotation.dart';

part 'registration_response.g.dart';
part 'registration_response.freezed.dart';

@freezed
abstract class RegistrationResponseModel with _$RegistrationResponseModel {
  factory RegistrationResponseModel({
    @JsonKey(name: "message") String message
}) = _RegistrationResponseModel;

  factory RegistrationResponseModel.fromJson(Map<String, dynamic> json) =>
      _$RegistrationResponseModelFromJson(json);
}