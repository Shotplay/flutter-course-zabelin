import 'package:flutter/material.dart';
import 'package:flutter_app/data/states/books_view_model.dart';
import 'package:flutter_app/data/states/catalog_ui_state.dart';
import 'package:flutter_app/data/states/user_view_model.dart';
import 'package:flutter_app/router/app_router.dart';
import 'package:flutter_app/ui/theme/brand_colors.dart';
import 'package:flutter_app/ui/widgets/app_bar_icon_button.dart';
import 'package:flutter_app/ui/widgets/likes_filter_button.dart';
import 'package:flutter_app/ui/widgets/logout.dart';
import 'package:flutter_app/ui/widgets/refresh_button.dart';
import 'package:flutter_app/utils/theme.dart';
import 'package:provider/provider.dart';

class CatalogAppBar extends AppBar {
  CatalogAppBar({super.key, required BuildContext context})
    : super(
        titleSpacing: 0,
        backgroundColor: context.brandColors.appBarBackgroundColor,
        toolbarHeight: 169,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(16)),
        ),
        title: const _Title(),
      );
}

class _Title extends StatelessWidget {
  const _Title();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 32, right: 16, bottom: 12, left: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 12,
        mainAxisSize: MainAxisSize.min,
        children: [_Heading(), _Actions()],
      ),
    );
  }
}

class _Heading extends StatelessWidget {
  const _Heading();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 2,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                "Каталог книг",
                style: context.theme.textTheme.headlineMedium,
              ),
            ),
            const Logout(),
          ],
        ),
        _Stats(),
      ],
    );
  }
}

class _Stats extends StatelessWidget {
  const _Stats();

  @override
  Widget build(BuildContext context) {
    final booksVM = context.watch<BooksViewModel>();
    final userVM = context.watch<UserViewModel>();

    return switch ((booksVM.state, userVM.state)) {
      (BooksLoaded(:final books), UserLoaded(:final user)) => Text(
        "В каталоге: ${books.length} · В избранном: ${user.data.likedBooks.length}",
      ),
      (BooksError(), _) || (_, UserError()) => const Text("Нет данных"),
      _ => const Text("Загружаю..."),
    };
  }
}

class _Actions extends StatelessWidget {
  const _Actions();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        spacing: 6,
        children: [
          RefreshButton(
            onRefresh: () {
              context.read<BooksViewModel>().refresh();
              context.read<UserViewModel>().refresh();
            },
          ),
          Selector<CatalogUiState, bool>(
            selector: (_, p) => p.activeLikesFilter,
            builder: (_, isActive, _) => LikesFilterButton(
              isActive: isActive,
              toggleLikesFilter: context
                  .read<CatalogUiState>()
                  .toggleActiveLikesFilter,
            ),
          ),
          AppBarIconButton(
            onPressed: (_) => BookAddRoute().push(context),
            isActive: false,
            title: "Добавить книгу",
            icon: Icons.add,
          ),
        ],
      ),
    );
  }
}
