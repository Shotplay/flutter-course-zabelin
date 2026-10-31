import 'package:flutter/material.dart';
import 'package:flutter_app/data/bloc/books_bloc.dart';
import 'package:flutter_app/data/bloc/user_bloc.dart';
import 'package:flutter_app/data/cubit/catalog_cubit.dart';
import 'package:flutter_app/domain/entity/auth.dart';
import 'package:flutter_app/domain/entity/book.dart';
import 'package:flutter_app/domain/entity/catalog.dart';
import 'package:flutter_app/domain/entity/user.dart';
import 'package:flutter_app/ui/widgets/book/book_card.dart';
import 'package:flutter_app/ui/widgets/catalog_app_bar.dart';
import 'package:flutter_app/ui/widgets/likes_not_found.dart';
import 'package:flutter_app/ui/widgets/loading.dart';
import 'package:flutter_app/ui/widgets/wifi_off.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.watch<BooksBloc>();
    context.watch<UserBloc>();

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
    final booksBloc = context.watch<BooksBloc>();
    final userBloc = context.watch<UserBloc>();

    return switch ((booksBloc.state, userBloc.state)) {
      (BooksLoadedState(:final books), UserLoadedState(:final user)) =>
        BlocSelector<CatalogCubit, CatalogState, bool>(
          selector: (s) => s.activeLikesFilter,
          builder: (context, activeLikesFilter) {
            if (activeLikesFilter) {
              final likes = user.likes;

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
      (BooksFailureState(), _) || (_, UserFailureState()) => WifiOff(
        onRefresh: () {
          booksBloc.add(const BooksRefreshEvent());
          userBloc.add(
            UserRefreshEvent(context.read<AuthRepository>().userId!),
          );
        },
      ),
      _ => const Loading(child: Text("Загружаю каталог прекрасных книг...")),
    };
  }
}

class _BooksList extends StatelessWidget {
  final List<Book> books;

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
