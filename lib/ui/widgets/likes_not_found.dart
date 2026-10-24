import 'package:flutter/material.dart';
import 'package:flutter_app/data/states/catalog_ui_state.dart';
import 'package:flutter_app/ui/theme/brand_colors.dart';
import 'package:flutter_app/ui/widgets/show_all_books_button.dart';
import 'package:flutter_app/utils/theme.dart';
import 'package:provider/provider.dart';

class LikesNotFound extends StatelessWidget {
  const LikesNotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 40,
          ).copyWith(bottom: 60),
          child: Column(
            spacing: 12,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const _Icon(),
              const _Heading(),
              const _Body(),
              ShowAllBooksButton(
                onShowAllBooks: context
                    .read<CatalogUiState>()
                    .toggleActiveLikesFilter,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Icon extends StatelessWidget {
  const _Icon();

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 44,
      backgroundColor: context.brandColors.cardBackgroundColor,
      child: Icon(Icons.favorite_border, size: 36),
    );
  }
}

class _Heading extends StatelessWidget {
  const _Heading();

  @override
  Widget build(BuildContext context) {
    return Text(
      "В избранном пока пусто",
      textAlign: TextAlign.center,
      style: context.theme.textTheme.headlineMedium,
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return Text(
      "Нажмите на сердечко на карточке, чтобы сохранить книгу в избранное",
      textAlign: TextAlign.center,
      style: context.theme.textTheme.bodyLarge,
    );
  }
}
