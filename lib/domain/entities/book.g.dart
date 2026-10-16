// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BookItem _$BookItemFromJson(Map<String, dynamic> json) => _BookItem(
  id: json['id'] as String,
  previewSrc: json['previewSrc'] as String,
  name: json['name'] as String,
  author: json['author'] as String,
  year: (json['year'] as num).toInt(),
  genres: (json['genres'] as List<dynamic>).map((e) => e as String).toSet(),
  description: json['description'] as String? ?? null,
);

Map<String, dynamic> _$BookItemToJson(_BookItem instance) => <String, dynamic>{
  'id': instance.id,
  'previewSrc': instance.previewSrc,
  'name': instance.name,
  'author': instance.author,
  'year': instance.year,
  'genres': instance.genres.toList(),
  'description': instance.description,
};
