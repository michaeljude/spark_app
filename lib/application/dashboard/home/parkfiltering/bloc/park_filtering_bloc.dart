import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:spark_app/application/dashboard/home/parkfiltering/bloc/park_filtering_state.dart';
import 'package:spark_app/core/models/dashboard/searchdestination/parking_list_response_model.dart';
import 'package:spark_app/core/repository/persistence/local_persistence.dart';
import 'package:spark_app/core/utils/spark_constants.dart';

class ParkFilteringBloc extends Cubit<ParkFilteringState> {
  ParkFilteringBloc() : super(ParkFilteringState.initialState());

  List<ParkingListResponseModel> nearbyParking = <ParkingListResponseModel>[];
  List<ParkingListResponseModel> favoriteParking = <ParkingListResponseModel>[];
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

        emit(ParkFilteringState.showNearbyParkingList());
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

  Future<bool> getFavoriteParking() async {
    favoriteParking.clear();

    await Future.forEach(_parkingList,
        (ParkingListResponseModel element) async {
      if (element.isFavorite) {
        favoriteParking.add(element);
      }
    });

  if (favoriteParking.isEmpty)
      return false;
    else
      return true;
  }
}
