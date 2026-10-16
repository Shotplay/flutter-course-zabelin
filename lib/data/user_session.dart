import 'package:flutter/foundation.dart';
import 'package:flutter_app/data/store/user_store.dart';
import 'package:flutter_app/domain/entities/user.dart';

class UserSession extends ChangeNotifier {
  final UserStore store;

  User _user = User.zero;
  UserSessionState _state = UserSessionState.none;
  bool _isLoaded = false;
  String? _error;

  UserSession({required this.store});

  User get user => _user;
  Set<String> get likes => Set.unmodifiable(_user.likedBooks);
  UserSessionState get state => _state;
  bool get isBusy => _state != UserSessionState.none;
  bool get isLoaded => _isLoaded;
  String? get error => _error;

  String get userId => _user.id;
  int get likedCount => _user.likedBooks.length;
  bool isLikedBook(String bookId) => _user.likedBooks.contains(bookId);

  Future<bool> toggleLike(String bookId) async {
    if (isBusy) return false;
    _state = UserSessionState.togglingLike;
    _error = null;

    final oldUser = _user;
    final likedBooks = {..._user.likedBooks};
    if (!likedBooks.add(bookId)) likedBooks.remove(bookId);

    _user = _user.copyWith(likedBooks: likedBooks);
    notifyListeners();

    try {
      final updated = await store.updateUser(user);
      if (!updated) _user = oldUser;
      return updated;
    } catch (e) {
      _user = oldUser;
      _error = e.toString();
      return false;
    } finally {
      _state = UserSessionState.none;
      notifyListeners();
    }
  }

  Future<bool> load(String userId) async {
    if (isBusy) return false;
    _state = UserSessionState.loading;
    _error = null;
    notifyListeners();

    try {
      final user = await store.fetchUser(userId);
      _user = user;
      _isLoaded = true;
      return true;
    } catch (e) {
      _error = e.toString();
      return false;
    } finally {
      _state = UserSessionState.none;
      notifyListeners();
    }
  }
}
