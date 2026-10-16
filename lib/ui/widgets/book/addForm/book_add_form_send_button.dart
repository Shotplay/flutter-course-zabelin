import 'package:flutter/material.dart';
import 'package:flutter_app/data/view/books_view_model.dart';
import 'package:flutter_app/domain/entities/book.dart';
import 'package:provider/provider.dart';

class BookAddFormSendButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final String previewSrc;
  final String name;
  final String author;
  final String year;
  final String genres;
  final String description;
  final VoidCallback clear;

  const BookAddFormSendButton({
    super.key,
    required this.formKey,
    required this.previewSrc,
    required this.name,
    required this.author,
    required this.year,
    required this.genres,
    required this.description,
    required this.clear,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (!formKey.currentState!.validate()) return;

        final booksVM = context.read<BooksViewModel>();
        final book = BookItem(
          id: (booksVM.count + 1).toString().trim(),
          previewSrc: previewSrc.trim(),
          name: name.trim(),
          author: author.trim(),
          year: int.parse(year.trim()),
          genres: genres
              .trim()
              .split(",")
              .where((e) => e != "")
              .map(
                (g) => "${g[0].toUpperCase()}${g.substring(1).toLowerCase()}",
              )
              .toSet(),
          description: description != "" ? description : null,
        );

        clear();
        booksVM.addBook(book);
      },
      child: Text("Добавить"),
    );
  }
}
