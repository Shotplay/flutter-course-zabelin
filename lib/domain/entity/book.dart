import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app/domain/value_object/genre.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'book.freezed.dart';
part 'book.g.dart';

typedef BookItemMap = UnmodifiableMapView<String, BookItem>;

@freezed
sealed class BookItem with _$BookItem {
  const factory BookItem({required String id, required BookItemData data}) =
      _BookItem;
}

@freezed
sealed class BookItemData with _$BookItemData {
  const factory BookItemData({
    required String title,
    required String subtitle,
    required int year,
    @GenreConverter() required Set<Genre> genres,
    @Default(null) String? preview,
    @Default(null) String? description,
  }) = _BookItemData;

  factory BookItemData.fromJson(Map<String, dynamic> json) =>
      _$BookItemDataFromJson(json);

  factory BookItemData.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return BookItemData(
      preview: data['preview'],
      title: data['title'],
      subtitle: data['subtitle'],
      year: data['year'],
      description: data['description'],
      genres: (data['genres'] as List<dynamic>)
          .map((e) => Genre(e as String))
          .toSet(),
    );
  }
}
