final _regexp = RegExp(r'^(?=.*[A-Za-z])(?=.*\d).{8,}$');

String? validatePassword(String? value) {
  if (value == null || value == "") return 'Введите пароль';

  if (value.length < 8) return 'Пароль меньше 8 символов';

  if (!_regexp.hasMatch(value)) {
    return 'Пароль слишком простой. Он должен содержать минимум одну латинскую букву и одну цифру';
  }

  return null;
}
