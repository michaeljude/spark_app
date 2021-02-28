import 'package:freezed_annotation/freezed_annotation.dart';

part 'favorite_state.freezed.dart';

@freezed
abstract class FavoriteState with _$FavoriteState {
   factory FavoriteState.initialState(bool isFavorite) = InitialFavoriteState;
   factory FavoriteState.onFavoriteChanged(bool isFavorite) = ChangedFavoriteState;
   factory FavoriteState.resetState() = ResetFavoriteState;
}