import 'package:flutter/material.dart';
import 'package:flutter_app/ui/theme/brand_colors.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(minWidth: 64, minHeight: 64),
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(18)),
          color: context.brandColors.primary,
        ),
        child: const Icon(Icons.import_contacts, color: Colors.white, size: 30),
      ),
    );
  }
}
