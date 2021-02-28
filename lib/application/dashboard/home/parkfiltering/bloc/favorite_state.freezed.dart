// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'favorite_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$FavoriteStateTearOff {
  const _$FavoriteStateTearOff();

// ignore: unused_element
  InitialFavoriteState initialState(bool isFavorite) {
    return InitialFavoriteState(
      isFavorite,
    );
  }

// ignore: unused_element
  ChangedFavoriteState onFavoriteChanged(bool isFavorite) {
    return ChangedFavoriteState(
      isFavorite,
    );
  }

// ignore: unused_element
  ResetFavoriteState resetState() {
    return ResetFavoriteState();
  }
}

/// @nodoc
// ignore: unused_element
const $FavoriteState = _$FavoriteStateTearOff();

/// @nodoc
mixin _$FavoriteState {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initialState(bool isFavorite),
    @required TResult onFavoriteChanged(bool isFavorite),
    @required TResult resetState(),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initialState(bool isFavorite),
    TResult onFavoriteChanged(bool isFavorite),
    TResult resetState(),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initialState(InitialFavoriteState value),
    @required TResult onFavoriteChanged(ChangedFavoriteState value),
    @required TResult resetState(ResetFavoriteState value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initialState(InitialFavoriteState value),
    TResult onFavoriteChanged(ChangedFavoriteState value),
    TResult resetState(ResetFavoriteState value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $FavoriteStateCopyWith<$Res> {
  factory $FavoriteStateCopyWith(
          FavoriteState value, $Res Function(FavoriteState) then) =
      _$FavoriteStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$FavoriteStateCopyWithImpl<$Res>
    implements $FavoriteStateCopyWith<$Res> {
  _$FavoriteStateCopyWithImpl(this._value, this._then);

  final FavoriteState _value;
  // ignore: unused_field
  final $Res Function(FavoriteState) _then;
}

/// @nodoc
abstract class $InitialFavoriteStateCopyWith<$Res> {
  factory $InitialFavoriteStateCopyWith(InitialFavoriteState value,
          $Res Function(InitialFavoriteState) then) =
      _$InitialFavoriteStateCopyWithImpl<$Res>;
  $Res call({bool isFavorite});
}

/// @nodoc
class _$InitialFavoriteStateCopyWithImpl<$Res>
    extends _$FavoriteStateCopyWithImpl<$Res>
    implements $InitialFavoriteStateCopyWith<$Res> {
  _$InitialFavoriteStateCopyWithImpl(
      InitialFavoriteState _value, $Res Function(InitialFavoriteState) _then)
      : super(_value, (v) => _then(v as InitialFavoriteState));

  @override
  InitialFavoriteState get _value => super._value as InitialFavoriteState;

  @override
  $Res call({
    Object isFavorite = freezed,
  }) {
    return _then(InitialFavoriteState(
      isFavorite == freezed ? _value.isFavorite : isFavorite as bool,
    ));
  }
}

/// @nodoc
class _$InitialFavoriteState implements InitialFavoriteState {
  _$InitialFavoriteState(this.isFavorite) : assert(isFavorite != null);

  @override
  final bool isFavorite;

  @override
  String toString() {
    return 'FavoriteState.initialState(isFavorite: $isFavorite)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is InitialFavoriteState &&
            (identical(other.isFavorite, isFavorite) ||
                const DeepCollectionEquality()
                    .equals(other.isFavorite, isFavorite)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(isFavorite);

  @JsonKey(ignore: true)
  @override
  $InitialFavoriteStateCopyWith<InitialFavoriteState> get copyWith =>
      _$InitialFavoriteStateCopyWithImpl<InitialFavoriteState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initialState(bool isFavorite),
    @required TResult onFavoriteChanged(bool isFavorite),
    @required TResult resetState(),
  }) {
    assert(initialState != null);
    assert(onFavoriteChanged != null);
    assert(resetState != null);
    return initialState(isFavorite);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initialState(bool isFavorite),
    TResult onFavoriteChanged(bool isFavorite),
    TResult resetState(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (initialState != null) {
      return initialState(isFavorite);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initialState(InitialFavoriteState value),
    @required TResult onFavoriteChanged(ChangedFavoriteState value),
    @required TResult resetState(ResetFavoriteState value),
  }) {
    assert(initialState != null);
    assert(onFavoriteChanged != null);
    assert(resetState != null);
    return initialState(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initialState(InitialFavoriteState value),
    TResult onFavoriteChanged(ChangedFavoriteState value),
    TResult resetState(ResetFavoriteState value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (initialState != null) {
      return initialState(this);
    }
    return orElse();
  }
}

abstract class InitialFavoriteState implements FavoriteState {
  factory InitialFavoriteState(bool isFavorite) = _$InitialFavoriteState;

  bool get isFavorite;
  @JsonKey(ignore: true)
  $InitialFavoriteStateCopyWith<InitialFavoriteState> get copyWith;
}

/// @nodoc
abstract class $ChangedFavoriteStateCopyWith<$Res> {
  factory $ChangedFavoriteStateCopyWith(ChangedFavoriteState value,
          $Res Function(ChangedFavoriteState) then) =
      _$ChangedFavoriteStateCopyWithImpl<$Res>;
  $Res call({bool isFavorite});
}

/// @nodoc
class _$ChangedFavoriteStateCopyWithImpl<$Res>
    extends _$FavoriteStateCopyWithImpl<$Res>
    implements $ChangedFavoriteStateCopyWith<$Res> {
  _$ChangedFavoriteStateCopyWithImpl(
      ChangedFavoriteState _value, $Res Function(ChangedFavoriteState) _then)
      : super(_value, (v) => _then(v as ChangedFavoriteState));

  @override
  ChangedFavoriteState get _value => super._value as ChangedFavoriteState;

  @override
  $Res call({
    Object isFavorite = freezed,
  }) {
    return _then(ChangedFavoriteState(
      isFavorite == freezed ? _value.isFavorite : isFavorite as bool,
    ));
  }
}

/// @nodoc
class _$ChangedFavoriteState implements ChangedFavoriteState {
  _$ChangedFavoriteState(this.isFavorite) : assert(isFavorite != null);

  @override
  final bool isFavorite;

  @override
  String toString() {
    return 'FavoriteState.onFavoriteChanged(isFavorite: $isFavorite)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ChangedFavoriteState &&
            (identical(other.isFavorite, isFavorite) ||
                const DeepCollectionEquality()
                    .equals(other.isFavorite, isFavorite)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(isFavorite);

  @JsonKey(ignore: true)
  @override
  $ChangedFavoriteStateCopyWith<ChangedFavoriteState> get copyWith =>
      _$ChangedFavoriteStateCopyWithImpl<ChangedFavoriteState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initialState(bool isFavorite),
    @required TResult onFavoriteChanged(bool isFavorite),
    @required TResult resetState(),
  }) {
    assert(initialState != null);
    assert(onFavoriteChanged != null);
    assert(resetState != null);
    return onFavoriteChanged(isFavorite);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initialState(bool isFavorite),
    TResult onFavoriteChanged(bool isFavorite),
    TResult resetState(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (onFavoriteChanged != null) {
      return onFavoriteChanged(isFavorite);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initialState(InitialFavoriteState value),
    @required TResult onFavoriteChanged(ChangedFavoriteState value),
    @required TResult resetState(ResetFavoriteState value),
  }) {
    assert(initialState != null);
    assert(onFavoriteChanged != null);
    assert(resetState != null);
    return onFavoriteChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initialState(InitialFavoriteState value),
    TResult onFavoriteChanged(ChangedFavoriteState value),
    TResult resetState(ResetFavoriteState value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (onFavoriteChanged != null) {
      return onFavoriteChanged(this);
    }
    return orElse();
  }
}

abstract class ChangedFavoriteState implements FavoriteState {
  factory ChangedFavoriteState(bool isFavorite) = _$ChangedFavoriteState;

  bool get isFavorite;
  @JsonKey(ignore: true)
  $ChangedFavoriteStateCopyWith<ChangedFavoriteState> get copyWith;
}

/// @nodoc
abstract class $ResetFavoriteStateCopyWith<$Res> {
  factory $ResetFavoriteStateCopyWith(
          ResetFavoriteState value, $Res Function(ResetFavoriteState) then) =
      _$ResetFavoriteStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$ResetFavoriteStateCopyWithImpl<$Res>
    extends _$FavoriteStateCopyWithImpl<$Res>
    implements $ResetFavoriteStateCopyWith<$Res> {
  _$ResetFavoriteStateCopyWithImpl(
      ResetFavoriteState _value, $Res Function(ResetFavoriteState) _then)
      : super(_value, (v) => _then(v as ResetFavoriteState));

  @override
  ResetFavoriteState get _value => super._value as ResetFavoriteState;
}

/// @nodoc
class _$ResetFavoriteState implements ResetFavoriteState {
  _$ResetFavoriteState();

  @override
  String toString() {
    return 'FavoriteState.resetState()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is ResetFavoriteState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initialState(bool isFavorite),
    @required TResult onFavoriteChanged(bool isFavorite),
    @required TResult resetState(),
  }) {
    assert(initialState != null);
    assert(onFavoriteChanged != null);
    assert(resetState != null);
    return resetState();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initialState(bool isFavorite),
    TResult onFavoriteChanged(bool isFavorite),
    TResult resetState(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (resetState != null) {
      return resetState();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initialState(InitialFavoriteState value),
    @required TResult onFavoriteChanged(ChangedFavoriteState value),
    @required TResult resetState(ResetFavoriteState value),
  }) {
    assert(initialState != null);
    assert(onFavoriteChanged != null);
    assert(resetState != null);
    return resetState(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initialState(InitialFavoriteState value),
    TResult onFavoriteChanged(ChangedFavoriteState value),
    TResult resetState(ResetFavoriteState value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (resetState != null) {
      return resetState(this);
    }
    return orElse();
  }
}

abstract class ResetFavoriteState implements FavoriteState {
  factory ResetFavoriteState() = _$ResetFavoriteState;
}
