String? validateNotEmpty(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'Значение не может быть пустым';
  }

  return null;
}
