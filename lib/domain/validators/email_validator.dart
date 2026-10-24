import 'package:flutter_app/domain/value_object/email.dart';

String? validateEmail(String? value) {
  if (value == null || value.trim().isEmpty) return 'Введите email';

  try {
    Email(value);
    return null;
  } on FormatException {
    return 'Некорректный email';
  }
}
