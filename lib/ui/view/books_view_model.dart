import 'package:flutter/foundation.dart';
import 'package:flutter_app/data/store/books_store.dart';
import 'package:flutter_app/domain/entities/book.dart';

class BooksViewModel extends ChangeNotifier {
  final BooksStore store;

  BookItemMap _books = const {};
  BooksViewModelState _state = BooksViewModelState.none;
  bool _isLoaded = false;
  String? _error;

  BooksViewModel({required this.store});

  @override
  void dispose() {
    _state = BooksViewModelState.disposed;
    super.dispose();
  }

  BookItemMap get books => Map.unmodifiable(_books);
  BooksViewModelState get state => _state;
  bool get isBusy => _state != BooksViewModelState.none;
  bool get isLoaded => _isLoaded;
  bool get isDisposed => _state == BooksViewModelState.disposed;
  String? get error => _error;
  int get count => _books.length;

  List<BookItem> toListValues() => _books.values.toList();
  bool hasBook(String bookId) => _books.containsKey(bookId);
  BookItem? getBook(String bookId) => _books[bookId];

  Future<bool> addBook(BookItem book) async {
    if (isBusy) return false;
    _state = BooksViewModelState.addingBook;
    _error = null;

    _books[book.id] = book;
    notifyListeners();

    try {
      final success = await store.addBook(book);
      if (!success) _books.remove(book.id);
      return success;
    } catch (e) {
      _books.remove(book.id);
      _error = e.toString();
      return false;
    } finally {
      if (!isDisposed) {
        _state = BooksViewModelState.none;
        notifyListeners();
      }
    }
  }

  Future<bool> refresh() async {
    if (isBusy) return false;
    _state = BooksViewModelState.refreshing;
    _error = null;
    notifyListeners();

    return await _load();
  }

  Future<bool> load() async {
    if (isBusy) return false;
    _state = BooksViewModelState.loading;
    _error = null;

    return await _load();
  }

  Future<bool> _load() async {
    try {
      final books = await store.fetchBooks();
      _books = Map.fromIterable(books, key: (b) => b.id);
      _isLoaded = true;
      return true;
    } catch (e) {
      _error = e.toString();
      return false;
    } finally {
      if (!isDisposed) {
        _state = BooksViewModelState.none;
        notifyListeners();
      }
    }
  }
}
