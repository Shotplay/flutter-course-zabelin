import 'package:flutter/material.dart';
import 'package:flutter_app/data/store/books_store.dart';
import 'package:flutter_app/data/store/user_store.dart';
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
        children: [_category(), _counts(), _likeButton()],
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
    return Selector2<UserStore, BooksStore, (int, int)>(
      selector: (_, userStore, booksStore) =>
          (booksStore.booksCount, userStore.likesCount),
      builder: (_, counts, _) {
        return Text(
          "В каталоге: ${counts.$1} | В избранном: ${counts.$2}",
          style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
        );
      },
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
    final buttonImage = isLikesVisible ? Icons.favorite : Icons.favorite_border;

    return SizedBox(
      height: 30,
      child: Ink(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: const BorderRadius.all(Radius.circular(16)),
          border: const Border.fromBorderSide(
            BorderSide(color: Color(0xFFECE8E1), width: 1),
          ),
        ),
        child: InkWell(
          onTap: onLikeVisibleTap,
          borderRadius: const BorderRadius.all(Radius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              spacing: 6,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(buttonImage, color: buttonColor, size: 14),
                Text(
                  "Только избранные",
                  style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
