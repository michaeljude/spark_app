import 'package:geolocator/geolocator.dart';
import 'package:spark_app/core/utils/constant_enums.dart';

class UserStatusModel {

  BookingStatus status;
  String parkingName;
  int transactionId;
  Position position;

  static UserStatusModel _instance;

  factory UserStatusModel.instance() {
      if(_instance == null) {
        _instance = UserStatusModel();
      }
      return _instance;
  }

  UserStatusModel();

}