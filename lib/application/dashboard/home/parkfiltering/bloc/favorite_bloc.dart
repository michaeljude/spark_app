import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spark_app/application/dashboard/home/parkfiltering/bloc/favorite_state.dart';
import 'package:spark_app/core/utils/constant_enums.dart';

class FavoriteBloc extends Cubit<FavoriteState> {
  FavoriteBloc(bool isFavorite) : super(FavoriteState.initialState(isFavorite));

  void onFavoriteChanged(bool isFavorite) async {
    emit(FavoriteState.resetState());
    emit(FavoriteState.onFavoriteChanged(isFavorite));
  }
}
