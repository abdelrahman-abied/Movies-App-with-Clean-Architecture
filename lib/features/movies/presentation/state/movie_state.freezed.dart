// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movie_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MovieState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<Movie> movies, bool hasReachedMax, int currentPage)
        loaded,
    required TResult Function(String message, String? code) error,
    required TResult Function() empty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Movie> movies, bool hasReachedMax, int currentPage)?
        loaded,
    TResult? Function(String message, String? code)? error,
    TResult? Function()? empty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Movie> movies, bool hasReachedMax, int currentPage)?
        loaded,
    TResult Function(String message, String? code)? error,
    TResult Function()? empty,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MovieInitial value) initial,
    required TResult Function(MovieLoading value) loading,
    required TResult Function(MovieLoaded value) loaded,
    required TResult Function(MovieError value) error,
    required TResult Function(MovieEmpty value) empty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MovieInitial value)? initial,
    TResult? Function(MovieLoading value)? loading,
    TResult? Function(MovieLoaded value)? loaded,
    TResult? Function(MovieError value)? error,
    TResult? Function(MovieEmpty value)? empty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MovieInitial value)? initial,
    TResult Function(MovieLoading value)? loading,
    TResult Function(MovieLoaded value)? loaded,
    TResult Function(MovieError value)? error,
    TResult Function(MovieEmpty value)? empty,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MovieStateCopyWith<$Res> {
  factory $MovieStateCopyWith(
          MovieState value, $Res Function(MovieState) then) =
      _$MovieStateCopyWithImpl<$Res, MovieState>;
}

/// @nodoc
class _$MovieStateCopyWithImpl<$Res, $Val extends MovieState>
    implements $MovieStateCopyWith<$Res> {
  _$MovieStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$MovieInitialImplCopyWith<$Res> {
  factory _$$MovieInitialImplCopyWith(
          _$MovieInitialImpl value, $Res Function(_$MovieInitialImpl) then) =
      __$$MovieInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$MovieInitialImplCopyWithImpl<$Res>
    extends _$MovieStateCopyWithImpl<$Res, _$MovieInitialImpl>
    implements _$$MovieInitialImplCopyWith<$Res> {
  __$$MovieInitialImplCopyWithImpl(
      _$MovieInitialImpl _value, $Res Function(_$MovieInitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$MovieInitialImpl implements MovieInitial {
  const _$MovieInitialImpl();

  @override
  String toString() {
    return 'MovieState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$MovieInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
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
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Movie> movies, bool hasReachedMax, int currentPage)?
        loaded,
    TResult? Function(String message, String? code)? error,
    TResult? Function()? empty,
  }) {
    return initial?.call();
  }

  @override
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
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MovieInitial value) initial,
    required TResult Function(MovieLoading value) loading,
    required TResult Function(MovieLoaded value) loaded,
    required TResult Function(MovieError value) error,
    required TResult Function(MovieEmpty value) empty,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MovieInitial value)? initial,
    TResult? Function(MovieLoading value)? loading,
    TResult? Function(MovieLoaded value)? loaded,
    TResult? Function(MovieError value)? error,
    TResult? Function(MovieEmpty value)? empty,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MovieInitial value)? initial,
    TResult Function(MovieLoading value)? loading,
    TResult Function(MovieLoaded value)? loaded,
    TResult Function(MovieError value)? error,
    TResult Function(MovieEmpty value)? empty,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class MovieInitial implements MovieState {
  const factory MovieInitial() = _$MovieInitialImpl;
}

/// @nodoc
abstract class _$$MovieLoadingImplCopyWith<$Res> {
  factory _$$MovieLoadingImplCopyWith(
          _$MovieLoadingImpl value, $Res Function(_$MovieLoadingImpl) then) =
      __$$MovieLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$MovieLoadingImplCopyWithImpl<$Res>
    extends _$MovieStateCopyWithImpl<$Res, _$MovieLoadingImpl>
    implements _$$MovieLoadingImplCopyWith<$Res> {
  __$$MovieLoadingImplCopyWithImpl(
      _$MovieLoadingImpl _value, $Res Function(_$MovieLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$MovieLoadingImpl implements MovieLoading {
  const _$MovieLoadingImpl();

  @override
  String toString() {
    return 'MovieState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$MovieLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
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
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Movie> movies, bool hasReachedMax, int currentPage)?
        loaded,
    TResult? Function(String message, String? code)? error,
    TResult? Function()? empty,
  }) {
    return loading?.call();
  }

  @override
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
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MovieInitial value) initial,
    required TResult Function(MovieLoading value) loading,
    required TResult Function(MovieLoaded value) loaded,
    required TResult Function(MovieError value) error,
    required TResult Function(MovieEmpty value) empty,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MovieInitial value)? initial,
    TResult? Function(MovieLoading value)? loading,
    TResult? Function(MovieLoaded value)? loaded,
    TResult? Function(MovieError value)? error,
    TResult? Function(MovieEmpty value)? empty,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MovieInitial value)? initial,
    TResult Function(MovieLoading value)? loading,
    TResult Function(MovieLoaded value)? loaded,
    TResult Function(MovieError value)? error,
    TResult Function(MovieEmpty value)? empty,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class MovieLoading implements MovieState {
  const factory MovieLoading() = _$MovieLoadingImpl;
}

/// @nodoc
abstract class _$$MovieLoadedImplCopyWith<$Res> {
  factory _$$MovieLoadedImplCopyWith(
          _$MovieLoadedImpl value, $Res Function(_$MovieLoadedImpl) then) =
      __$$MovieLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Movie> movies, bool hasReachedMax, int currentPage});
}

/// @nodoc
class __$$MovieLoadedImplCopyWithImpl<$Res>
    extends _$MovieStateCopyWithImpl<$Res, _$MovieLoadedImpl>
    implements _$$MovieLoadedImplCopyWith<$Res> {
  __$$MovieLoadedImplCopyWithImpl(
      _$MovieLoadedImpl _value, $Res Function(_$MovieLoadedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? movies = null,
    Object? hasReachedMax = null,
    Object? currentPage = null,
  }) {
    return _then(_$MovieLoadedImpl(
      movies: null == movies
          ? _value._movies
          : movies // ignore: cast_nullable_to_non_nullable
              as List<Movie>,
      hasReachedMax: null == hasReachedMax
          ? _value.hasReachedMax
          : hasReachedMax // ignore: cast_nullable_to_non_nullable
              as bool,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$MovieLoadedImpl implements MovieLoaded {
  const _$MovieLoadedImpl(
      {required final List<Movie> movies,
      this.hasReachedMax = false,
      this.currentPage = 1})
      : _movies = movies;

  final List<Movie> _movies;
  @override
  List<Movie> get movies {
    if (_movies is EqualUnmodifiableListView) return _movies;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_movies);
  }

  @override
  @JsonKey()
  final bool hasReachedMax;
  @override
  @JsonKey()
  final int currentPage;

  @override
  String toString() {
    return 'MovieState.loaded(movies: $movies, hasReachedMax: $hasReachedMax, currentPage: $currentPage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MovieLoadedImpl &&
            const DeepCollectionEquality().equals(other._movies, _movies) &&
            (identical(other.hasReachedMax, hasReachedMax) ||
                other.hasReachedMax == hasReachedMax) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_movies), hasReachedMax, currentPage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MovieLoadedImplCopyWith<_$MovieLoadedImpl> get copyWith =>
      __$$MovieLoadedImplCopyWithImpl<_$MovieLoadedImpl>(this, _$identity);

  @override
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
    return loaded(movies, hasReachedMax, currentPage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Movie> movies, bool hasReachedMax, int currentPage)?
        loaded,
    TResult? Function(String message, String? code)? error,
    TResult? Function()? empty,
  }) {
    return loaded?.call(movies, hasReachedMax, currentPage);
  }

  @override
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
    if (loaded != null) {
      return loaded(movies, hasReachedMax, currentPage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MovieInitial value) initial,
    required TResult Function(MovieLoading value) loading,
    required TResult Function(MovieLoaded value) loaded,
    required TResult Function(MovieError value) error,
    required TResult Function(MovieEmpty value) empty,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MovieInitial value)? initial,
    TResult? Function(MovieLoading value)? loading,
    TResult? Function(MovieLoaded value)? loaded,
    TResult? Function(MovieError value)? error,
    TResult? Function(MovieEmpty value)? empty,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MovieInitial value)? initial,
    TResult Function(MovieLoading value)? loading,
    TResult Function(MovieLoaded value)? loaded,
    TResult Function(MovieError value)? error,
    TResult Function(MovieEmpty value)? empty,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class MovieLoaded implements MovieState {
  const factory MovieLoaded(
      {required final List<Movie> movies,
      final bool hasReachedMax,
      final int currentPage}) = _$MovieLoadedImpl;

  List<Movie> get movies;
  bool get hasReachedMax;
  int get currentPage;
  @JsonKey(ignore: true)
  _$$MovieLoadedImplCopyWith<_$MovieLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MovieErrorImplCopyWith<$Res> {
  factory _$$MovieErrorImplCopyWith(
          _$MovieErrorImpl value, $Res Function(_$MovieErrorImpl) then) =
      __$$MovieErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message, String? code});
}

/// @nodoc
class __$$MovieErrorImplCopyWithImpl<$Res>
    extends _$MovieStateCopyWithImpl<$Res, _$MovieErrorImpl>
    implements _$$MovieErrorImplCopyWith<$Res> {
  __$$MovieErrorImplCopyWithImpl(
      _$MovieErrorImpl _value, $Res Function(_$MovieErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? code = freezed,
  }) {
    return _then(_$MovieErrorImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$MovieErrorImpl implements MovieError {
  const _$MovieErrorImpl({required this.message, this.code});

  @override
  final String message;
  @override
  final String? code;

  @override
  String toString() {
    return 'MovieState.error(message: $message, code: $code)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MovieErrorImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.code, code) || other.code == code));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, code);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MovieErrorImplCopyWith<_$MovieErrorImpl> get copyWith =>
      __$$MovieErrorImplCopyWithImpl<_$MovieErrorImpl>(this, _$identity);

  @override
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
    return error(message, code);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Movie> movies, bool hasReachedMax, int currentPage)?
        loaded,
    TResult? Function(String message, String? code)? error,
    TResult? Function()? empty,
  }) {
    return error?.call(message, code);
  }

  @override
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
    if (error != null) {
      return error(message, code);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MovieInitial value) initial,
    required TResult Function(MovieLoading value) loading,
    required TResult Function(MovieLoaded value) loaded,
    required TResult Function(MovieError value) error,
    required TResult Function(MovieEmpty value) empty,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MovieInitial value)? initial,
    TResult? Function(MovieLoading value)? loading,
    TResult? Function(MovieLoaded value)? loaded,
    TResult? Function(MovieError value)? error,
    TResult? Function(MovieEmpty value)? empty,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MovieInitial value)? initial,
    TResult Function(MovieLoading value)? loading,
    TResult Function(MovieLoaded value)? loaded,
    TResult Function(MovieError value)? error,
    TResult Function(MovieEmpty value)? empty,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class MovieError implements MovieState {
  const factory MovieError(
      {required final String message, final String? code}) = _$MovieErrorImpl;

  String get message;
  String? get code;
  @JsonKey(ignore: true)
  _$$MovieErrorImplCopyWith<_$MovieErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MovieEmptyImplCopyWith<$Res> {
  factory _$$MovieEmptyImplCopyWith(
          _$MovieEmptyImpl value, $Res Function(_$MovieEmptyImpl) then) =
      __$$MovieEmptyImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$MovieEmptyImplCopyWithImpl<$Res>
    extends _$MovieStateCopyWithImpl<$Res, _$MovieEmptyImpl>
    implements _$$MovieEmptyImplCopyWith<$Res> {
  __$$MovieEmptyImplCopyWithImpl(
      _$MovieEmptyImpl _value, $Res Function(_$MovieEmptyImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$MovieEmptyImpl implements MovieEmpty {
  const _$MovieEmptyImpl();

  @override
  String toString() {
    return 'MovieState.empty()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$MovieEmptyImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
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
    return empty();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Movie> movies, bool hasReachedMax, int currentPage)?
        loaded,
    TResult? Function(String message, String? code)? error,
    TResult? Function()? empty,
  }) {
    return empty?.call();
  }

  @override
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
    if (empty != null) {
      return empty();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MovieInitial value) initial,
    required TResult Function(MovieLoading value) loading,
    required TResult Function(MovieLoaded value) loaded,
    required TResult Function(MovieError value) error,
    required TResult Function(MovieEmpty value) empty,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MovieInitial value)? initial,
    TResult? Function(MovieLoading value)? loading,
    TResult? Function(MovieLoaded value)? loaded,
    TResult? Function(MovieError value)? error,
    TResult? Function(MovieEmpty value)? empty,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MovieInitial value)? initial,
    TResult Function(MovieLoading value)? loading,
    TResult Function(MovieLoaded value)? loaded,
    TResult Function(MovieError value)? error,
    TResult Function(MovieEmpty value)? empty,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class MovieEmpty implements MovieState {
  const factory MovieEmpty() = _$MovieEmptyImpl;
}
