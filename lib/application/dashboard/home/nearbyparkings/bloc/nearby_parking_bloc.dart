import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:spark_app/application/dashboard/home/nearbyparkings/bloc/nearby_parking_state.dart';
import 'package:spark_app/core/models/dashboard/searchdestination/parking_list_response_model.dart';
import 'package:spark_app/core/repository/persistence/local_persistence.dart';
import 'package:spark_app/core/utils/spark_constants.dart';

class NearbyParkingBloc extends Cubit<NearbyParkingState> {
  NearbyParkingBloc() : super(NearbyParkingState.initialState());

  List<ParkingListResponseModel> nearbyParking = <ParkingListResponseModel>[];
  List<ParkingListResponseModel> _parkingList = <ParkingListResponseModel>[];

  void getParkingList() async {
    try {
      LocalPersistence localPersistence = LocalPersistence.instance();
      String jsonList = await localPersistence.securedStorage
          .getString(SparkConstants.PARKING_LIST);
      var result = jsonDecode(jsonList);
      if (result is List<dynamic>) {
        _parkingList = result
            .map((dynamic e) => ParkingListResponseModel.fromJson(e))
            .toList();

        emit(NearbyParkingState.showNearbyParkingList());
      }
    } catch (e) {}
  }

  Future<bool> getNearbyParking() async {
    nearbyParking.clear();
    Position myPosition = await Geolocator().getCurrentPosition();
    Geolocator locator = Geolocator();

    await Future.forEach(_parkingList, (element) async {
      double distance = await locator.distanceBetween(myPosition.latitude,
          myPosition.longitude, element.latitude, element.longitude);

      if (distance < 5000) {
        if (!nearbyParking.contains(element)) {
          nearbyParking.add(element);
        }
      }
    });

    if (nearbyParking.isEmpty)
      return false;
    else
      return true;
  }
}
