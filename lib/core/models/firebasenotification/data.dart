
import 'package:freezed_annotation/freezed_annotation.dart';
part 'data.g.dart';

@JsonSerializable()
class DataModel {

  DataModel({
      @JsonKey(name: "click_action") String clickAction,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) =>
  _$DataModelFromJson(json);

  Map<String, dynamic> toJson() => _$DataModelToJson(this);


}