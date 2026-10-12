import 'package:flutter/material.dart';
import 'package:flutter_application_1/domain/entities/book.dart';
import 'package:flutter_application_1/ui/widgets/book_card.dart';

class BookList extends StatelessWidget {
  final BookItemMap books;
  final ValueChanged<String> onLikeTap;
  final Set<String> likes;
  final bool isLikesVisible;

  const new({
    super.key,
    required this.books,
    required this.onLikeTap,
    required this.isLikesVisible,
    required this.likes,
  });

  @override
  Widget build(BuildContext context) {
    if (isLikesVisible && likes.isNotEmpty) {
      final liked = likes
          .where((id) => books[id] != null)
          .map((id) => books[id]!);

      return list(liked);
    }

    if (isLikesVisible) {
      return notFound();
    }

    return list(books.values);
  }

  Widget list(Iterable<BookItem> books) {
    return ListView.separated(
      padding: const EdgeInsets.all(16).copyWith(top: 4),
      itemCount: books.length,
      itemBuilder: (_, i) {
        var book = books.elementAt(i);
        return BookCard(
          book: book,
          onLikeTap: () => onLikeTap(book.id),
          isLike: likes.contains(book.id),
        );
      },
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
