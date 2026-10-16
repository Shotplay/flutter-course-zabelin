import 'package:flutter/material.dart';
import 'package:flutter_app/ui/widgets/book/addForm/book_add_form_send_button.dart';
import 'package:flutter_app/ui/widgets/book/addForm/book_add_form_text_field.dart';

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
            BookAddFormTextField(
              title: "Путь до превью",
              controller: _previewController,
              hintText: "assets/images/dorian_gray.png",
            ),
            BookAddFormTextField(
              title: "Название книги",
              controller: _nameController,
              hintText: "Портрет Дориана Грея",
              validator: _validateName,
            ),
            BookAddFormTextField(
              title: "Автор",
              controller: _authorController,
              hintText: "Оскар Уайльд",
              validator: _validateAuthor,
            ),
            BookAddFormTextField(
              title: "Год написания",
              controller: _yearController,
              hintText: "1890",
              validator: _validateYear,
            ),
            BookAddFormTextField(
              title: "Жанры",
              controller: _genresController,
              hintText: "16+, Роман, Зарубежное",
            ),
            BookAddFormTextField(
              title: "Описание",
              controller: _descriptionController,
              hintText:
                  "«Парфюмер. История одного убийцы» — исторический психологический роман о человеке с феноменальным обонянием, который стремится создать аромат, способный подчинять людей. Патрик Зюскинд переносит действие во Францию XVIII века, где парижские улицы, мастерские и рынки существуют прежде всего в запахах: резких, сладких, гнилостных, почти осязаемых. Жан-Батист Гренуй лишён собственного человеческого запаха и отделён от окружающих этой особенностью. Его талант к парфюмерии постепенно превращается в одержимость совершенством.",
            ),
            BookAddFormSendButton(
              formKey: _formKey,
              previewController: _previewController,
              nameController: _nameController,
              authorController: _authorController,
              yearController: _yearController,
              genresController: _genresController,
              descriptionController: _descriptionController,
            ),
          ],
        ),
      ),
    );
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
