import 'package:flutter/foundation.dart';
import 'package:flutter_app/domain/entities/book.dart';

class BooksStore extends ChangeNotifier {
  final BookItemMap _books;

  BooksStore({required BookItemMap books}) : _books = {...books};

  BookItemMap get books => Map.unmodifiable(_books);
  int get booksCount => _books.length;
  bool has(String bookId) => _books.containsKey(bookId);

  BookItem? getBook(String bookId) => _books[bookId];
  void addBook(BookItem book) => _books[book.id] = book;
  BookItem? removeBook(String bookId) => _books.remove(bookId);
}
