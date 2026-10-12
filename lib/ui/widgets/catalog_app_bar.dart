import 'package:flutter/material.dart';
import 'package:flutter_app/ui/widgets/catalog_app_bar_title.dart';

class CatalogAppBar extends AppBar {
  CatalogAppBar({
    super.key,
    required VoidCallback onLikeVisibleTap,
    required bool isLikesVisible,
  }) : super(
         backgroundColor: Colors.white,
         toolbarHeight: 139,
         titleSpacing: 0,
         title: CatalogAppBarTitle(
           onLikeVisibleTap: onLikeVisibleTap,
           isLikesVisible: isLikesVisible,
         ),
       );
}
