import 'package:flutter/material.dart';
import 'package:flutter_app/data/view/books_view_model.dart';
import 'package:flutter_app/ui/widgets/book/book_favorite.dart';
import 'package:provider/provider.dart';
import 'package:string_to_color/string_to_color.dart';

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
        _preview(),
        BookFavorite(bookId: bookId),
      ],
    );
  }

  Widget _preview() {
    return Container(
      width: 88,
      height: 120,
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        boxShadow: [BoxShadow(color: Colors.black, spreadRadius: 1)],
      ),
      child: _image(),
    );
  }

  Widget _image() {
    return Image.asset(
      previewSrc,
      fit: BoxFit.cover,
      errorBuilder: (context, _, _) {
        final book = context.read<BooksViewModel>().getBook(bookId);
        if (book == null) return const Placeholder();

        return DecoratedBox(
          decoration: BoxDecoration(
            color: ColorUtils.stringToColor(book.name[0]),
          ),
          child: Center(
            child: Text(
              book.name[0],
              style: const TextStyle(fontSize: 32, color: Colors.white),
            ),
          ),
        );
      },
    );
  }
}
