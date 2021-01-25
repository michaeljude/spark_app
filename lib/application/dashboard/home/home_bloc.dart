import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spark_app/application/dashboard/home/home_event.dart';
import 'package:spark_app/application/dashboard/home/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitialState());

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) {
    
    
    
  }
  
}