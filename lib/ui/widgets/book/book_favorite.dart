import 'package:flutter/material.dart';
import 'package:flutter_app/data/user_session.dart';
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
          onPressed: () => _onPressed(context),
          padding: const EdgeInsets.all(0),
          icon: Selector<UserSession, bool>(
            selector: (_, userSession) => userSession.isLikedBook(bookId),
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

  void _onPressed(BuildContext context) {
    final userSession = context.read<UserSession>();
    if (userSession.isBusy) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Слишком быстро, подождите немного...")),
      );
    }

    userSession.toggleLike(bookId);
  }
}
