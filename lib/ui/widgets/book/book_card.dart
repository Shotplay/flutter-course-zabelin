import 'package:flutter/material.dart';
import 'package:flutter_app/domain/entity/book.dart';
import 'package:flutter_app/router/app_router.dart';
import 'package:flutter_app/ui/theme/brand_colors.dart';
import 'book_info.dart';
import 'book_preview.dart';

class BookCard extends StatelessWidget {
  final Book book;

  const BookCard({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: context.brandColors.cardBackgroundColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: InkWell(
        onTap: () => BookInfoRoute(bookId: book.id).go(context),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            spacing: 12,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BookPreview(
                bookId: book.id,
                titleInitial: book.title[0],
                src: book.preview,
              ),
              Expanded(
                child: BookInfo(
                  title: book.title,
                  subtitle: book.subtitle,
                  year: book.year,
                  genres: book.genres,
                  titleMaxLines: 2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
