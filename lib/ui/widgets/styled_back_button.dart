import 'package:flutter/material.dart';
import 'package:flutter_app/ui/theme/brand_colors.dart';
import 'package:go_router/go_router.dart';

class StyledBackButton extends StatelessWidget {
  final double? iconSize;
  final GoRouteData fallbackRoute;

  const StyledBackButton({
    super.key,
    required this.fallbackRoute,
    this.iconSize,
  });

  @override
  Widget build(BuildContext context) {
    return BackButton(
      onPressed: () {
        if (context.canPop()) return context.pop();

        fallbackRoute.go(context);
      },
      style: IconButton.styleFrom(
        backgroundColor: context.brandColors.cardBackgroundColor,
        foregroundColor: context.brandColors.textGrey,
        iconSize: iconSize,
        side: BorderSide(color: context.brandColors.border),
      ),
    );
  }
}
