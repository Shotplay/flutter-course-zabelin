import 'package:flutter/material.dart';
import 'package:flutter_app/ui/widgets/app_bar_icon_button.dart';

class LikesFilterButton extends StatelessWidget {
  final VoidCallback toggleLikesFilter;
  final bool isActive;

  const LikesFilterButton({
    super.key,
    required this.toggleLikesFilter,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return AppBarIconButton(
      onPressed: (_) => toggleLikesFilter(),
      isActive: isActive,
      title: "Только избранное",
      icon: isActive ? Icons.favorite : Icons.favorite_border,
    );
  }
}
