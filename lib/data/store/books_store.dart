import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app/domain/entity/book.dart';

class BooksStore {
  BooksStore();

  final _db = FirebaseFirestore.instance;

  CollectionReference get _booksRef => _db.collection('books');

  Future<List<BookItem>> fetchBooks() async {
    final snapshot = await _booksRef.get();

    if (snapshot.docs.isEmpty) {
      return const [];
    }

    return snapshot.docs
        .map(
          (doc) => BookItem(id: doc.id, data: BookItemData.fromFirestore(doc)),
        )
        .toList();
  }

  Future<BookItem> addBook(BookItemData book, String? id) async {
    final doc = _booksRef.doc(id);
    await doc.set(book.toJson());
    return BookItem(id: doc.id, data: book);
  }
}
