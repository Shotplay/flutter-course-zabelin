import 'package:freezed_annotation/freezed_annotation.dart';

final _regex = RegExp(r'^[^@]+@[^@]+\.[^@]+$');

@immutable
class Email {
  final String value;

  const Email._(this.value);

  factory Email(String email) {
    final normalize = email.trim();

    if (!_regex.hasMatch(normalize)) {
      throw FormatException('Invalid email: $email');
    }

    return Email._(normalize);
  }

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is Email &&
            runtimeType == other.runtimeType &&
            value == other.value;
  }

  @override
  String toString() => value;
}

class EmailConverter implements JsonConverter<Email, String> {
  const EmailConverter();

  @override
  Email fromJson(String json) {
    return Email(json);
  }

  @override
  String toJson(Email object) {
    return object.toString();
  }
}
