import 'package:flutter/material.dart';
import 'package:flutter_application_1/domain/entities/book.dart';
import 'package:flutter_application_1/ui/widgets/book_list.dart';
import 'package:flutter_application_1/ui/widgets/catalog_app_bar.dart';

class CatalogScreen extends StatefulWidget {
  final BookItemMap books;

  const new({super.key, required this.books});

  @override
  State<CatalogScreen> createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  late final BookItemMap _books;

  final Set<String> _likedIds = {};
  bool _isLikesVisible = false;

  @override
  void initState() {
    super.initState();
    _books = widget.books;
    _likedIds.addAll(
      _books.entries.where((b) => b.value.isLike).map((b) => b.key),
    );
  }

  void _onLikeTap(BookItem book) {
    final savedBook = _books[book.id];
    if (savedBook == null) return;

    bool newLike = !(savedBook.isLike);

    setState(() {
      _books[book.id] = savedBook.copyWith(isLike: newLike);

      if (newLike) {
        _likedIds.add(book.id);
      } else {
        _likedIds.remove(book.id);
      }

      print("Change book like. like=$newLike id=${book.id}");
    });
  }

  void _onLikeVisibleTap() {
    setState(() {
      _isLikesVisible = !_isLikesVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CatalogAppBar(
        books: _books,
        onLikeVisibleTap: _onLikeVisibleTap,
        isLikesVisible: _isLikesVisible,
        likedIds: _likedIds,
      ),
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(color: Color(0xFFF2F2F2)),
          child: BookList(
            books: _books,
            onLikeTap: _onLikeTap,
            isLikesVisible: _isLikesVisible,
            likedIds: _likedIds,
          ),
        ),
      ),
    );
  }
}
