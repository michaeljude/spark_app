import 'package:dartz/dartz.dart';
import 'package:spark_app/core/models/dashboard/searchdestination/parking_list_response_model.dart';

abstract class SearchDestinationEvent{}

class SearchDestinationGetParking extends SearchDestinationEvent{}

class SearchDestinationOnRefreshEvent extends SearchDestinationEvent{}

class OnDrawRouteEvent extends SearchDestinationEvent{}

class OnShowBottomSheetEvent extends SearchDestinationEvent{}

class OnBookEvent extends SearchDestinationEvent{

  final ParkingListResponseModel parkingListResponseModel;
  OnBookEvent({this.parkingListResponseModel});

}