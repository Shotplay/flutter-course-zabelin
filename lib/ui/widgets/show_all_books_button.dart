import 'package:flutter/material.dart';
import 'package:flutter_app/utils/theme.dart';

class ShowAllBooksButton extends StatelessWidget {
  final VoidCallback onShowAllBooks;

  const ShowAllBooksButton({super.key, required this.onShowAllBooks});

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      onSelected: (_) => onShowAllBooks(),
      labelPadding: const EdgeInsets.all(8),
      label: Text(
        "Показать все книги",
        style: context.theme.textTheme.headlineMedium!.copyWith(fontSize: 24),
      ),
    );
  }
}
