import 'package:flutter/material.dart';
import 'package:flutter_app/ui/view/books_view_model.dart';
import 'package:flutter_app/ui/widgets/book/addForm/book_add_form.dart';
import 'package:flutter_app/ui/widgets/catalog/appBar/catalog_app_bar_button.dart';
import 'package:provider/provider.dart';

class CatalogAppBarAddBookButton extends StatelessWidget {
  const CatalogAppBarAddBookButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CatalogAppBarButton(
      title: "Добавить книгу",
      backgroundColor: Colors.white,
      icon: Icons.add,
      iconColor: Colors.black,
      textColor: Colors.black,
      onTap: () {
        final booksVM = context.read<BooksViewModel>();

        showDialog(
          context: context,
          builder: (_) => ChangeNotifierProvider.value(
            value: booksVM,
            child: const AlertDialog(content: BookAddForm()),
          ),
        );
      },
    );
  }
}
