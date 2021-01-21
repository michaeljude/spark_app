import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:spark_app/application/dashboard/home/search_destination/search_destination_event.dart';
import 'package:spark_app/application/dashboard/home/search_destination/search_destination_state.dart';
import 'package:spark_app/core/repository/dashboardrepository/searchdestinationrepository/search_destination_repository.dart';

class SearchDestinationBloc extends Bloc<SearchDestinationEvent, SearchDestinationState> {

  
  SearchDestinationBloc(this.searchDestinationRepository) : super(SearchDestinationInitialState());
  
  SearchDestinationRepository searchDestinationRepository;
  
  @override
  Stream<SearchDestinationState> mapEventToState(SearchDestinationEvent event) async*{
    
      if(event is SearchDestinationGetParking) {

          yield SearchDestinationLoadingState();
          try {
            var result = await searchDestinationRepository.getParkingList();
            yield AddParkingMarker(result);
          } catch(e) {
            yield SearchDestinationHideLoadingState();
            debugPrint(e);
          }
          
      }
      if (event is SearchDestinationOnRefreshEvent) {
        yield SearchDestinationRefreshState();
      }

  }



}