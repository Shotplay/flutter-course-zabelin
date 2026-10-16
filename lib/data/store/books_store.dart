import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_app/data/store/url.dart';
import 'package:flutter_app/domain/entities/book.dart';
import 'package:flutter_app/utils/http.dart';
import 'package:http/http.dart' as http;

class BooksStore extends ChangeNotifier {
  static final url = "$baseURL/books";

  bool _isUpdating = false; // prevent race condition

  BooksStore();

  Future<List<BookItem>> fetchBooks() async {
    final resp = await http.get(
      Uri.parse(url),
      headers: {"Content-Type": "application/json"},
    );

    final decoded = jsonDecode(resp.body) as List<dynamic>;
    return decoded.map((e) => BookItem.fromJson(e)).toList();
  }

  Future<bool> addBook(BookItem book) async {
    if (_isUpdating) return false;
    _isUpdating = true;

    try {
      final resp = await http.post(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(book),
      );

      return resp.statusCode.isSuccess;
    } finally {
      _isUpdating = false;
    }
  }
}
