import 'package:flutter_app/domain/entity/book.dart';

class BooksLoadUseCase {
  final BooksRepository booksRepo;

  const BooksLoadUseCase({required this.booksRepo});

  Future<BooksMap> call() async {
    return await booksRepo.getBooks();
  }
}
