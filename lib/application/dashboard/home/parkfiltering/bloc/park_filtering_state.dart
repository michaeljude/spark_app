import 'package:freezed_annotation/freezed_annotation.dart';

part 'park_filtering_state.freezed.dart';

@freezed
abstract class ParkFilteringState with _$ParkFilteringState {
  factory ParkFilteringState.initialState() = InitialParkFilteringState;
  factory ParkFilteringState.showNearbyParkingList() = ShowParkFilteringState;
  factory ParkFilteringState.noNearbyParkingList() = NoParkFilteringState;
}
