import 'package:flutter/material.dart';
import 'package:flutter_app/data/bloc/books_bloc.dart';
import 'package:flutter_app/data/bloc/user_bloc.dart';
import 'package:flutter_app/data/cubit/catalog_cubit.dart';
import 'package:flutter_app/domain/entity/auth.dart';
import 'package:flutter_app/domain/entity/book.dart';
import 'package:flutter_app/domain/entity/catalog.dart';
import 'package:flutter_app/domain/entity/user.dart';
import 'package:flutter_app/router/app_router.dart';
import 'package:flutter_app/ui/theme/brand_colors.dart';
import 'package:flutter_app/ui/widgets/app_bar_icon_button.dart';
import 'package:flutter_app/ui/widgets/likes_filter_button.dart';
import 'package:flutter_app/ui/widgets/logout.dart';
import 'package:flutter_app/ui/widgets/refresh_button.dart';
import 'package:flutter_app/utils/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    final booksBloc = context.watch<BooksBloc>();
    final userBloc = context.watch<UserBloc>();

    return switch ((booksBloc.state, userBloc.state)) {
      (BooksLoadedState(:final books), UserLoadedState(:final user)) => Text(
        "В каталоге: ${books.length} · В избранном: ${user.likes.length}",
      ),
      (BooksFailureState(), _) ||
      (_, UserFailureState()) => const Text("Нет данных"),
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
              context.read<BooksBloc>().add(const BooksRefreshEvent());
              context.read<UserBloc>().add(UserRefreshEvent(context.read<AuthRepository>().userId!));
            },
          ),
          BlocSelector<CatalogCubit, CatalogState, bool>(
            selector: (s) => s.activeLikesFilter,
            builder: (_, isActive) => LikesFilterButton(
              isActive: isActive,
              toggleLikesFilter: context
                  .read<CatalogCubit>()
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
