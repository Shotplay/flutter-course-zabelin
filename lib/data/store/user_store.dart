import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app/domain/entity/user.dart';

class UserStore {
  UserStore();

  final _db = FirebaseFirestore.instance;

  CollectionReference get _usersRef => _db.collection('users');

  Future<UserData> fetchUserData(String id) async {
    final snapshot = await _usersRef.doc(id).get();
    return UserData.fromFirestore(snapshot);
  }

  Future<void> createUserData(String id) async {
    await _usersRef.doc(id).set(UserData.zero.toJson());
  }

  Future<void> updateUserData(String id, UserData data) async {
    await _usersRef.doc(id).update(data.toJson());
  }
}
