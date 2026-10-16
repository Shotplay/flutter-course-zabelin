// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'book.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BookItem {

 String get id; String get previewSrc; String get name; String get author; int get year; Set<String> get genres; String? get description;
/// Create a copy of BookItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookItemCopyWith<BookItem> get copyWith => _$BookItemCopyWithImpl<BookItem>(this as BookItem, _$identity);

  /// Serializes this BookItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookItem&&(identical(other.id, id) || other.id == id)&&(identical(other.previewSrc, previewSrc) || other.previewSrc == previewSrc)&&(identical(other.name, name) || other.name == name)&&(identical(other.author, author) || other.author == author)&&(identical(other.year, year) || other.year == year)&&const DeepCollectionEquality().equals(other.genres, genres)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,previewSrc,name,author,year,const DeepCollectionEquality().hash(genres),description);

@override
String toString() {
  return 'BookItem(id: $id, previewSrc: $previewSrc, name: $name, author: $author, year: $year, genres: $genres, description: $description)';
}


}

/// @nodoc
abstract mixin class $BookItemCopyWith<$Res>  {
  factory $BookItemCopyWith(BookItem value, $Res Function(BookItem) _then) = _$BookItemCopyWithImpl;
@useResult
$Res call({
 String id, String previewSrc, String name, String author, int year, Set<String> genres, String? description
});




}
/// @nodoc
class _$BookItemCopyWithImpl<$Res>
    implements $BookItemCopyWith<$Res> {
  _$BookItemCopyWithImpl(this._self, this._then);

  final BookItem _self;
  final $Res Function(BookItem) _then;

/// Create a copy of BookItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? previewSrc = null,Object? name = null,Object? author = null,Object? year = null,Object? genres = null,Object? description = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,previewSrc: null == previewSrc ? _self.previewSrc : previewSrc // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,author: null == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as String,year: null == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as int,genres: null == genres ? _self.genres : genres // ignore: cast_nullable_to_non_nullable
as Set<String>,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [BookItem].
extension BookItemPatterns on BookItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BookItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BookItem() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BookItem value)  $default,){
final _that = this;
switch (_that) {
case _BookItem():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BookItem value)?  $default,){
final _that = this;
switch (_that) {
case _BookItem() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String previewSrc,  String name,  String author,  int year,  Set<String> genres,  String? description)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BookItem() when $default != null:
return $default(_that.id,_that.previewSrc,_that.name,_that.author,_that.year,_that.genres,_that.description);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String previewSrc,  String name,  String author,  int year,  Set<String> genres,  String? description)  $default,) {final _that = this;
switch (_that) {
case _BookItem():
return $default(_that.id,_that.previewSrc,_that.name,_that.author,_that.year,_that.genres,_that.description);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String previewSrc,  String name,  String author,  int year,  Set<String> genres,  String? description)?  $default,) {final _that = this;
switch (_that) {
case _BookItem() when $default != null:
return $default(_that.id,_that.previewSrc,_that.name,_that.author,_that.year,_that.genres,_that.description);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BookItem implements BookItem {
  const _BookItem({required this.id, required this.previewSrc, required this.name, required this.author, required this.year, required final  Set<String> genres, this.description = null}): _genres = genres;
  factory _BookItem.fromJson(Map<String, dynamic> json) => _$BookItemFromJson(json);

@override final  String id;
@override final  String previewSrc;
@override final  String name;
@override final  String author;
@override final  int year;
 final  Set<String> _genres;
@override Set<String> get genres {
  if (_genres is EqualUnmodifiableSetView) return _genres;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_genres);
}

@override@JsonKey() final  String? description;

/// Create a copy of BookItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookItemCopyWith<_BookItem> get copyWith => __$BookItemCopyWithImpl<_BookItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BookItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookItem&&(identical(other.id, id) || other.id == id)&&(identical(other.previewSrc, previewSrc) || other.previewSrc == previewSrc)&&(identical(other.name, name) || other.name == name)&&(identical(other.author, author) || other.author == author)&&(identical(other.year, year) || other.year == year)&&const DeepCollectionEquality().equals(other._genres, _genres)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,previewSrc,name,author,year,const DeepCollectionEquality().hash(_genres),description);

@override
String toString() {
  return 'BookItem(id: $id, previewSrc: $previewSrc, name: $name, author: $author, year: $year, genres: $genres, description: $description)';
}


}

/// @nodoc
abstract mixin class _$BookItemCopyWith<$Res> implements $BookItemCopyWith<$Res> {
  factory _$BookItemCopyWith(_BookItem value, $Res Function(_BookItem) _then) = __$BookItemCopyWithImpl;
@override @useResult
$Res call({
 String id, String previewSrc, String name, String author, int year, Set<String> genres, String? description
});




}
/// @nodoc
class __$BookItemCopyWithImpl<$Res>
    implements _$BookItemCopyWith<$Res> {
  __$BookItemCopyWithImpl(this._self, this._then);

  final _BookItem _self;
  final $Res Function(_BookItem) _then;

/// Create a copy of BookItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? previewSrc = null,Object? name = null,Object? author = null,Object? year = null,Object? genres = null,Object? description = freezed,}) {
  return _then(_BookItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,previewSrc: null == previewSrc ? _self.previewSrc : previewSrc // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,author: null == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as String,year: null == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as int,genres: null == genres ? _self._genres : genres // ignore: cast_nullable_to_non_nullable
as Set<String>,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
