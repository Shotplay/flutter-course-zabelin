import 'dart:convert';

import 'package:flutter_app/data/store/url.dart';
import 'package:flutter_app/domain/entities/user.dart';
import 'package:flutter_app/utils/http.dart';
import 'package:http/http.dart' as http;

class UserStore {
  static final url = "$baseURL/users";

  bool _isUpdating = false; // prevent race condition

  UserStore();

  Future<User> fetchUser(String userId) async {
    final resp = await http.get(
      Uri.parse("$url/$userId"),
      headers: {"Content-Type": "application/json"},
    );

    final decoded = jsonDecode(resp.body);
    return User.fromJson(decoded);
  }

  Future<bool> updateUser(User user) async {
    if (_isUpdating) return false;
    _isUpdating = true;

    try {
      final resp = await http.put(
        Uri.parse("$url/${user.id}"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(user),
      );

      return resp.statusCode.isSuccess;
    } finally {
      _isUpdating = false;
    }
  }
}
