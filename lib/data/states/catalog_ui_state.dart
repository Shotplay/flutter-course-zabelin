import 'package:flutter/material.dart';

class CatalogUiState extends ChangeNotifier {
  CatalogUiState();

  bool _activeLikesFilter = false;

  bool get activeLikesFilter => _activeLikesFilter;

  void toggleActiveLikesFilter() {
    _activeLikesFilter = !_activeLikesFilter;
    notifyListeners();
  }
}
