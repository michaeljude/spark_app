import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
          } on DioError catch(e) {

            if(e.type == DioErrorType.RESPONSE) {
              if(e.response.statusCode == 401 && e.response.data["message"] == "Expired Token") {
                yield SearchDestinationHideLoadingState();
              } else {
                yield SearchDestinationHideLoadingState();
              }
            } else {
              yield SearchDestinationHideLoadingState();
            }
            debugPrint(e.toString());
          } catch(e) {
            yield SearchDestinationHideLoadingState();
            debugPrint(e);
          }
          
      }
      if (event is SearchDestinationOnRefreshEvent) {
        yield SearchDestinationRefreshState();
      }
      
      if(event is OnDrawRouteEvent) {
        yield OnDrawRouteState();
      }
      
      if(event is OnShowBottomSheetEvent) {
        yield OnShowBottomSheetState();
      }
  }



}