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

enum FavoriteAction { create, delete }
extension FavoriteActionX on FavoriteAction {
  String get action => _map[this];

  static const Map<FavoriteAction, String> _map = <FavoriteAction, String>{
    FavoriteAction.create: 'create',
    FavoriteAction.delete: 'delete',
  };
}

enum FilteringType { nearby, favorite }
extension FilteringTypeX on FilteringType {
  String get type => _map[this];

  static const Map<FilteringType, String> _map = <FilteringType, String>{
    FilteringType.nearby: 'nearby',
    FilteringType.favorite: 'favorite',
  };
}
