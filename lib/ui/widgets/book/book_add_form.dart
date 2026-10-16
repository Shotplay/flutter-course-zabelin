
import 'package:flutter/material.dart';
import 'package:flutter_app/data/view/books_view_model.dart';
import 'package:flutter_app/domain/entities/book.dart';
import 'package:provider/provider.dart';

class BookAddForm extends StatefulWidget {
  const BookAddForm({super.key});

  @override
  State<BookAddForm> createState() => _BookAddFormState();
}

class _BookAddFormState extends State<BookAddForm> {
  final _formKey = GlobalKey<FormState>();
  final _previewController = TextEditingController();
  final _nameController = TextEditingController();
  final _authorController = TextEditingController();
  final _yearController = TextEditingController();
  final _genresController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  void dispose() {
    _previewController.dispose();
    _nameController.dispose();
    _authorController.dispose();
    _yearController.dispose();
    _genresController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 12,
          children: [
            _textField(
              "Путь до превью",
              _previewController,
              hintText: "assets/images/dorian_gray.png",
            ),
            _textField(
              "Название книги",
              _nameController,
              hintText: "Портрет Дориана Грея",
              validator: _validateName,
            ),
            _textField(
              "Автор",
              _authorController,
              hintText: "Оскар Уайльд",
              validator: _validateAuthor,
            ),
            _textField(
              "Год написания",
              _yearController,
              hintText: "1890",
              validator: _validateYear,
            ),
            _textField(
              "Жанры",
              _genresController,
              hintText: "16+, Роман, Зарубежное",
            ),
            _textField(
              "Описание",
              _descriptionController,
              hintText:
                  "«Парфюмер. История одного убийцы» — исторический психологический роман о человеке с феноменальным обонянием, который стремится создать аромат, способный подчинять людей. Патрик Зюскинд переносит действие во Францию XVIII века, где парижские улицы, мастерские и рынки существуют прежде всего в запахах: резких, сладких, гнилостных, почти осязаемых. Жан-Батист Гренуй лишён собственного человеческого запаха и отделён от окружающих этой особенностью. Его талант к парфюмерии постепенно превращается в одержимость совершенством.",
            ),
            _sendButton(),
          ],
        ),
      ),
    );
  }

  Widget _textField(
    String title,
    TextEditingController controller, {
    String? hintText,
    FormFieldValidator<String>? validator,
  }) {
    return TextFormField(
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        labelText: title,
        hintText: hintText,
        border: const OutlineInputBorder(borderSide: BorderSide(width: 1)),
      ),
    );
  }

  Widget _sendButton() {
    return ElevatedButton(
      onPressed: () {
        if (!_formKey.currentState!.validate()) return;

        final booksVM = context.read<BooksViewModel>();
        final book = BookItem(
          id: (booksVM.count + 1).toString().trim(),
          previewSrc: _previewController.text.trim(),
          name: _nameController.text.trim(),
          author: _authorController.text.trim(),
          year: int.parse(_yearController.text.trim()),
          genres: _genresController.text
              .trim()
              .split(",")
              .where((e) => e != "")
              .map(
                (g) => "${g[0].toUpperCase()}${g.substring(1).toLowerCase()}",
              )
              .toSet(),
          description: _descriptionController.text != ""
              ? _descriptionController.text
              : null,
        );

        _clear();
        booksVM.addBook(book);
      },
      child: Text("Добавить"),
    );
  }

  void _clear() {
    _previewController.clear();
    _nameController.clear();
    _authorController.clear();
    _yearController.clear();
    _genresController.clear();
    _descriptionController.clear();
  }

  String? _validateName(String? value) {
    if (value == null || value == "") {
      return "Не указано название книги";
    }

    return null;
  }

  String? _validateAuthor(String? value) {
    if (value == null || value == "") {
      return "Не указан автор книги";
    }

    return null;
  }

  String? _validateYear(String? value) {
    if (value == null || value == "") {
      return "Не указан год написания книги";
    }

    if (int.tryParse(value) == null) {
      return "Неверный год";
    }

    if (DateTime.now().year <= int.parse(value)) {
      return "Год не может быть в будущем";
    }

    return null;
  }
}
