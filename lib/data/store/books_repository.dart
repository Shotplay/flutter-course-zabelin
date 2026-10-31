import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app/domain/entity/book.dart';

class BooksFirebaseRepository implements BooksRepository {
  BooksFirebaseRepository();

  final _db = FirebaseFirestore.instance;
  final Map<String, Book> _cache = {};
  CollectionReference get _booksRef => _db.collection('books');

  @override
  Future<Book> getBook(String id) async {
    if (_cache.containsKey(id)) return _cache[id]!;

    return fetchBook(id);
  }

  @override
  Future<BooksMap> getBooks() async {
    if (_cache.isNotEmpty) return UnmodifiableMapView(_cache);

    return fetchBooks();
  }

  @override
  Future<Book> addBook(Book book) async {
    await _booksRef.doc(book.id).set(book.toJson());
    return fetchBook(book.id);
  }

  @override
  Future<Book> fetchBook(String id) async {
    final book = Book.fromFirestore(await _booksRef.doc(id).get());
    _cache[id] = book;
    return book;
  }

  @override
  Future<BooksMap> fetchBooks() async {
    final snapshot = await _booksRef.get();

    if (snapshot.docs.isEmpty) return UnmodifiableMapView({}) as BooksMap;

    final books = snapshot.docs.map((doc) => Book.fromFirestore(doc));
    final map = Map<String, Book>.fromIterable(
      books,
      key: (b) => b.id as String,
    );

    _cache.addAll(map);
    return UnmodifiableMapView(map);
  }
}
