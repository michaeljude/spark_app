import 'package:spark_app/core/api/api_service.dart';
import 'package:spark_app/core/models/dashboard/searchdestination/parking_list_response_model.dart';

class SearchDestinationRepository {

  SearchDestinationRepository(this.apiService);

  final ApiService apiService;

  Future<List<ParkingListResponseModel>> getParkingList() => apiService.getParkingList();
  

}