import 'package:flutter/material.dart';
import 'package:flutter_app/ui/widgets/book_list.dart';
import 'package:flutter_app/ui/widgets/catalog_app_bar.dart';

class CatalogScreen extends StatefulWidget {
  const CatalogScreen({super.key});

  @override
  State<CatalogScreen> createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  bool _isLikesVisible = false;

  @override
  void initState() {
    super.initState();
  }

  void _onLikeVisibleTap() {
    _isLikesVisible = !_isLikesVisible;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CatalogAppBar(
        onLikeVisibleTap: _onLikeVisibleTap,
        isLikesVisible: _isLikesVisible,
      ),
      body: SafeArea(
        child: DecoratedBox(
          decoration: const BoxDecoration(color: Color(0xFFF2F2F2)),
          child: BookList(isLikesVisible: _isLikesVisible),
        ),
      ),
    );
  }
}
