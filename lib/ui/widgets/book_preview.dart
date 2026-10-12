import 'package:flutter/material.dart';
import 'package:flutter_app/ui/widgets/book_favorite.dart';

class BookPreview extends StatelessWidget {
  final String bookId;
  final String previewSrc;

  const BookPreview({
    super.key,
    required this.bookId,
    required this.previewSrc,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        image(),
        BookFavorite(bookId: bookId),
      ],
    );
  }

  Widget image() {
    return Container(
      width: 88,
      height: 120,
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        boxShadow: [
          BoxShadow(color: Colors.black, spreadRadius: 0.4, blurRadius: 1),
        ],
      ),
      child: Image.asset(previewSrc, fit: BoxFit.cover),
    );
  }
}
