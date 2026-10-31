import 'package:flutter_app/domain/entity/book.dart';

class BookLoadUseCase {
  final BooksRepository booksRepo;

  const BookLoadUseCase({required this.booksRepo});

  Future<Book> call(String id) async {
    return await booksRepo.getBook(id);
  }
}
