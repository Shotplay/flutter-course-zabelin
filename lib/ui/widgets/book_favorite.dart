import 'package:flutter/material.dart';
import 'package:flutter_application_1/domain/entities/book.dart';

class BookFavorite extends StatelessWidget {
  final BookItem book;
  final BookItemTapLikeFunc onLikeTap;

  const new({super.key, required this.book, required this.onLikeTap});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      width: 28,
      height: 28,
      top: 6,
      left: 50,
      child: CircleAvatar(
        radius: 14,
        backgroundColor: Colors.white,
        child: IconButton(
          onPressed: () => onLikeTap(book),
          padding: const EdgeInsets.all(0),
          icon: Icon(
            book.isLike ? Icons.favorite : Icons.favorite_border,
            color: book.isLike ? Colors.red : Colors.grey,
            size: 16,
          ),
        ),
      ),
    );
  }
}
