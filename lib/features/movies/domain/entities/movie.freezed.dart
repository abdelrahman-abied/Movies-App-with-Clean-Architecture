// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movie.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Movie {
  int get id;
  String get title;
  String? get overview;
  String? get posterPath;
  String? get backdropPath;
  double? get voteAverage;
  int? get voteCount;
  String? get releaseDate;
  List<int>? get genreIds;
  bool? get adult;
  String? get originalLanguage;
  String? get originalTitle;
  double? get popularity;
  bool? get video;

  /// Create a copy of Movie
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MovieCopyWith<Movie> get copyWith =>
      _$MovieCopyWithImpl<Movie>(this as Movie, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Movie &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.overview, overview) ||
                other.overview == overview) &&
            (identical(other.posterPath, posterPath) ||
                other.posterPath == posterPath) &&
            (identical(other.backdropPath, backdropPath) ||
                other.backdropPath == backdropPath) &&
            (identical(other.voteAverage, voteAverage) ||
                other.voteAverage == voteAverage) &&
            (identical(other.voteCount, voteCount) ||
                other.voteCount == voteCount) &&
            (identical(other.releaseDate, releaseDate) ||
                other.releaseDate == releaseDate) &&
            const DeepCollectionEquality().equals(other.genreIds, genreIds) &&
            (identical(other.adult, adult) || other.adult == adult) &&
            (identical(other.originalLanguage, originalLanguage) ||
                other.originalLanguage == originalLanguage) &&
            (identical(other.originalTitle, originalTitle) ||
                other.originalTitle == originalTitle) &&
            (identical(other.popularity, popularity) ||
                other.popularity == popularity) &&
            (identical(other.video, video) || other.video == video));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      overview,
      posterPath,
      backdropPath,
      voteAverage,
      voteCount,
      releaseDate,
      const DeepCollectionEquality().hash(genreIds),
      adult,
      originalLanguage,
      originalTitle,
      popularity,
      video);

  @override
  String toString() {
    return 'Movie(id: $id, title: $title, overview: $overview, posterPath: $posterPath, backdropPath: $backdropPath, voteAverage: $voteAverage, voteCount: $voteCount, releaseDate: $releaseDate, genreIds: $genreIds, adult: $adult, originalLanguage: $originalLanguage, originalTitle: $originalTitle, popularity: $popularity, video: $video)';
  }
}

/// @nodoc
abstract mixin class $MovieCopyWith<$Res> {
  factory $MovieCopyWith(Movie value, $Res Function(Movie) _then) =
      _$MovieCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      String title,
      String? overview,
      String? posterPath,
      String? backdropPath,
      double? voteAverage,
      int? voteCount,
      String? releaseDate,
      List<int>? genreIds,
      bool? adult,
      String? originalLanguage,
      String? originalTitle,
      double? popularity,
      bool? video});
}

/// @nodoc
class _$MovieCopyWithImpl<$Res> implements $MovieCopyWith<$Res> {
  _$MovieCopyWithImpl(this._self, this._then);

  final Movie _self;
  final $Res Function(Movie) _then;

  /// Create a copy of Movie
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? overview = freezed,
    Object? posterPath = freezed,
    Object? backdropPath = freezed,
    Object? voteAverage = freezed,
    Object? voteCount = freezed,
    Object? releaseDate = freezed,
    Object? genreIds = freezed,
    Object? adult = freezed,
    Object? originalLanguage = freezed,
    Object? originalTitle = freezed,
    Object? popularity = freezed,
    Object? video = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      overview: freezed == overview
          ? _self.overview
          : overview // ignore: cast_nullable_to_non_nullable
              as String?,
      posterPath: freezed == posterPath
          ? _self.posterPath
          : posterPath // ignore: cast_nullable_to_non_nullable
              as String?,
      backdropPath: freezed == backdropPath
          ? _self.backdropPath
          : backdropPath // ignore: cast_nullable_to_non_nullable
              as String?,
      voteAverage: freezed == voteAverage
          ? _self.voteAverage
          : voteAverage // ignore: cast_nullable_to_non_nullable
              as double?,
      voteCount: freezed == voteCount
          ? _self.voteCount
          : voteCount // ignore: cast_nullable_to_non_nullable
              as int?,
      releaseDate: freezed == releaseDate
          ? _self.releaseDate
          : releaseDate // ignore: cast_nullable_to_non_nullable
              as String?,
      genreIds: freezed == genreIds
          ? _self.genreIds
          : genreIds // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      adult: freezed == adult
          ? _self.adult
          : adult // ignore: cast_nullable_to_non_nullable
              as bool?,
      originalLanguage: freezed == originalLanguage
          ? _self.originalLanguage
          : originalLanguage // ignore: cast_nullable_to_non_nullable
              as String?,
      originalTitle: freezed == originalTitle
          ? _self.originalTitle
          : originalTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      popularity: freezed == popularity
          ? _self.popularity
          : popularity // ignore: cast_nullable_to_non_nullable
              as double?,
      video: freezed == video
          ? _self.video
          : video // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// Adds pattern-matching-related methods to [Movie].
extension MoviePatterns on Movie {
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
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_Movie value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Movie() when $default != null:
        return $default(_that);
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
  TResult map<TResult extends Object?>(
    TResult Function(_Movie value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Movie():
        return $default(_that);
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
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_Movie value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Movie() when $default != null:
        return $default(_that);
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
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            int id,
            String title,
            String? overview,
            String? posterPath,
            String? backdropPath,
            double? voteAverage,
            int? voteCount,
            String? releaseDate,
            List<int>? genreIds,
            bool? adult,
            String? originalLanguage,
            String? originalTitle,
            double? popularity,
            bool? video)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Movie() when $default != null:
        return $default(
            _that.id,
            _that.title,
            _that.overview,
            _that.posterPath,
            _that.backdropPath,
            _that.voteAverage,
            _that.voteCount,
            _that.releaseDate,
            _that.genreIds,
            _that.adult,
            _that.originalLanguage,
            _that.originalTitle,
            _that.popularity,
            _that.video);
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
  TResult when<TResult extends Object?>(
    TResult Function(
            int id,
            String title,
            String? overview,
            String? posterPath,
            String? backdropPath,
            double? voteAverage,
            int? voteCount,
            String? releaseDate,
            List<int>? genreIds,
            bool? adult,
            String? originalLanguage,
            String? originalTitle,
            double? popularity,
            bool? video)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Movie():
        return $default(
            _that.id,
            _that.title,
            _that.overview,
            _that.posterPath,
            _that.backdropPath,
            _that.voteAverage,
            _that.voteCount,
            _that.releaseDate,
            _that.genreIds,
            _that.adult,
            _that.originalLanguage,
            _that.originalTitle,
            _that.popularity,
            _that.video);
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
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            int id,
            String title,
            String? overview,
            String? posterPath,
            String? backdropPath,
            double? voteAverage,
            int? voteCount,
            String? releaseDate,
            List<int>? genreIds,
            bool? adult,
            String? originalLanguage,
            String? originalTitle,
            double? popularity,
            bool? video)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Movie() when $default != null:
        return $default(
            _that.id,
            _that.title,
            _that.overview,
            _that.posterPath,
            _that.backdropPath,
            _that.voteAverage,
            _that.voteCount,
            _that.releaseDate,
            _that.genreIds,
            _that.adult,
            _that.originalLanguage,
            _that.originalTitle,
            _that.popularity,
            _that.video);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Movie extends Movie {
  const _Movie(
      {required this.id,
      required this.title,
      this.overview,
      this.posterPath,
      this.backdropPath,
      this.voteAverage,
      this.voteCount,
      this.releaseDate,
      final List<int>? genreIds,
      this.adult,
      this.originalLanguage,
      this.originalTitle,
      this.popularity,
      this.video})
      : _genreIds = genreIds,
        super._();

  @override
  final int id;
  @override
  final String title;
  @override
  final String? overview;
  @override
  final String? posterPath;
  @override
  final String? backdropPath;
  @override
  final double? voteAverage;
  @override
  final int? voteCount;
  @override
  final String? releaseDate;
  final List<int>? _genreIds;
  @override
  List<int>? get genreIds {
    final value = _genreIds;
    if (value == null) return null;
    if (_genreIds is EqualUnmodifiableListView) return _genreIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final bool? adult;
  @override
  final String? originalLanguage;
  @override
  final String? originalTitle;
  @override
  final double? popularity;
  @override
  final bool? video;

  /// Create a copy of Movie
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MovieCopyWith<_Movie> get copyWith =>
      __$MovieCopyWithImpl<_Movie>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Movie &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.overview, overview) ||
                other.overview == overview) &&
            (identical(other.posterPath, posterPath) ||
                other.posterPath == posterPath) &&
            (identical(other.backdropPath, backdropPath) ||
                other.backdropPath == backdropPath) &&
            (identical(other.voteAverage, voteAverage) ||
                other.voteAverage == voteAverage) &&
            (identical(other.voteCount, voteCount) ||
                other.voteCount == voteCount) &&
            (identical(other.releaseDate, releaseDate) ||
                other.releaseDate == releaseDate) &&
            const DeepCollectionEquality().equals(other._genreIds, _genreIds) &&
            (identical(other.adult, adult) || other.adult == adult) &&
            (identical(other.originalLanguage, originalLanguage) ||
                other.originalLanguage == originalLanguage) &&
            (identical(other.originalTitle, originalTitle) ||
                other.originalTitle == originalTitle) &&
            (identical(other.popularity, popularity) ||
                other.popularity == popularity) &&
            (identical(other.video, video) || other.video == video));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      overview,
      posterPath,
      backdropPath,
      voteAverage,
      voteCount,
      releaseDate,
      const DeepCollectionEquality().hash(_genreIds),
      adult,
      originalLanguage,
      originalTitle,
      popularity,
      video);

  @override
  String toString() {
    return 'Movie(id: $id, title: $title, overview: $overview, posterPath: $posterPath, backdropPath: $backdropPath, voteAverage: $voteAverage, voteCount: $voteCount, releaseDate: $releaseDate, genreIds: $genreIds, adult: $adult, originalLanguage: $originalLanguage, originalTitle: $originalTitle, popularity: $popularity, video: $video)';
  }
}

/// @nodoc
abstract mixin class _$MovieCopyWith<$Res> implements $MovieCopyWith<$Res> {
  factory _$MovieCopyWith(_Movie value, $Res Function(_Movie) _then) =
      __$MovieCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      String title,
      String? overview,
      String? posterPath,
      String? backdropPath,
      double? voteAverage,
      int? voteCount,
      String? releaseDate,
      List<int>? genreIds,
      bool? adult,
      String? originalLanguage,
      String? originalTitle,
      double? popularity,
      bool? video});
}

/// @nodoc
class __$MovieCopyWithImpl<$Res> implements _$MovieCopyWith<$Res> {
  __$MovieCopyWithImpl(this._self, this._then);

  final _Movie _self;
  final $Res Function(_Movie) _then;

  /// Create a copy of Movie
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? overview = freezed,
    Object? posterPath = freezed,
    Object? backdropPath = freezed,
    Object? voteAverage = freezed,
    Object? voteCount = freezed,
    Object? releaseDate = freezed,
    Object? genreIds = freezed,
    Object? adult = freezed,
    Object? originalLanguage = freezed,
    Object? originalTitle = freezed,
    Object? popularity = freezed,
    Object? video = freezed,
  }) {
    return _then(_Movie(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      overview: freezed == overview
          ? _self.overview
          : overview // ignore: cast_nullable_to_non_nullable
              as String?,
      posterPath: freezed == posterPath
          ? _self.posterPath
          : posterPath // ignore: cast_nullable_to_non_nullable
              as String?,
      backdropPath: freezed == backdropPath
          ? _self.backdropPath
          : backdropPath // ignore: cast_nullable_to_non_nullable
              as String?,
      voteAverage: freezed == voteAverage
          ? _self.voteAverage
          : voteAverage // ignore: cast_nullable_to_non_nullable
              as double?,
      voteCount: freezed == voteCount
          ? _self.voteCount
          : voteCount // ignore: cast_nullable_to_non_nullable
              as int?,
      releaseDate: freezed == releaseDate
          ? _self.releaseDate
          : releaseDate // ignore: cast_nullable_to_non_nullable
              as String?,
      genreIds: freezed == genreIds
          ? _self._genreIds
          : genreIds // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      adult: freezed == adult
          ? _self.adult
          : adult // ignore: cast_nullable_to_non_nullable
              as bool?,
      originalLanguage: freezed == originalLanguage
          ? _self.originalLanguage
          : originalLanguage // ignore: cast_nullable_to_non_nullable
              as String?,
      originalTitle: freezed == originalTitle
          ? _self.originalTitle
          : originalTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      popularity: freezed == popularity
          ? _self.popularity
          : popularity // ignore: cast_nullable_to_non_nullable
              as double?,
      video: freezed == video
          ? _self.video
          : video // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

// dart format on
