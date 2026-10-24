import 'package:flutter/material.dart';
import 'package:flutter_app/data/states/books_view_model.dart';
import 'package:flutter_app/data/states/catalog_ui_state.dart';
import 'package:flutter_app/data/states/user_view_model.dart';
import 'package:flutter_app/domain/entity/book.dart';
import 'package:flutter_app/ui/widgets/book/book_card.dart';
import 'package:flutter_app/ui/widgets/catalog_app_bar.dart';
import 'package:flutter_app/ui/widgets/likes_not_found.dart';
import 'package:flutter_app/ui/widgets/loading.dart';
import 'package:flutter_app/ui/widgets/wifi_off.dart';
import 'package:provider/provider.dart';

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CatalogAppBar(context: context),
      body: SafeArea(child: _BooksContent()),
    );
  }
}

class _BooksContent extends StatelessWidget {
  const _BooksContent();

  @override
  Widget build(BuildContext context) {
    final booksVM = context.watch<BooksViewModel>();
    final userVM = context.watch<UserViewModel>();

    return switch ((booksVM.state, userVM.state)) {
      (
        BooksLoaded(:final books) || BooksUpdating(:final books),
        UserLoaded(:final user) || UserUpdating(:final user),
      ) =>
        Selector<CatalogUiState, bool>(
          selector: (_, p) => p.activeLikesFilter,
          builder: (context, activeLikesFilter, _) {
            if (activeLikesFilter) {
              final likes = user.data.likedBooks;

              if (likes.isEmpty) {
                return const LikesNotFound();
              }

              final booksLiked = likes
                  .where((id) => books[id] != null)
                  .map((id) => books[id]!)
                  .toList();

              return _BooksList(books: booksLiked);
            }

            return _BooksList(books: books.values.toList());
          },
        ),
      (BooksError(), _) || (_, UserError()) => WifiOff(
        onRefresh: () {
          booksVM.load();
          userVM.refresh();
        },
      ),
      _ => const Loading(child: Text("Загружаю каталог прекрасных книг...")),
    };
  }
}

class _BooksList extends StatelessWidget {
  final List<BookItem> books;

  const _BooksList({required this.books});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (_, i) => BookCard(book: books.elementAt(i)),
      separatorBuilder: (_, _) => const SizedBox(height: 12),
      itemCount: books.length,
    );
  }
}
