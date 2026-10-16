import 'package:flutter/material.dart';
import 'package:flutter_app/data/user_session.dart';
import 'package:flutter_app/data/view/books_view_model.dart';
import 'package:flutter_app/domain/entities/book.dart';
import 'package:flutter_app/ui/widgets/book/book_list.dart';
import 'package:flutter_app/ui/widgets/catalog/appBar/catalog_app_bar.dart';
import 'package:flutter_app/ui/widgets/loading.dart';
import 'package:provider/provider.dart';

class CatalogScreen extends StatefulWidget {
  const CatalogScreen({super.key});

  @override
  State<CatalogScreen> createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  bool _isLikesVisible = false;

  @override
  void initState() {
    super.initState();

    context.read<BooksViewModel>().load();
  }

  void _onLikeVisibleTap() {
    _isLikesVisible = !_isLikesVisible;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CatalogAppBar(
        onLikeVisibleTap: _onLikeVisibleTap,
        isLikesVisible: _isLikesVisible,
      ),
      body: SafeArea(
        child: Consumer2<UserSession, BooksViewModel>(
          builder: (_, userSession, booksVM, _) {
            if (booksVM.state == BooksViewModelState.loading) {
              return Loading();
            }

            return BookList(isLikesVisible: _isLikesVisible);
          },
        ),
      ),
    );
  }
}
