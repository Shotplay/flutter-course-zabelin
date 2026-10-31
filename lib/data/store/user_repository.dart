import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app/domain/entity/user.dart';

class UserFirebaseRepository implements UserRepository {
  UserFirebaseRepository();

  final _db = FirebaseFirestore.instance;
  final Map<String, User> _cache = {};
  CollectionReference get _usersRef => _db.collection('users');

  @override
  Future<User> getUser(String id) async {
    if (_cache.containsKey(id)) return _cache[id]!;

    return fetchUser(id);
  }

  @override
  Future<User> createUser(String id) async {
    await _usersRef.doc(id).set(User.zero.toJson());
    _cache[id] = User.zero;
    return getUser(id);
  }

  @override
  Future<bool> saveUser(User user) async {
    await _usersRef.doc(user.id).set(user.toJson());
    _cache[user.id] = user;
    return true;
  }

  @override
  Future<User> fetchUser(String id) async {
    final user = User.fromFirestore(await _usersRef.doc(id).get());
    _cache[id] = user;
    return user;
  }
}
