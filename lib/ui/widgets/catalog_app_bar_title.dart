import 'package:flutter/material.dart';
import 'package:flutter_application_1/domain/entities/book.dart';

class CatalogAppBarTitle extends StatelessWidget {
  final BookItemMap books;
  final Set<String> likedIds;
  final VoidCallback onLikeVisibleTap;
  final bool isLikesVisible;

  const new({
    super.key,
    required this.books,
    required this.likedIds,
    required this.onLikeVisibleTap,
    required this.isLikesVisible,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsGeometry.only(
        top: 32,
        right: 16,
        bottom: 12,
        left: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 6,
        children: [_category(), _counts(), _likeButton()],
      ),
    );
  }

  Text _category() {
    return const Text(
      "Каталог книг",
      style: TextStyle(fontWeight: FontWeight.w700, fontSize: 28),
    );
  }

  Text _counts() {
    return Text(
      "В каталоге: ${books.length} | В избранном: ${likedIds.length}",
      style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
    );
  }

  Widget _likeButton() {
    return SizedBox(
      height: 30,
      child: ElevatedButton(
        onPressed: onLikeVisibleTap,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
          backgroundColor: isLikesVisible
              ? const Color(0xFFE6F0EF)
              : Colors.white,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            side: BorderSide(color: Color(0xFFECE8E1), width: 1),
          ),
        ),
        child: SizedBox(
          width: 150,
          child: Row(
            spacing: 6,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                isLikesVisible ? Icons.favorite : Icons.favorite_border,
                color: isLikesVisible ? Colors.red : Colors.grey,
                size: 14,
              ),
              Text(
                "Только избранные",
                style: TextStyle(
                  color: isLikesVisible
                      ? const Color(0xFF1F5F5B)
                      : const Color(0xFF1A1A1A),
                  fontWeight: FontWeight.w500,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
