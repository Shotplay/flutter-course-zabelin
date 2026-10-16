import 'package:flutter/material.dart';
import 'package:flutter_app/data/user_session.dart';
import 'package:flutter_app/data/view/books_view_model.dart';
import 'package:flutter_app/domain/entities/book.dart';
import 'package:flutter_app/ui/widgets/book/book_card.dart';
import 'package:provider/provider.dart';

class BookList extends StatelessWidget {
  final bool isLikesVisible;

  const BookList({super.key, required this.isLikesVisible});

  @override
  Widget build(BuildContext context) {
    if (isLikesVisible) {
      return Selector<UserSession, Set<String>>(
        selector: (_, userSession) => userSession.likes,
        builder: (_, likes, _) {
          if (likes.isEmpty) return notFound();

          final booksVM = context.read<BooksViewModel>();
          final liked = likes
              .where((id) => booksVM.hasBook(id))
              .map((id) => booksVM.getBook(id)!)
              .toList();
          return list(liked);
        },
      );
    }

    return Selector<BooksViewModel, List<BookItem>>(
      selector: (_, booksVM) => booksVM.toListValues(),
      builder: (_, books, _) => list(books),
    );
  }

  Widget list(List<BookItem> books) {
    return ListView.separated(
      padding: const EdgeInsets.all(16).copyWith(top: 4),
      itemCount: books.length,
      itemBuilder: (_, i) => BookCard(book: books.elementAt(i)),
      separatorBuilder: (_, _) => const SizedBox(height: 12),
    );
  }

  Widget notFound() {
    return const Padding(
      padding: EdgeInsets.only(top: 4, right: 16, bottom: 16, left: 16),
      child: Align(
        alignment: Alignment.topCenter,
        child: DecoratedBox(
          decoration: BoxDecoration(
            border: Border.fromBorderSide(
              BorderSide(color: Colors.white, width: 1),
            ),
            borderRadius: BorderRadius.all(Radius.circular(16)),
            color: Colors.white,
          ),
          child: Padding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 12, vertical: 6),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              spacing: 8,
              children: [
                Text(
                  "Ничего не нашлось...",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 24),
                ),
                Icon(Icons.sentiment_dissatisfied, size: 36),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
