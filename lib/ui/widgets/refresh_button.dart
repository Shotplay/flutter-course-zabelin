import 'package:flutter/material.dart';
import 'package:flutter_app/ui/widgets/app_bar_icon_button.dart';

class RefreshButton extends StatelessWidget {
  final VoidCallback onRefresh;

  const RefreshButton({super.key, required this.onRefresh});

  @override
  Widget build(BuildContext context) {
    return AppBarIconButton(
      onPressed: (_) => onRefresh(),
      isActive: false,
      title: "Обновить",
      icon: Icons.refresh,
    );
  }
}
