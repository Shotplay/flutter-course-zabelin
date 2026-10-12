import 'package:flutter/material.dart';
import 'package:flutter_app/domain/entities/book.dart';
import 'package:flutter_app/ui/widgets/book_info.dart';
import 'package:flutter_app/ui/widgets/book_preview.dart';

class BookCard extends StatelessWidget {
  final BookItem book;

  const BookCard({
    super.key,
    required this.book,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 358,
      decoration: const BoxDecoration(
        border: BoxBorder.fromBorderSide(
          BorderSide(color: Color(0xFFECE8E1), width: 1),
        ),
        borderRadius: BorderRadius.all(Radius.circular(16)),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 12,
          children: [
            BookPreview(bookId: book.id, previewSrc: book.previewSrc),
            BookInfo.fromBook(book),
          ],
        ),
      ),
    );
  }
}
