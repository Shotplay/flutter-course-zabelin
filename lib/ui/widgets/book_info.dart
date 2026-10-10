import 'package:flutter/material.dart';
import 'package:flutter_application_1/domain/entities/book.dart';
import 'package:flutter_application_1/ui/widgets/book_genre.dart';

class BookInfo extends StatelessWidget {
  final BookItem book;

  const new({super.key, required this.book});

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
      book.name,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
    );
  }

  Text _author() {
    return Text(
      "${book.author} · ${book.year}",
      style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 13),
    );
  }

  Widget _description() {
    return Text(
      book.description ?? "У книги нет описания...",
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(fontWeight: .w400, fontSize: 14),
    );
  }

  SingleChildScrollView _genres() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        spacing: 9,
        children: book.genres.map((g) => BookGenre(g)).toList(),
      ),
    );
  }
}
