
import 'package:geolocator/geolocator.dart';
import 'package:spark_app/core/models/dashboard/searchdestination/parking_list_response_model.dart';

abstract class SearchDestinationState{}

class SearchDestinationInitialState extends SearchDestinationState{}
class AddParkingMarker extends SearchDestinationState {

  List<ParkingListResponseModel> parkingList;

  AddParkingMarker(this.parkingList);

}

class SearchDestinationRefreshState extends SearchDestinationState{}

class SearchDestinationLoadingState extends SearchDestinationState{}

class SearchDestinationHideLoadingState extends SearchDestinationState{}