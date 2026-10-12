import 'package:flutter/material.dart';
import 'package:flutter_application_1/domain/entities/book.dart';
import 'package:flutter_application_1/domain/entities/user.dart';
import 'package:flutter_application_1/ui/widgets/book_list.dart';
import 'package:flutter_application_1/ui/widgets/catalog_app_bar.dart';

class CatalogScreen extends StatefulWidget {
  final BookItemMap books;
  final User user;

  const new({super.key, required this.books, required this.user});

  @override
  State<CatalogScreen> createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  late final BookItemMap _books;
  late User _user;
  bool _isLikesVisible = false;

  @override
  void initState() {
    super.initState();
    _books = widget.books;
    _user = widget.user;
  }

  void _onLikeTap(String bookId) {
    final likes = {..._user.likes};
    if (!likes.add(bookId)) likes.remove(bookId);
    _user = _user.copyWith(likes: likes);

    setState(() {});
    print("Change book like. id=$bookId");
  }

  void _onLikeVisibleTap() {
    _isLikesVisible = !_isLikesVisible;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CatalogAppBar(
        booksCount: _books.length,
        onLikeVisibleTap: _onLikeVisibleTap,
        isLikesVisible: _isLikesVisible,
        likesCount: _user.likes.length,
      ),
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(color: Color(0xFFF2F2F2)),
          child: BookList(
            books: _books,
            onLikeTap: _onLikeTap,
            isLikesVisible: _isLikesVisible,
            likes: _user.likes,
          ),
        ),
      ),
    );
  }
}
