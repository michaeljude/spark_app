import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'data.dart';
import 'notification.dart';

part 'firebase_notification_model.g.dart';

@JsonSerializable(explicitToJson: true)
class FirebaseNotificationModel {

  FirebaseNotificationModel({
    NotificationModel notification,
    DataModel data
  });
  
  factory FirebaseNotificationModel.fromJson(Map<String, dynamic> json) =>
  _$FirebaseNotificationModelFromJson(json);

  Map<String, dynamic> toJson() => _$FirebaseNotificationModelToJson(this);

}


// {notification: {title: Spark Payment, body: You have paid your parking}, data: {click_action: FLUTTER_NOTIFICATION_CLICK}}