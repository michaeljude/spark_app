import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:spark_app/application/dashboard/home/search_destination/search_destination_event.dart';
import 'package:spark_app/application/dashboard/home/search_destination/search_destination_state.dart';
import 'package:spark_app/application/dashboard/model/user_status_model.dart';
import 'package:spark_app/core/models/dashboard/searchdestination/parking_list_response_model.dart';
import 'package:spark_app/core/repository/dashboardrepository/searchdestinationrepository/search_destination_repository.dart';
import 'package:spark_app/core/repository/persistence/local_persistence.dart';
import 'package:spark_app/core/utils/constant_enums.dart';
import 'package:spark_app/core/utils/spark_constants.dart';

class SearchDestinationBloc
    extends Bloc<SearchDestinationEvent, SearchDestinationState> {
  SearchDestinationBloc(this.searchDestinationRepository)
      : super(SearchDestinationInitialState());

  SearchDestinationRepository searchDestinationRepository;

  @override
  Stream<SearchDestinationState> mapEventToState(
      SearchDestinationEvent event) async* {
    if (event is SearchDestinationGetParking) {
      yield SearchDestinationLoadingState();

      try {
        LocalPersistence localPersistence = LocalPersistence.instance();
        String jsonList = await localPersistence.securedStorage
            .getString(SparkConstants.PARKING_LIST);
        var result = jsonDecode(jsonList);
        if (result is List<dynamic>) {
          List<ParkingListResponseModel> parkingList = result
              .map((dynamic e) => ParkingListResponseModel.fromJson(e))
              .toList();
          debugPrint("");
          yield AddParkingMarker(parkingList);
        } else {
          yield SearchDestinationHideLoadingState();
        }
      } catch (e) {
        yield SearchDestinationHideLoadingState();
      }
    }
    if (event is SearchDestinationOnRefreshEvent) {
      yield SearchDestinationRefreshState();
    }

    if (event is OnDrawRouteEvent) {
      yield OnDrawRouteState();
    }

    if (event is OnShowBottomSheetEvent) {
      yield OnShowBottomSheetState();
    }

    if (event is OnBookEvent) {
      try {
        String customerId = await LocalPersistence.instance().getCurrentUser();

        var result = await searchDestinationRepository.bookNow(
            event.parkingListResponseModel.parkingId, customerId);
        UserStatusModel.instance().status = BookingStatus.BOOKED;
        UserStatusModel.instance().position = Position(
            longitude: event.parkingListResponseModel.longitude,
            latitude: event.parkingListResponseModel.latitude);
        UserStatusModel.instance().transactionId = result.transactionId;

        yield OnBookingSuccess();
      } on DioError catch (e) {
        yield SearchDestinationHideLoadingState();
      } catch (e) {
        yield SearchDestinationHideLoadingState();
      }
    }
  }
}
