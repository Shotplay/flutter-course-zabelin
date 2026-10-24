import 'package:flutter/material.dart';
import 'package:flutter_app/utils/theme.dart';

class ErrorBanner extends StatelessWidget {
  final String text;

  const ErrorBanner({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: context.theme.colorScheme.errorContainer,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        child: Row(
          spacing: 10,
          children: [
            Icon(Icons.error, color: context.theme.colorScheme.error),
            Text(
              text,
              style: context.theme.textTheme.bodyLarge!.copyWith(
                color: context.theme.colorScheme.error,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
