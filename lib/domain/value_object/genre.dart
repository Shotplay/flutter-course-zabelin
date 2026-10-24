import 'package:freezed_annotation/freezed_annotation.dart';

@immutable
class Genre {
  final String value;

  const Genre._(this.value);

  factory Genre(String value) {
    final normalized = value.trim();

    if (normalized.isEmpty) {
      throw FormatException('Genre is empty');
    }

    return Genre._(normalized);
  }

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is Genre &&
            runtimeType == other.runtimeType &&
            value == other.value;
  }

  @override
  String toString() =>
      '${value[0].toUpperCase()}${value.substring(1).toLowerCase()}';
}

class GenreConverter implements JsonConverter<Genre, String> {
  const GenreConverter();

  @override
  Genre fromJson(String json) => Genre(json);

  @override
  String toJson(Genre object) => object.toString();
}
