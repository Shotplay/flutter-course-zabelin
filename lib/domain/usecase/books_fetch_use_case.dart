import 'package:flutter_app/domain/entity/book.dart';

class BooksFetchUseCase {
  final BooksRepository booksRepo;

  const BooksFetchUseCase({required this.booksRepo});

  Future<BooksMap> call() async {
    return booksRepo.fetchBooks();
  }
}
