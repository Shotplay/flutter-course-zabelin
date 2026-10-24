import 'package:flutter/material.dart';
import 'package:flutter_app/ui/theme/brand_colors.dart';

class AppBarIconButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool isActive;
  final ValueChanged<bool> onPressed;

  const AppBarIconButton({
    super.key,
    required this.onPressed,
    required this.isActive,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      labelPadding: const EdgeInsets.symmetric(vertical: 3, horizontal: 6),
      showCheckmark: false,
      selected: isActive,
      onSelected: onPressed,
      label: Row(
        mainAxisSize: MainAxisSize.min,
        spacing: 6,
        children: [
          Icon(
            icon,
            color: isActive ? context.brandColors.cardBackgroundColor : null,
          ),
          Text(
            title,
            style: TextStyle(
              color: isActive ? context.brandColors.cardBackgroundColor : null,
            ),
          ),
        ],
      ),
    );
  }
}
