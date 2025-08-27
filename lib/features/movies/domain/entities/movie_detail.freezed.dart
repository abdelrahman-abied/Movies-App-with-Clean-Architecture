// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movie_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MovieDetail {
  int get id;
  String get title;
  String? get overview;
  String? get posterPath;
  String? get backdropPath;
  double? get voteAverage;
  int? get voteCount;
  String? get releaseDate;
  List<Genre>? get genres;
  int? get runtime;
  int? get budget;
  int? get revenue;
  List<ProductionCompany>? get productionCompanies;
  String? get status;
  String? get tagline;
  bool? get adult;
  String? get originalLanguage;
  String? get originalTitle;
  double? get popularity;
  bool? get video;

  /// Create a copy of MovieDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MovieDetailCopyWith<MovieDetail> get copyWith =>
      _$MovieDetailCopyWithImpl<MovieDetail>(this as MovieDetail, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MovieDetail &&
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
            const DeepCollectionEquality().equals(other.genres, genres) &&
            (identical(other.runtime, runtime) || other.runtime == runtime) &&
            (identical(other.budget, budget) || other.budget == budget) &&
            (identical(other.revenue, revenue) || other.revenue == revenue) &&
            const DeepCollectionEquality()
                .equals(other.productionCompanies, productionCompanies) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.tagline, tagline) || other.tagline == tagline) &&
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
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        title,
        overview,
        posterPath,
        backdropPath,
        voteAverage,
        voteCount,
        releaseDate,
        const DeepCollectionEquality().hash(genres),
        runtime,
        budget,
        revenue,
        const DeepCollectionEquality().hash(productionCompanies),
        status,
        tagline,
        adult,
        originalLanguage,
        originalTitle,
        popularity,
        video
      ]);

  @override
  String toString() {
    return 'MovieDetail(id: $id, title: $title, overview: $overview, posterPath: $posterPath, backdropPath: $backdropPath, voteAverage: $voteAverage, voteCount: $voteCount, releaseDate: $releaseDate, genres: $genres, runtime: $runtime, budget: $budget, revenue: $revenue, productionCompanies: $productionCompanies, status: $status, tagline: $tagline, adult: $adult, originalLanguage: $originalLanguage, originalTitle: $originalTitle, popularity: $popularity, video: $video)';
  }
}

/// @nodoc
abstract mixin class $MovieDetailCopyWith<$Res> {
  factory $MovieDetailCopyWith(
          MovieDetail value, $Res Function(MovieDetail) _then) =
      _$MovieDetailCopyWithImpl;
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
      List<Genre>? genres,
      int? runtime,
      int? budget,
      int? revenue,
      List<ProductionCompany>? productionCompanies,
      String? status,
      String? tagline,
      bool? adult,
      String? originalLanguage,
      String? originalTitle,
      double? popularity,
      bool? video});
}

/// @nodoc
class _$MovieDetailCopyWithImpl<$Res> implements $MovieDetailCopyWith<$Res> {
  _$MovieDetailCopyWithImpl(this._self, this._then);

  final MovieDetail _self;
  final $Res Function(MovieDetail) _then;

  /// Create a copy of MovieDetail
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
    Object? genres = freezed,
    Object? runtime = freezed,
    Object? budget = freezed,
    Object? revenue = freezed,
    Object? productionCompanies = freezed,
    Object? status = freezed,
    Object? tagline = freezed,
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
      genres: freezed == genres
          ? _self.genres
          : genres // ignore: cast_nullable_to_non_nullable
              as List<Genre>?,
      runtime: freezed == runtime
          ? _self.runtime
          : runtime // ignore: cast_nullable_to_non_nullable
              as int?,
      budget: freezed == budget
          ? _self.budget
          : budget // ignore: cast_nullable_to_non_nullable
              as int?,
      revenue: freezed == revenue
          ? _self.revenue
          : revenue // ignore: cast_nullable_to_non_nullable
              as int?,
      productionCompanies: freezed == productionCompanies
          ? _self.productionCompanies
          : productionCompanies // ignore: cast_nullable_to_non_nullable
              as List<ProductionCompany>?,
      status: freezed == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      tagline: freezed == tagline
          ? _self.tagline
          : tagline // ignore: cast_nullable_to_non_nullable
              as String?,
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

/// Adds pattern-matching-related methods to [MovieDetail].
extension MovieDetailPatterns on MovieDetail {
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
    TResult Function(_MovieDetail value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MovieDetail() when $default != null:
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
    TResult Function(_MovieDetail value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MovieDetail():
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
    TResult? Function(_MovieDetail value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MovieDetail() when $default != null:
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
            List<Genre>? genres,
            int? runtime,
            int? budget,
            int? revenue,
            List<ProductionCompany>? productionCompanies,
            String? status,
            String? tagline,
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
      case _MovieDetail() when $default != null:
        return $default(
            _that.id,
            _that.title,
            _that.overview,
            _that.posterPath,
            _that.backdropPath,
            _that.voteAverage,
            _that.voteCount,
            _that.releaseDate,
            _that.genres,
            _that.runtime,
            _that.budget,
            _that.revenue,
            _that.productionCompanies,
            _that.status,
            _that.tagline,
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
            List<Genre>? genres,
            int? runtime,
            int? budget,
            int? revenue,
            List<ProductionCompany>? productionCompanies,
            String? status,
            String? tagline,
            bool? adult,
            String? originalLanguage,
            String? originalTitle,
            double? popularity,
            bool? video)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MovieDetail():
        return $default(
            _that.id,
            _that.title,
            _that.overview,
            _that.posterPath,
            _that.backdropPath,
            _that.voteAverage,
            _that.voteCount,
            _that.releaseDate,
            _that.genres,
            _that.runtime,
            _that.budget,
            _that.revenue,
            _that.productionCompanies,
            _that.status,
            _that.tagline,
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
            List<Genre>? genres,
            int? runtime,
            int? budget,
            int? revenue,
            List<ProductionCompany>? productionCompanies,
            String? status,
            String? tagline,
            bool? adult,
            String? originalLanguage,
            String? originalTitle,
            double? popularity,
            bool? video)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MovieDetail() when $default != null:
        return $default(
            _that.id,
            _that.title,
            _that.overview,
            _that.posterPath,
            _that.backdropPath,
            _that.voteAverage,
            _that.voteCount,
            _that.releaseDate,
            _that.genres,
            _that.runtime,
            _that.budget,
            _that.revenue,
            _that.productionCompanies,
            _that.status,
            _that.tagline,
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

class _MovieDetail extends MovieDetail {
  const _MovieDetail(
      {required this.id,
      required this.title,
      this.overview,
      this.posterPath,
      this.backdropPath,
      this.voteAverage,
      this.voteCount,
      this.releaseDate,
      final List<Genre>? genres,
      this.runtime,
      this.budget,
      this.revenue,
      final List<ProductionCompany>? productionCompanies,
      this.status,
      this.tagline,
      this.adult,
      this.originalLanguage,
      this.originalTitle,
      this.popularity,
      this.video})
      : _genres = genres,
        _productionCompanies = productionCompanies,
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
  final List<Genre>? _genres;
  @override
  List<Genre>? get genres {
    final value = _genres;
    if (value == null) return null;
    if (_genres is EqualUnmodifiableListView) return _genres;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final int? runtime;
  @override
  final int? budget;
  @override
  final int? revenue;
  final List<ProductionCompany>? _productionCompanies;
  @override
  List<ProductionCompany>? get productionCompanies {
    final value = _productionCompanies;
    if (value == null) return null;
    if (_productionCompanies is EqualUnmodifiableListView)
      return _productionCompanies;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? status;
  @override
  final String? tagline;
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

  /// Create a copy of MovieDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MovieDetailCopyWith<_MovieDetail> get copyWith =>
      __$MovieDetailCopyWithImpl<_MovieDetail>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MovieDetail &&
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
            const DeepCollectionEquality().equals(other._genres, _genres) &&
            (identical(other.runtime, runtime) || other.runtime == runtime) &&
            (identical(other.budget, budget) || other.budget == budget) &&
            (identical(other.revenue, revenue) || other.revenue == revenue) &&
            const DeepCollectionEquality()
                .equals(other._productionCompanies, _productionCompanies) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.tagline, tagline) || other.tagline == tagline) &&
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
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        title,
        overview,
        posterPath,
        backdropPath,
        voteAverage,
        voteCount,
        releaseDate,
        const DeepCollectionEquality().hash(_genres),
        runtime,
        budget,
        revenue,
        const DeepCollectionEquality().hash(_productionCompanies),
        status,
        tagline,
        adult,
        originalLanguage,
        originalTitle,
        popularity,
        video
      ]);

  @override
  String toString() {
    return 'MovieDetail(id: $id, title: $title, overview: $overview, posterPath: $posterPath, backdropPath: $backdropPath, voteAverage: $voteAverage, voteCount: $voteCount, releaseDate: $releaseDate, genres: $genres, runtime: $runtime, budget: $budget, revenue: $revenue, productionCompanies: $productionCompanies, status: $status, tagline: $tagline, adult: $adult, originalLanguage: $originalLanguage, originalTitle: $originalTitle, popularity: $popularity, video: $video)';
  }
}

/// @nodoc
abstract mixin class _$MovieDetailCopyWith<$Res>
    implements $MovieDetailCopyWith<$Res> {
  factory _$MovieDetailCopyWith(
          _MovieDetail value, $Res Function(_MovieDetail) _then) =
      __$MovieDetailCopyWithImpl;
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
      List<Genre>? genres,
      int? runtime,
      int? budget,
      int? revenue,
      List<ProductionCompany>? productionCompanies,
      String? status,
      String? tagline,
      bool? adult,
      String? originalLanguage,
      String? originalTitle,
      double? popularity,
      bool? video});
}

/// @nodoc
class __$MovieDetailCopyWithImpl<$Res> implements _$MovieDetailCopyWith<$Res> {
  __$MovieDetailCopyWithImpl(this._self, this._then);

  final _MovieDetail _self;
  final $Res Function(_MovieDetail) _then;

  /// Create a copy of MovieDetail
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
    Object? genres = freezed,
    Object? runtime = freezed,
    Object? budget = freezed,
    Object? revenue = freezed,
    Object? productionCompanies = freezed,
    Object? status = freezed,
    Object? tagline = freezed,
    Object? adult = freezed,
    Object? originalLanguage = freezed,
    Object? originalTitle = freezed,
    Object? popularity = freezed,
    Object? video = freezed,
  }) {
    return _then(_MovieDetail(
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
      genres: freezed == genres
          ? _self._genres
          : genres // ignore: cast_nullable_to_non_nullable
              as List<Genre>?,
      runtime: freezed == runtime
          ? _self.runtime
          : runtime // ignore: cast_nullable_to_non_nullable
              as int?,
      budget: freezed == budget
          ? _self.budget
          : budget // ignore: cast_nullable_to_non_nullable
              as int?,
      revenue: freezed == revenue
          ? _self.revenue
          : revenue // ignore: cast_nullable_to_non_nullable
              as int?,
      productionCompanies: freezed == productionCompanies
          ? _self._productionCompanies
          : productionCompanies // ignore: cast_nullable_to_non_nullable
              as List<ProductionCompany>?,
      status: freezed == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      tagline: freezed == tagline
          ? _self.tagline
          : tagline // ignore: cast_nullable_to_non_nullable
              as String?,
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

/// @nodoc
mixin _$Genre {
  int get id;
  String get name;

  /// Create a copy of Genre
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GenreCopyWith<Genre> get copyWith =>
      _$GenreCopyWithImpl<Genre>(this as Genre, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Genre &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @override
  String toString() {
    return 'Genre(id: $id, name: $name)';
  }
}

/// @nodoc
abstract mixin class $GenreCopyWith<$Res> {
  factory $GenreCopyWith(Genre value, $Res Function(Genre) _then) =
      _$GenreCopyWithImpl;
  @useResult
  $Res call({int id, String name});
}

/// @nodoc
class _$GenreCopyWithImpl<$Res> implements $GenreCopyWith<$Res> {
  _$GenreCopyWithImpl(this._self, this._then);

  final Genre _self;
  final $Res Function(Genre) _then;

  /// Create a copy of Genre
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [Genre].
extension GenrePatterns on Genre {
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
    TResult Function(_Genre value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Genre() when $default != null:
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
    TResult Function(_Genre value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Genre():
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
    TResult? Function(_Genre value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Genre() when $default != null:
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
    TResult Function(int id, String name)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Genre() when $default != null:
        return $default(_that.id, _that.name);
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
    TResult Function(int id, String name) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Genre():
        return $default(_that.id, _that.name);
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
    TResult? Function(int id, String name)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Genre() when $default != null:
        return $default(_that.id, _that.name);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Genre implements Genre {
  const _Genre({required this.id, required this.name});

  @override
  final int id;
  @override
  final String name;

  /// Create a copy of Genre
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$GenreCopyWith<_Genre> get copyWith =>
      __$GenreCopyWithImpl<_Genre>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Genre &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @override
  String toString() {
    return 'Genre(id: $id, name: $name)';
  }
}

/// @nodoc
abstract mixin class _$GenreCopyWith<$Res> implements $GenreCopyWith<$Res> {
  factory _$GenreCopyWith(_Genre value, $Res Function(_Genre) _then) =
      __$GenreCopyWithImpl;
  @override
  @useResult
  $Res call({int id, String name});
}

/// @nodoc
class __$GenreCopyWithImpl<$Res> implements _$GenreCopyWith<$Res> {
  __$GenreCopyWithImpl(this._self, this._then);

  final _Genre _self;
  final $Res Function(_Genre) _then;

  /// Create a copy of Genre
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_Genre(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$ProductionCompany {
  int get id;
  String get name;
  String? get logoPath;
  String? get originCountry;

  /// Create a copy of ProductionCompany
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProductionCompanyCopyWith<ProductionCompany> get copyWith =>
      _$ProductionCompanyCopyWithImpl<ProductionCompany>(
          this as ProductionCompany, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProductionCompany &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.logoPath, logoPath) ||
                other.logoPath == logoPath) &&
            (identical(other.originCountry, originCountry) ||
                other.originCountry == originCountry));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, logoPath, originCountry);

  @override
  String toString() {
    return 'ProductionCompany(id: $id, name: $name, logoPath: $logoPath, originCountry: $originCountry)';
  }
}

/// @nodoc
abstract mixin class $ProductionCompanyCopyWith<$Res> {
  factory $ProductionCompanyCopyWith(
          ProductionCompany value, $Res Function(ProductionCompany) _then) =
      _$ProductionCompanyCopyWithImpl;
  @useResult
  $Res call({int id, String name, String? logoPath, String? originCountry});
}

/// @nodoc
class _$ProductionCompanyCopyWithImpl<$Res>
    implements $ProductionCompanyCopyWith<$Res> {
  _$ProductionCompanyCopyWithImpl(this._self, this._then);

  final ProductionCompany _self;
  final $Res Function(ProductionCompany) _then;

  /// Create a copy of ProductionCompany
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? logoPath = freezed,
    Object? originCountry = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      logoPath: freezed == logoPath
          ? _self.logoPath
          : logoPath // ignore: cast_nullable_to_non_nullable
              as String?,
      originCountry: freezed == originCountry
          ? _self.originCountry
          : originCountry // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [ProductionCompany].
extension ProductionCompanyPatterns on ProductionCompany {
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
    TResult Function(_ProductionCompany value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ProductionCompany() when $default != null:
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
    TResult Function(_ProductionCompany value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProductionCompany():
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
    TResult? Function(_ProductionCompany value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProductionCompany() when $default != null:
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
            int id, String name, String? logoPath, String? originCountry)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ProductionCompany() when $default != null:
        return $default(
            _that.id, _that.name, _that.logoPath, _that.originCountry);
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
            int id, String name, String? logoPath, String? originCountry)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProductionCompany():
        return $default(
            _that.id, _that.name, _that.logoPath, _that.originCountry);
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
            int id, String name, String? logoPath, String? originCountry)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProductionCompany() when $default != null:
        return $default(
            _that.id, _that.name, _that.logoPath, _that.originCountry);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ProductionCompany implements ProductionCompany {
  const _ProductionCompany(
      {required this.id,
      required this.name,
      this.logoPath,
      this.originCountry});

  @override
  final int id;
  @override
  final String name;
  @override
  final String? logoPath;
  @override
  final String? originCountry;

  /// Create a copy of ProductionCompany
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ProductionCompanyCopyWith<_ProductionCompany> get copyWith =>
      __$ProductionCompanyCopyWithImpl<_ProductionCompany>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ProductionCompany &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.logoPath, logoPath) ||
                other.logoPath == logoPath) &&
            (identical(other.originCountry, originCountry) ||
                other.originCountry == originCountry));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, logoPath, originCountry);

  @override
  String toString() {
    return 'ProductionCompany(id: $id, name: $name, logoPath: $logoPath, originCountry: $originCountry)';
  }
}

/// @nodoc
abstract mixin class _$ProductionCompanyCopyWith<$Res>
    implements $ProductionCompanyCopyWith<$Res> {
  factory _$ProductionCompanyCopyWith(
          _ProductionCompany value, $Res Function(_ProductionCompany) _then) =
      __$ProductionCompanyCopyWithImpl;
  @override
  @useResult
  $Res call({int id, String name, String? logoPath, String? originCountry});
}

/// @nodoc
class __$ProductionCompanyCopyWithImpl<$Res>
    implements _$ProductionCompanyCopyWith<$Res> {
  __$ProductionCompanyCopyWithImpl(this._self, this._then);

  final _ProductionCompany _self;
  final $Res Function(_ProductionCompany) _then;

  /// Create a copy of ProductionCompany
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? logoPath = freezed,
    Object? originCountry = freezed,
  }) {
    return _then(_ProductionCompany(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      logoPath: freezed == logoPath
          ? _self.logoPath
          : logoPath // ignore: cast_nullable_to_non_nullable
              as String?,
      originCountry: freezed == originCountry
          ? _self.originCountry
          : originCountry // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
