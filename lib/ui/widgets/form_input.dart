import 'package:flutter/material.dart';
import 'package:flutter_app/utils/theme.dart';

class FormInput extends StatelessWidget {
  final FormFieldValidator<String>? validator;
  final TextEditingController controller;
  final bool obsecureText;
  final String title;
  final Widget? hint;

  const FormInput({
    super.key,
    required this.title,
    required this.controller,
    this.validator,
    this.hint,
    this.obsecureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 6,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(title, style: context.theme.textTheme.bodyLarge),
        TextFormField(
          controller: controller,
          decoration: InputDecoration(hint: hint),
          obscureText: obsecureText,
          validator: validator,
        ),
      ],
    );
  }
}
