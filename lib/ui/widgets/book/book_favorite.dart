import 'package:flutter/material.dart';
import 'package:flutter_app/data/states/user_view_model.dart';
import 'package:flutter_app/ui/theme/brand_colors.dart';
import 'package:provider/provider.dart';

class BookFavorite extends StatelessWidget {
  final String bookId;
  final double? iconSize;
  final bool showBorder;

  const BookFavorite({
    super.key,
    required this.bookId,
    this.iconSize,
    this.showBorder = true,
  });

  @override
  Widget build(BuildContext context) {
    final widgetSize = iconSize ?? 16.0;
    final boxSize = widgetSize * 1.6;

    return Container(
      width: boxSize,
      height: boxSize,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: context.brandColors.cardBackgroundColor,
        border: showBorder
            ? Border.fromBorderSide(
                BorderSide(color: context.brandColors.border),
              )
            : null,
      ),
      child: IconButton(
        padding: const EdgeInsets.all(0),
        icon: Selector<UserViewModel, bool>(
          selector: (_, userVM) => switch (userVM.state) {
            (UserLoaded(:final user) || UserUpdating(:final user)) =>
              user.data.likedBooks.contains(bookId),
            _ => false,
          },
          builder: (_, isLike, _) => Icon(
            isLike ? Icons.favorite : Icons.favorite_border,
            color: isLike ? Colors.red : null,
            size: widgetSize,
          ),
        ),
        onPressed: () async {
          final success = await context.read<UserViewModel>().toggleBookLike(
            bookId,
          );

          if (success || !context.mounted) return;

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Слишком быстро, подождите немного..."),
            ),
          );
        },
      ),
    );
  }
}
