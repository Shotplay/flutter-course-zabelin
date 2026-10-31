import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app/domain/value_object/genre.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'book.freezed.dart';
part 'book.g.dart';

typedef BooksMap = UnmodifiableMapView<String, Book>;

abstract class BooksRepository {
  Future<BooksMap> getBooks();
  Future<Book> getBook(String id);

  Future<Book> addBook(Book book);

  Future<BooksMap> fetchBooks();
  Future<Book> fetchBook(String id);
}

sealed class BooksState {
  const BooksState();
}

class BooksInitialState extends BooksState {
  const BooksInitialState();
}

class BooksLoadingState extends BooksState {
  const BooksLoadingState();
}

class BooksLoadedState extends BooksState {
  final BooksMap books;

  const BooksLoadedState(this.books);
}

class BooksFailureState extends BooksState {
  final Object? error;

  const BooksFailureState(this.error);
}

@freezed
sealed class Book with _$Book {
  const factory Book({
    required String id,
    required String title,
    required String subtitle,
    required int year,
    @GenreConverter() required Set<Genre> genres,
    @Default(null) String? preview,
    @Default(null) String? description,
  }) = _Book;

  factory Book.fromJson(Map<String, dynamic> json) => _$BookFromJson(json);

  factory Book.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;

    return Book(
      id: doc.id,
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
