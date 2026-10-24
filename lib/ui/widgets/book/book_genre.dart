import 'package:flutter/material.dart';
import 'package:flutter_app/ui/theme/brand_colors.dart';
import 'package:flutter_app/utils/theme.dart';
import '../../../domain/value_object/genre.dart';

class BookGenre extends StatelessWidget {
  final Genre genre;

  const BookGenre({super.key, required this.genre});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        color: context.brandColors.borderSelected,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 3, horizontal: 8),
        child: Text(
          genre.toString(),
          style: context.theme.textTheme.bodyLarge!.copyWith(
            color: context.brandColors.primary,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
