import 'package:flutter/material.dart';
import 'package:flutter_app/data/user_session.dart';
import 'package:flutter_app/data/view/books_view_model.dart';
import 'package:flutter_app/ui/widgets/book/book_add_form.dart';
import 'package:flutter_app/ui/widgets/catalog_app_bar_button.dart';
import 'package:provider/provider.dart';

class CatalogAppBarTitle extends StatelessWidget {
  final VoidCallback onLikeVisibleTap;
  final bool isLikesVisible;

  const CatalogAppBarTitle({
    super.key,
    required this.onLikeVisibleTap,
    required this.isLikesVisible,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 32, right: 16, bottom: 12, left: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 6,
        children: [
          _category(),
          _counts(),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              spacing: 6,
              children: [_refreshButton(), _likeButton(), _addBookButton()],
            ),
          ),
        ],
      ),
    );
  }

  Widget _category() {
    return const Text(
      "Каталог книг",
      style: TextStyle(fontWeight: FontWeight.w700, fontSize: 28),
    );
  }

  Widget _counts() {
    return Selector2<UserSession, BooksViewModel, (int, int)>(
      selector: (_, userSession, booksVM) =>
          (booksVM.count, userSession.likedCount),
      builder: (_, counts, _) {
        return Text(
          "В каталоге: ${counts.$1} | В избранном: ${counts.$2}",
          style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
        );
      },
    );
  }

  Widget _refreshButton() {
    return Builder(
      builder: (context) => CatalogAppBarButton(
        title: "Обновить",
        onTap: () async {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text("Обновляю...")));

          final userSession = context.read<UserSession>();
          final successes = await Future.wait([
            context.read<BooksViewModel>().load(),
            userSession.load(userSession.userId),
          ]);

          if (!context.mounted) return;
          ScaffoldMessenger.of(context).clearSnackBars();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                successes.every((b) => b) && successes[1]
                    ? "Успешно обновлено"
                    : "Не удалось обновить",
              ),
            ),
          );
        },
        backgroundColor: Colors.white,
        icon: Icons.refresh,
        iconColor: Colors.black,
        textColor: Colors.black,
      ),
    );
  }

  Widget _addBookButton() {
    return Builder(
      builder: (context) => CatalogAppBarButton(
        title: "Добавить книгу",
        backgroundColor: Colors.white,
        icon: Icons.add,
        iconColor: Colors.black,
        textColor: Colors.black,
        onTap: () {
          final booksVM = context.read<BooksViewModel>();

          showDialog(
            context: context,
            builder: (_) => ChangeNotifierProvider.value(
              value: booksVM,
              child: const AlertDialog(content: BookAddForm()),
            ),
          );
        },
      ),
    );
  }

  Widget _likeButton() {
    final backgroundColor = isLikesVisible
        ? const Color(0xFFE6F0EF)
        : Colors.white;

    final textColor = isLikesVisible
        ? const Color(0xFF1F5F5B)
        : const Color(0xFF1A1A1A);

    final buttonColor = isLikesVisible ? Colors.red : Colors.grey;
    final icon = isLikesVisible ? Icons.favorite : Icons.favorite_border;

    return CatalogAppBarButton(
      title: "Только избранные",
      onTap: onLikeVisibleTap,
      backgroundColor: backgroundColor,
      icon: icon,
      iconColor: buttonColor,
      textColor: textColor,
    );
  }
}
