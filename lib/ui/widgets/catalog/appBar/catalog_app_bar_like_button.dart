import 'package:flutter/material.dart';
import 'package:flutter_app/ui/widgets/catalog/appBar/catalog_app_bar_button.dart';

class CatalogAppBarLikeButton extends StatelessWidget {
  final bool isLikesVisible;
  final VoidCallback onLikeVisibleTap;

  const CatalogAppBarLikeButton({
    super.key,
    required this.isLikesVisible,
    required this.onLikeVisibleTap,
  });

  @override
  Widget build(BuildContext context) {
    final backgroundColor = isLikesVisible
        ? const Color(0xFFE6F0EF)
        : Colors.white;

    final textColor = isLikesVisible
        ? const Color(0xFF1F5F5B)
        : const Color(0xFF1A1A1A);

    final buttonColor = isLikesVisible ? Colors.red : Colors.grey;
    final icon = isLikesVisible ? Icons.favorite : Icons.favorite_border;

    return CatalogAppBarButton(
      title: "Только избранные",
      onTap: onLikeVisibleTap,
      backgroundColor: backgroundColor,
      icon: icon,
      iconColor: buttonColor,
      textColor: textColor,
    );
  }
}
