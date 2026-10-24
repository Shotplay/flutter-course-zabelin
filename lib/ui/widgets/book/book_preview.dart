import 'package:chroma_kit/chroma_kit.dart';
import 'package:flutter/material.dart';
import 'book_favorite.dart';

enum BookPreviewStyle { thumbnail, cover }

class BookPreview extends StatelessWidget {
  final String bookId;
  final String? src;
  final BookPreviewStyle style;
  final String titleInitial;

  const BookPreview({
    super.key,
    required this.bookId,
    required this.titleInitial,
    this.src,
    this.style = BookPreviewStyle.thumbnail,
  });

  @override
  Widget build(BuildContext context) {
    final image = _Image(src: src, titleInitial: titleInitial);

    if (style == BookPreviewStyle.thumbnail) {
      return _AsCard(image: image, bookId: bookId);
    }

    return Container(
      height: 320,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(20)),
        boxShadow: [BoxShadow(spreadRadius: 1)],
      ),
      clipBehavior: Clip.antiAlias,
      child: image,
    );
  }
}

class _AsCard extends StatelessWidget {
  final String bookId;
  final Widget image;

  const _AsCard({required this.bookId, required this.image});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 88,
          height: 130,
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            boxShadow: [BoxShadow(spreadRadius: 1)],
          ),
          child: image,
        ),
        Positioned(
          top: 6,
          left: 54,
          child: BookFavorite(bookId: bookId, iconSize: 18, showBorder: false),
        ),
      ],
    );
  }
}

class _Image extends StatelessWidget {
  final String? src;
  final String titleInitial;

  const _Image({required this.src, required this.titleInitial});

  @override
  Widget build(BuildContext context) {
    if (src == null || src == "") {
      return ColoredBox(
        color: ChromaKitUtils.avatarColor(titleInitial),
        child: Center(
          child: Text(
            titleInitial,
            style: TextStyle(color: Colors.white.withAlpha(55), fontSize: 48),
          ),
        ),
      );
    }

    return Image.asset(
      src!,
      fit: BoxFit.cover,
      width: double.infinity,
      height: double.infinity,
    );
  }
}
