import 'package:flutter/material.dart';
import 'package:flutter_app/ui/view/books_view_model.dart';
import 'package:flutter_app/domain/entities/book.dart';
import 'package:provider/provider.dart';

class BookAddFormSendButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController previewController;
  final TextEditingController nameController;
  final TextEditingController authorController;
  final TextEditingController yearController;
  final TextEditingController genresController;
  final TextEditingController descriptionController;

  const BookAddFormSendButton({
    super.key,
    required this.formKey,
    required this.previewController,
    required this.nameController,
    required this.authorController,
    required this.yearController,
    required this.genresController,
    required this.descriptionController,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (!formKey.currentState!.validate()) return;

        final booksVM = context.read<BooksViewModel>();
        final book = BookItem(
          id: (booksVM.count + 1).toString().trim(),
          previewSrc: previewController.text.trim(),
          name: nameController.text.trim(),
          author: authorController.text.trim(),
          year: int.parse(yearController.text.trim()),
          genres: genresController.text
              .trim()
              .split(",")
              .where((e) => e != "")
              .map(
                (g) => "${g[0].toUpperCase()}${g.substring(1).toLowerCase()}",
              )
              .toSet(),
          description: descriptionController.text != ""
              ? descriptionController.text
              : null,
        );

        _clear();
        booksVM.addBook(book);
      },
      child: Text("Добавить"),
    );
  }

  void _clear() {
    previewController.clear();
    nameController.clear();
    authorController.clear();
    yearController.clear();
    genresController.clear();
    descriptionController.clear();
  }
}
