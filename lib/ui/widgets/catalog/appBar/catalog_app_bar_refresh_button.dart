import 'package:flutter/material.dart';
import 'package:flutter_app/ui/view/user_session.dart';
import 'package:flutter_app/ui/view/books_view_model.dart';
import 'package:flutter_app/ui/widgets/catalog/appBar/catalog_app_bar_button.dart';
import 'package:provider/provider.dart';

class CatalogAppBarRefreshButton extends StatelessWidget {
  const CatalogAppBarRefreshButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CatalogAppBarButton(
      title: "Обновить",
      onTap: () => _onTap(context),
      backgroundColor: Colors.white,
      icon: Icons.refresh,
      iconColor: Colors.black,
      textColor: Colors.black,
    );
  }

  void _showSnackBar(BuildContext context, String text) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
  }

  void _onTap(BuildContext context) async {
    _showSnackBar(context, "Обновляю...");

    final userSession = context.read<UserSession>();
    final successes = await Future.wait([
      context.read<BooksViewModel>().refresh(),
      userSession.refresh(),
    ]);

    if (!context.mounted) return;
    _showSnackBar(
      context,
      successes.every((b) => b) ? "Успешно обновлено" : "Не удалось обновить",
    );
  }
}
