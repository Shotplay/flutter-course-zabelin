import 'package:flutter/material.dart';
import 'package:flutter_app/data/bloc/user_bloc.dart';
import 'package:flutter_app/domain/entity/auth.dart';
import 'package:flutter_app/domain/entity/user.dart';
import 'package:flutter_app/ui/theme/brand_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        icon: BlocSelector<UserBloc, UserState, bool>(
          selector: (s) => switch (s) {
            UserLoadedState(:final user) => user.likes.contains(bookId),
            _ => false,
          },
          builder: (_, isLike) => Icon(
            isLike ? Icons.favorite : Icons.favorite_border,
            color: isLike ? Colors.red : null,
            size: widgetSize,
          ),
        ),
        onPressed: () => context.read<UserBloc>().add(
          UserToggleBookLikeEvent(
            context.read<AuthRepository>().userId!,
            bookId,
          ),
        ),
      ),
    );
  }
}
