import 'package:flutter/material.dart';
import 'package:flutter_app/data/store/user_store.dart';
import 'package:provider/provider.dart';

class BookFavorite extends StatelessWidget {
  final String bookId;

  const BookFavorite({super.key, required this.bookId});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      width: 28,
      height: 28,
      top: 6,
      left: 50,
      child: CircleAvatar(
        radius: 14,
        backgroundColor: Colors.white,
        child: IconButton(
          onPressed: () => context.read<UserStore>().toggleLike(bookId),
          padding: const EdgeInsets.all(0),
          icon: Selector<UserStore, bool>(
            selector: (_, userStore) => userStore.isLiked(bookId),
            builder: (_, isLike, _) => Icon(
              isLike ? Icons.favorite : Icons.favorite_border,
              color: isLike ? Colors.red : Colors.grey,
              size: 16,
            ),
          ),
        ),
      ),
    );
  }
}
