import 'package:flutter/material.dart';
import 'package:flutter_app/data/states/books_view_model.dart';
import 'package:flutter_app/domain/entity/book.dart';
import 'package:flutter_app/router/app_router.dart';
import 'package:flutter_app/ui/widgets/book/book_favorite.dart';
import 'package:flutter_app/ui/widgets/book/book_info.dart';
import 'package:flutter_app/ui/widgets/book/book_preview.dart';
import 'package:flutter_app/ui/widgets/styled_back_button.dart';
import 'package:flutter_app/utils/theme.dart';
import 'package:provider/provider.dart';

class BookInfoScreen extends StatelessWidget {
  final String bookId;

  const BookInfoScreen({super.key, required this.bookId});

  @override
  Widget build(BuildContext context) {
    final book = context.select<BooksViewModel, BookItem?>(
      (p) => p.getBook(bookId),
    );

    if (book == null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (context.mounted) CatalogRoute().go(context);
      });

      return const SizedBox.shrink();
    }

    return Scaffold(
      appBar: _AppBar(bookId: bookId),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(top: 1),
          child: Column(
            spacing: 16,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BookPreview(
                bookId: bookId,
                titleInitial: book.data.title[0],
                src: book.data.preview,
                style: BookPreviewStyle.cover,
              ),
              BookInfo(
                title: book.data.title,
                subtitle: book.data.subtitle,
                year: book.data.year,
                genres: book.data.genres,
              ),
              Text("Описание", style: context.theme.textTheme.headlineMedium),
              Text(
                book.data.description ?? "У книги нет описания...",
                style: context.theme.textTheme.bodyLarge,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AppBar extends AppBar {
  _AppBar({required String bookId})
    : super(
        titleSpacing: 0,
        toolbarHeight: 96,
        title: Padding(
          padding: const EdgeInsets.only(
            top: 44,
            right: 16,
            bottom: 12,
            left: 16,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              StyledBackButton(fallbackRoute: CatalogRoute()),
              BookFavorite(bookId: bookId, iconSize: 25),
            ],
          ),
        ),
      );
}
