import 'package:flutter/material.dart';
import 'package:flutter_app/data/store/books_store.dart';
import 'package:flutter_app/data/store/user_store.dart';
import 'package:flutter_app/domain/entities/book.dart';
import 'package:flutter_app/domain/entities/user.dart';
import 'package:provider/provider.dart';

class CatalogProvider extends StatelessWidget {
  final User user;
  final BookItemMap books;
  final Widget child;

  const CatalogProvider({
    super.key,
    required this.user,
    required this.books,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserStore(user: user)),
        ChangeNotifierProvider(create: (_) => BooksStore(books: books)),
      ],
      child: child,
    );
  }
}
