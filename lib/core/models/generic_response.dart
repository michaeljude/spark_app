

import 'package:freezed_annotation/freezed_annotation.dart';
part 'generic_response.g.dart';
part 'generic_response.freezed.dart';

@freezed
abstract class GenericResponseModel with _$GenericResponseModel {

  factory GenericResponseModel({
      @JsonKey(name: 'message') String message
  }) = _GenericResponseModel;

  factory GenericResponseModel.fromJson(Map<String, dynamic> json) =>
      _$GenericResponseModelFromJson(json);
}