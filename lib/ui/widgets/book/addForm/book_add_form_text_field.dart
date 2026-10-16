import 'package:flutter/material.dart';

class BookAddFormTextField extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  final String? hintText;
  final FormFieldValidator<String>? validator;

  const BookAddFormTextField({
    super.key,
    required this.title,
    required this.controller,
    this.hintText,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
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
}
