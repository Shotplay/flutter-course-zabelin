import 'package:flutter/material.dart';
import 'package:flutter_app/data/store/books_store.dart';
import 'package:flutter_app/data/view/books_view_model.dart';
// ignore: unused_import
import 'package:flutter_app/domain/entities/book.dart';
import 'package:provider/provider.dart';

class CatalogProvider extends StatelessWidget {
  final BooksStore booksStore;
  final Widget child;

  const CatalogProvider({
    super.key,
    required this.child,
    required this.booksStore,
  });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => BooksViewModel(store: booksStore),
        ),
      ],
      child: child,
    );
  }
}
