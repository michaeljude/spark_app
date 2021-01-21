import 'package:dartz/dartz.dart';

abstract class SearchDestinationEvent{}

class SearchDestinationGetParking extends SearchDestinationEvent{}

class SearchDestinationOnRefreshEvent extends SearchDestinationEvent{}