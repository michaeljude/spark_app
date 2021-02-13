import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

@immutable
abstract class BottomNavigationState extends Equatable {
  BottomNavigationState([List props = const []]) : super();
}

class CurrentIndexChanged extends BottomNavigationState {
  final int currentIndex;

  CurrentIndexChanged({@required this.currentIndex}) : super([currentIndex]);

  @override
  String toString() => 'CurrentIndexChanged to $currentIndex';

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class PageLoading extends BottomNavigationState {
  @override
  String toString() => 'PageLoading';

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class HomePageLoaded extends BottomNavigationState {

  final bool hasError;

  HomePageLoaded(this.hasError);

  @override
  List<Object> get props => throw UnimplementedError();
}

class ActivityPageLoaded extends BottomNavigationState {
  final String text;

  ActivityPageLoaded({@required this.text}) : super([text]);

  @override
  String toString() => 'ActivityPageLoaded with number: $text';

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class PaymentPageLoaded extends BottomNavigationState {
  final String text;

  PaymentPageLoaded({@required this.text}) : super([text]);

  @override
  String toString() => 'PaymentPageLoaded with number: $text';

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class MessagePageLoaded extends BottomNavigationState {
  final String text;

  MessagePageLoaded({@required this.text}) : super([text]);

  @override
  String toString() => 'MessagePageLoaded with number: $text';

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class AccountPageLoaded extends BottomNavigationState {
  final String text;

  AccountPageLoaded({@required this.text}) : super([text]);

  @override
  String toString() => 'AccountPageLoaded with number: $text';

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

