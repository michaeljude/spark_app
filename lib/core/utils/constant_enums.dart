enum Origin {
  SEARCH_DIRECTION,
  INFO_WINDOW,
}

enum Positions { LEFT, RIGHT }

enum BookingStatus { FREE, BOOKED, PARKED }

enum ParkingType { spark, non_spark }

extension ParkingTypeX on ParkingType {
  String get type => _map[this];

  static const Map<ParkingType, String> _map = <ParkingType, String>{
    ParkingType.spark: 'spark',
    ParkingType.non_spark: 'non-spark',
  };
}
