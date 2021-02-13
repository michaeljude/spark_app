import 'package:spark_app/core/api/api_service.dart';
import 'package:spark_app/core/models/dashboard/searchdestination/parking_list_response_model.dart';
import 'package:spark_app/core/models/home/get_status_response_model.dart';

class HomeRepository {

  HomeRepository(this._apiService);

  ApiService _apiService;

  Future<GetStatusResponseModel> getUserStatus(String customerId) => _apiService.getUserStatus(customerId);

  Future<List<ParkingListResponseModel>> getParkingList() => _apiService.getParkingList();
}