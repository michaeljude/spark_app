import 'package:spark_app/core/api/api_service.dart';
import 'package:spark_app/core/models/dashboard/searchdestination/bookingmodel/booking_response_model.dart';
import 'package:spark_app/core/models/dashboard/searchdestination/parking_list_response_model.dart';
import 'package:spark_app/core/models/generic_response.dart';

class SearchDestinationRepository {

  SearchDestinationRepository(this.apiService);

  final ApiService apiService;

  Future<List<ParkingListResponseModel>> getParkingList() => apiService.getParkingList();
  
  Future<BookingResponseModel> bookNow(int parkingId, String customerId) => apiService.bookNow(parkingId, customerId);

  Future<GenericResponseModel> setUserAsParked(int transactionId, String customerId) 
  => apiService.setUserAsParked(customerId, transactionId);
}