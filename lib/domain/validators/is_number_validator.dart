String? validateIsNumber(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'Значение не может быть пустым';
  }

  if (int.tryParse(value) == null) {
    return 'Неверное значение';
  }

  return null;
}
