import 'package:flutter/material.dart';
import 'package:flutter_app/data/store/books_store.dart';
import 'package:flutter_app/data/store/user_store.dart';
import 'package:flutter_app/domain/entities/book.dart';
import 'package:flutter_app/ui/widgets/book_card.dart';
import 'package:provider/provider.dart';

class BookList extends StatelessWidget {
  final bool isLikesVisible;

  const BookList({super.key, required this.isLikesVisible});

  @override
  Widget build(BuildContext context) {
    if (isLikesVisible) {
      final likes = context.select<UserStore, Set<String>>((s) => s.likes);
      if (likes.isEmpty) return notFound();

      final booksStore = context.read<BooksStore>();
      final liked = likes
          .where((id) => booksStore.has(id))
          .map((id) => booksStore.getBook(id)!)
          .toList();

      return list(liked);
    }

    return list(context.read<BooksStore>().books.values.toList());
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
