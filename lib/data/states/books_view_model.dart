import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_app/data/store/books_store.dart';
import 'package:flutter_app/domain/entity/book.dart';
import 'package:flutter_app/domain/value_object/genre.dart';

enum BooksStateStatus { idle, unloaded, loading, updating }

sealed class BooksState {
  const BooksState();
}

final class BooksInitial extends BooksState {
  const BooksInitial();
}

final class BooksLoading extends BooksState {
  const BooksLoading();
}

final class BooksUpdating extends BooksState {
  final BookItemMap books;

  const BooksUpdating(this.books);
}

final class BooksLoaded extends BooksState {
  final BookItemMap books;

  const BooksLoaded(this.books);
}

final class BooksError extends BooksState {
  final Object error;
  final BookItemMap? previousBooks;

  const BooksError(this.error, {this.previousBooks});
}

class BooksViewModel extends ChangeNotifier {
  final BooksStore store;

  BooksViewModel._({required this.store});

  factory BooksViewModel({required BooksStore store}) {
    final booksVM = BooksViewModel._(store: store);
    booksVM.load();
    return booksVM;
  }

  BooksState _state = const BooksInitial();

  BooksState get state => _state;
  bool get isBusy => _state is BooksLoading || _state is BooksUpdating;
  bool get isLoaded => _state is BooksLoaded || _state is BooksUpdating;

  BookItem? getBook(String id) {
    if (isBusy || !isLoaded) return null;

    if (_state is BooksUpdating) {
      return (_state as BooksUpdating).books[id];
    }

    return (_state as BooksLoaded).books[id];
  }

  Future<bool> addBook({
    required String title,
    required String subtitle,
    required int year,
    required Set<Genre> genres,
    String? preview,
    String? description,
  }) async {
    if (state is! BooksLoaded) return false;

    final books = (_state as BooksLoaded).books;
    _setState(BooksUpdating(books));

    try {
      final newBook = await store.addBook(
        BookItemData(
          title: title,
          subtitle: subtitle,
          year: year,
          genres: genres,
          preview: preview,
          description: description,
        ),
        null,
      );

      final newBooks = UnmodifiableMapView(
        Map<String, BookItem>.from(books)..[newBook.id] = newBook,
      );

      _setState(BooksLoaded(newBooks));
      return true;
    } on Object catch (e) {
      _setState(BooksError(e, previousBooks: books));
      return false;
    }
  }

  Future<bool> refresh() async {
    if (state is! BooksLoaded) return false;

    final current = (_state as BooksLoaded).books;
    _setState(BooksUpdating(current));

    try {
      _setState(BooksLoaded(await _fetch()));
      return true;
    } on Object catch (e) {
      _setState(BooksError(e, previousBooks: current));
      return false;
    }
  }

  Future<bool> load() async {
    if (_state is! BooksInitial && _state is! BooksError) return false;

    _setState(const BooksLoading());
    try {
      _setState(BooksLoaded(await _fetch()));
      return true;
    } on Object catch (e) {
      _setState(BooksError(e));
      return false;
    }
  }

  void _setState(BooksState s) {
    _state = s;
    notifyListeners();
  }

  Future<BookItemMap> _fetch() async {
    final list = await store.fetchBooks();
    return UnmodifiableMapView(
      Map.fromEntries(list.map((b) => MapEntry(b.id, b))),
    );
  }
}
