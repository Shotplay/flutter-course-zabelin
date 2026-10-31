import 'package:flutter_app/domain/entity/book.dart';

class BookAddUseCase {
  final BooksRepository booksRepo;

  const BookAddUseCase({required this.booksRepo});

  Future<BooksMap> call(Book book) async {
    await booksRepo.addBook(book);
    return await booksRepo.fetchBooks();
  }
}
