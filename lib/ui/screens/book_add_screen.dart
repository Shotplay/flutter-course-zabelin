import 'package:flutter/material.dart';
import 'package:flutter_app/data/bloc/books_bloc.dart';
import 'package:flutter_app/domain/entity/book.dart';
import 'package:flutter_app/domain/validators/is_number_validator.dart';
import 'package:flutter_app/domain/validators/not_empty_validator.dart';
import 'package:flutter_app/domain/value_object/genre.dart';
import 'package:flutter_app/router/app_router.dart';
import 'package:flutter_app/ui/theme/brand_colors.dart';
import 'package:flutter_app/ui/widgets/form_input.dart';
import 'package:flutter_app/ui/widgets/styled_back_button.dart';
import 'package:flutter_app/utils/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookAddScreen extends StatefulWidget {
  const BookAddScreen({super.key});

  @override
  State<BookAddScreen> createState() => _BookAddScreenState();
}

class _BookAddScreenState extends State<BookAddScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _subtitleController = TextEditingController();
  final _yearController = TextEditingController();
  final _genresController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _previewController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _subtitleController.dispose();
    _yearController.dispose();
    _genresController.dispose();
    _descriptionController.dispose();
    _previewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _AppBar(context),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: SingleChildScrollView(
            child: Column(
              spacing: 24,
              children: [
                _Form(
                  formKey: _formKey,
                  titleController: _titleController,
                  subtitleController: _subtitleController,
                  yearController: _yearController,
                  genresController: _genresController,
                  descriptionController: _descriptionController,
                  previewController: _previewController,
                ),
                _AddButton(
                  formKey: _formKey,
                  titleController: _titleController,
                  subtitleController: _subtitleController,
                  yearController: _yearController,
                  genresController: _genresController,
                  descriptionController: _descriptionController,
                  previewController: _previewController,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _AppBar extends AppBar {
  _AppBar(BuildContext context)
    : super(
        toolbarHeight: 96,
        titleSpacing: 0,
        automaticallyImplyLeading: false,
        backgroundColor: context.brandColors.appBarBackgroundColor,
        title: Padding(
          padding: const EdgeInsets.only(
            top: 44,
            right: 16,
            bottom: 12,
            left: 16,
          ),
          child: Row(
            spacing: 12,
            children: [
              StyledBackButton(iconSize: 24, fallbackRoute: CatalogRoute()),
              Text(
                "Новая книга",
                style: context.theme.textTheme.headlineMedium,
              ),
            ],
          ),
        ),
      );
}

class _Form extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController titleController;
  final TextEditingController subtitleController;
  final TextEditingController yearController;
  final TextEditingController genresController;
  final TextEditingController descriptionController;
  final TextEditingController previewController;

  const _Form({
    required this.formKey,
    required this.titleController,
    required this.subtitleController,
    required this.yearController,
    required this.genresController,
    required this.descriptionController,
    required this.previewController,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        spacing: 16,
        children: [
          FormInput(
            title: "Название *",
            controller: titleController,
            hint: Text("Парфюмер. История одного убийцы"),
            validator: validateNotEmpty,
          ),
          FormInput(
            title: "Автор *",
            controller: subtitleController,
            hint: Text("Патрик Зюскинд"),
            validator: validateNotEmpty,
          ),
          FormInput(
            title: "Год написания *",
            controller: yearController,
            hint: Text("1985"),
            validator: validateIsNumber,
          ),
          FormInput(
            title: "Жанры",
            controller: genresController,
            hint: Text("18+, Драма, Зарубежное"),
          ),
          FormInput(
            title: "Описание",
            hint: Text(
              "«Парфюмер. История одного убийцы» — исторический психологический роман о человеке с феноменальным обонянием, который стремится создать аромат, способный подчинять людей. Патрик Зюскинд переносит действие во Францию XVIII века, где парижские улицы, мастерские и рынки существуют прежде всего в запахах: резких, сладких, гнилостных, почти осязаемых. Жан-Батист Гренуй лишён собственного человеческого запаха и отделён от окружающих этой особенностью. Его талант к парфюмерии постепенно превращается в одержимость совершенством.",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            controller: descriptionController,
          ),
        ],
      ),
    );
  }
}

class _AddButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController titleController;
  final TextEditingController subtitleController;
  final TextEditingController yearController;
  final TextEditingController genresController;
  final TextEditingController descriptionController;
  final TextEditingController previewController;

  const _AddButton({
    required this.formKey,
    required this.titleController,
    required this.subtitleController,
    required this.yearController,
    required this.genresController,
    required this.descriptionController,
    required this.previewController,
  });

  void _clear() {
    titleController.clear();
    subtitleController.clear();
    yearController.clear();
    genresController.clear();
    descriptionController.clear();
    previewController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: () async {
        if (!formKey.currentState!.validate()) return;

        final genres = genresController.text
            .split(",")
            .where((g) => g.isNotEmpty)
            .map((g) => Genre(g))
            .toSet();

        context.read<BooksBloc>().add(
          BooksAddBookEvent(
            Book(
              id: DateTime.now().toUtc().microsecondsSinceEpoch.toString(),
              title: titleController.text,
              subtitle: subtitleController.text,
              year: int.parse(yearController.text),
              genres: genres,
              preview: previewController.text.isEmpty
                  ? null
                  : previewController.text,
              description: descriptionController.text.isEmpty
                  ? null
                  : descriptionController.text,
            ),
          ),
        );

        _clear();
      },
      child: Text("Сохранить"),
    );
  }
}
