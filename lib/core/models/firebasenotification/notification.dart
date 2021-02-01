import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification.g.dart';

@JsonSerializable()
class NotificationModel {

  NotificationModel({
      @JsonKey(name: "title") String title,
      @JsonKey(name: "body") String body
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
  _$NotificationModelFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationModelToJson(this);

}