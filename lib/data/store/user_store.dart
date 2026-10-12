import 'package:flutter/foundation.dart';
import 'package:flutter_app/domain/entities/user.dart';

class UserStore extends ChangeNotifier {
  User _user;

  UserStore({required User user}) : _user = user;

  Set<String> get likes => _user.likes;
  int get likesCount => _user.likes.length;
  bool isLiked(String bookId) => _user.likes.contains(bookId);
  
  void toggleLike(String bookId) {
    final likes = {..._user.likes};
    if (!likes.add(bookId)) likes.remove(bookId);
    _user = _user.copyWith(likes: likes);

    notifyListeners();
  }
}
