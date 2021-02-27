import 'package:freezed_annotation/freezed_annotation.dart';

part 'nearby_parking_state.freezed.dart';

@freezed
abstract class NearbyParkingState with _$NearbyParkingState {
  factory NearbyParkingState.initialState() = InitialNearbyParkingState;
  factory NearbyParkingState.showNearbyParkingList() = ShowNearbyParkingState;
  factory NearbyParkingState.noNearbyParkingList() = NoNearbyParkingState;
}
