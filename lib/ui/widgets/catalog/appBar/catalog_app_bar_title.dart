import 'package:flutter/material.dart';
import 'package:flutter_app/ui/view/user_session.dart';
import 'package:flutter_app/ui/view/books_view_model.dart';
import 'package:flutter_app/ui/widgets/catalog/appBar/catalog_app_bar_add_book_button.dart';
import 'package:flutter_app/ui/widgets/catalog/appBar/catalog_app_bar_like_button.dart';
import 'package:flutter_app/ui/widgets/catalog/appBar/catalog_app_bar_refresh_button.dart';
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
              children: [
                CatalogAppBarRefreshButton(),
                CatalogAppBarLikeButton(
                  isLikesVisible: isLikesVisible,
                  onLikeVisibleTap: onLikeVisibleTap,
                ),
                CatalogAppBarAddBookButton(),
              ],
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
}
