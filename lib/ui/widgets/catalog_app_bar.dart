import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/widgets/catalog_app_bar_title.dart';

class CatalogAppBar extends AppBar {
  new({
    super.key,
    required int booksCount,
    required int likesCount,
    required VoidCallback onLikeVisibleTap,
    required bool isLikesVisible,
  }) : super(
         backgroundColor: Colors.white,
         toolbarHeight: 139,
         titleSpacing: 0,
         title: CatalogAppBarTitle(
           booksCount: booksCount,
           likesCount: likesCount,
           onLikeVisibleTap: onLikeVisibleTap,
           isLikesVisible: isLikesVisible,
         ),
       );
}
