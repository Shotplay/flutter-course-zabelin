import 'package:freezed_annotation/freezed_annotation.dart';

part 'book.freezed.dart';
part 'book.g.dart';

typedef BookItemMap = Map<String, BookItem>;

enum BooksViewModelState { none, loading, addingBook, disposed }

@freezed
abstract class BookItem with _$BookItem {
  const factory BookItem({
    required String id,
    required String previewSrc,
    required String name,
    required String author,
    required int year,
    required Set<String> genres,
    @Default(null) String? description,
  }) = _BookItem;

  factory BookItem.fromJson(Map<String, dynamic> json) =>
      _$BookItemFromJson(json);
}
