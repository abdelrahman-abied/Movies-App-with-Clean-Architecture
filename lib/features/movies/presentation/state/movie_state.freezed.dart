// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movie_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MovieState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is MovieState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'MovieState()';
  }
}

/// @nodoc
class $MovieStateCopyWith<$Res> {
  $MovieStateCopyWith(MovieState _, $Res Function(MovieState) __);
}

/// Adds pattern-matching-related methods to [MovieState].
extension MovieStatePatterns on MovieState {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MovieInitial value)? initial,
    TResult Function(MovieLoading value)? loading,
    TResult Function(MovieLoaded value)? loaded,
    TResult Function(MovieError value)? error,
    TResult Function(MovieEmpty value)? empty,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case MovieInitial() when initial != null:
        return initial(_that);
      case MovieLoading() when loading != null:
        return loading(_that);
      case MovieLoaded() when loaded != null:
        return loaded(_that);
      case MovieError() when error != null:
        return error(_that);
      case MovieEmpty() when empty != null:
        return empty(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MovieInitial value) initial,
    required TResult Function(MovieLoading value) loading,
    required TResult Function(MovieLoaded value) loaded,
    required TResult Function(MovieError value) error,
    required TResult Function(MovieEmpty value) empty,
  }) {
    final _that = this;
    switch (_that) {
      case MovieInitial():
        return initial(_that);
      case MovieLoading():
        return loading(_that);
      case MovieLoaded():
        return loaded(_that);
      case MovieError():
        return error(_that);
      case MovieEmpty():
        return empty(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MovieInitial value)? initial,
    TResult? Function(MovieLoading value)? loading,
    TResult? Function(MovieLoaded value)? loaded,
    TResult? Function(MovieError value)? error,
    TResult? Function(MovieEmpty value)? empty,
  }) {
    final _that = this;
    switch (_that) {
      case MovieInitial() when initial != null:
        return initial(_that);
      case MovieLoading() when loading != null:
        return loading(_that);
      case MovieLoaded() when loaded != null:
        return loaded(_that);
      case MovieError() when error != null:
        return error(_that);
      case MovieEmpty() when empty != null:
        return empty(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Movie> movies, bool hasReachedMax, int currentPage)?
        loaded,
    TResult Function(String message, String? code)? error,
    TResult Function()? empty,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case MovieInitial() when initial != null:
        return initial();
      case MovieLoading() when loading != null:
        return loading();
      case MovieLoaded() when loaded != null:
        return loaded(_that.movies, _that.hasReachedMax, _that.currentPage);
      case MovieError() when error != null:
        return error(_that.message, _that.code);
      case MovieEmpty() when empty != null:
        return empty();
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<Movie> movies, bool hasReachedMax, int currentPage)
        loaded,
    required TResult Function(String message, String? code) error,
    required TResult Function() empty,
  }) {
    final _that = this;
    switch (_that) {
      case MovieInitial():
        return initial();
      case MovieLoading():
        return loading();
      case MovieLoaded():
        return loaded(_that.movies, _that.hasReachedMax, _that.currentPage);
      case MovieError():
        return error(_that.message, _that.code);
      case MovieEmpty():
        return empty();
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Movie> movies, bool hasReachedMax, int currentPage)?
        loaded,
    TResult? Function(String message, String? code)? error,
    TResult? Function()? empty,
  }) {
    final _that = this;
    switch (_that) {
      case MovieInitial() when initial != null:
        return initial();
      case MovieLoading() when loading != null:
        return loading();
      case MovieLoaded() when loaded != null:
        return loaded(_that.movies, _that.hasReachedMax, _that.currentPage);
      case MovieError() when error != null:
        return error(_that.message, _that.code);
      case MovieEmpty() when empty != null:
        return empty();
      case _:
        return null;
    }
  }
}

/// @nodoc

class MovieInitial implements MovieState {
  const MovieInitial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is MovieInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'MovieState.initial()';
  }
}

/// @nodoc

class MovieLoading implements MovieState {
  const MovieLoading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is MovieLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'MovieState.loading()';
  }
}

/// @nodoc

class MovieLoaded implements MovieState {
  const MovieLoaded(
      {required final List<Movie> movies,
      this.hasReachedMax = false,
      this.currentPage = 1})
      : _movies = movies;

  final List<Movie> _movies;
  List<Movie> get movies {
    if (_movies is EqualUnmodifiableListView) return _movies;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_movies);
  }

  @JsonKey()
  final bool hasReachedMax;
  @JsonKey()
  final int currentPage;

  /// Create a copy of MovieState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MovieLoadedCopyWith<MovieLoaded> get copyWith =>
      _$MovieLoadedCopyWithImpl<MovieLoaded>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MovieLoaded &&
            const DeepCollectionEquality().equals(other._movies, _movies) &&
            (identical(other.hasReachedMax, hasReachedMax) ||
                other.hasReachedMax == hasReachedMax) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_movies), hasReachedMax, currentPage);

  @override
  String toString() {
    return 'MovieState.loaded(movies: $movies, hasReachedMax: $hasReachedMax, currentPage: $currentPage)';
  }
}

/// @nodoc
abstract mixin class $MovieLoadedCopyWith<$Res>
    implements $MovieStateCopyWith<$Res> {
  factory $MovieLoadedCopyWith(
          MovieLoaded value, $Res Function(MovieLoaded) _then) =
      _$MovieLoadedCopyWithImpl;
  @useResult
  $Res call({List<Movie> movies, bool hasReachedMax, int currentPage});
}

/// @nodoc
class _$MovieLoadedCopyWithImpl<$Res> implements $MovieLoadedCopyWith<$Res> {
  _$MovieLoadedCopyWithImpl(this._self, this._then);

  final MovieLoaded _self;
  final $Res Function(MovieLoaded) _then;

  /// Create a copy of MovieState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? movies = null,
    Object? hasReachedMax = null,
    Object? currentPage = null,
  }) {
    return _then(MovieLoaded(
      movies: null == movies
          ? _self._movies
          : movies // ignore: cast_nullable_to_non_nullable
              as List<Movie>,
      hasReachedMax: null == hasReachedMax
          ? _self.hasReachedMax
          : hasReachedMax // ignore: cast_nullable_to_non_nullable
              as bool,
      currentPage: null == currentPage
          ? _self.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class MovieError implements MovieState {
  const MovieError({required this.message, this.code});

  final String message;
  final String? code;

  /// Create a copy of MovieState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MovieErrorCopyWith<MovieError> get copyWith =>
      _$MovieErrorCopyWithImpl<MovieError>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MovieError &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.code, code) || other.code == code));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, code);

  @override
  String toString() {
    return 'MovieState.error(message: $message, code: $code)';
  }
}

/// @nodoc
abstract mixin class $MovieErrorCopyWith<$Res>
    implements $MovieStateCopyWith<$Res> {
  factory $MovieErrorCopyWith(
          MovieError value, $Res Function(MovieError) _then) =
      _$MovieErrorCopyWithImpl;
  @useResult
  $Res call({String message, String? code});
}

/// @nodoc
class _$MovieErrorCopyWithImpl<$Res> implements $MovieErrorCopyWith<$Res> {
  _$MovieErrorCopyWithImpl(this._self, this._then);

  final MovieError _self;
  final $Res Function(MovieError) _then;

  /// Create a copy of MovieState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
    Object? code = freezed,
  }) {
    return _then(MovieError(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      code: freezed == code
          ? _self.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class MovieEmpty implements MovieState {
  const MovieEmpty();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is MovieEmpty);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'MovieState.empty()';
  }
}

// dart format on
