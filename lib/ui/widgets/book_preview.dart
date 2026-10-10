import 'package:flutter/material.dart';
import 'package:flutter_application_1/domain/entities/book.dart';
import 'package:flutter_application_1/ui/widgets/book_favorite.dart';

class BookPreview extends StatelessWidget {
  final BookItem book;
  final BookItemTapLikeFunc onLikeTap;

  const new({super.key, required this.book, required this.onLikeTap});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        image(),
        BookFavorite(book: book, onLikeTap: onLikeTap),
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
      child: Image.asset(book.previewSrc, fit: BoxFit.cover),
    );
  }
}
