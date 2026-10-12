import 'package:flutter/material.dart';
import 'package:flutter_application_1/domain/entities/book.dart';
import 'package:flutter_application_1/ui/widgets/book_info.dart';
import 'package:flutter_application_1/ui/widgets/book_preview.dart';

class BookCard extends StatelessWidget {
  final BookItem book;
  final VoidCallback onLikeTap;
  final bool isLike;

  const new({
    super.key,
    required this.book,
    required this.onLikeTap,
    required this.isLike,
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
            BookPreview(book: book, onLikeTap: onLikeTap, isLike: isLike),
            BookInfo(book: book),
          ],
        ),
      ),
    );
  }
}
