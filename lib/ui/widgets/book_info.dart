import 'package:flutter/material.dart';
import 'package:flutter_app/domain/entities/book.dart';
import 'package:flutter_app/ui/widgets/book_genre.dart';

class BookInfo extends StatelessWidget {
  final String name;
  final String author;
  final int year;
  final Set<String> genres;
  final String? description;

  const BookInfo({
    super.key,
    required this.name,
    required this.author,
    required this.year,
    required this.genres,
    required this.description,
  });

  factory BookInfo.fromBook(BookItem book) {
    return BookInfo(
      name: book.name,
      author: book.author,
      year: book.year,
      genres: book.genres,
      description: book.description,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        spacing: 2,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [_name(), _author(), _genres(), _description()],
      ),
    );
  }

  Text _name() {
    return Text(
      name,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
    );
  }

  Text _author() {
    return Text(
      "$author · $year",
      style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 13),
    );
  }

  Widget _description() {
    return Text(
      description ?? "У книги пока не добавлено описание...",
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
    );
  }

  Widget _genres() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        spacing: 9,
        children: genres.map((g) => BookGenre(g)).toList(),
      ),
    );
  }
}
