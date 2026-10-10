typedef BookItemTapLikeFunc = void Function(BookItem book);
typedef BookItemMap = Map<String, BookItem>;

class BookItem {
  final String id;
  final String previewSrc;
  final String name;
  final String author;
  final int year;
  final List<String> genres;
  final bool isLike;

  final String? description;

  const new({
    required this.id,
    required this.previewSrc,
    required this.name,
    required this.author,
    required this.year,
    required this.genres,
    this.isLike = false,
    this.description,
  });

  BookItem copyWith({
    String? id,
    String? previewSrc,
    String? name,
    String? author,
    int? year,
    List<String>? genres,
    bool? isLike,
    String? description,
  }) {
    return BookItem(
      id: id ?? this.id,
      previewSrc: previewSrc ?? this.previewSrc,
      name: name ?? this.name,
      author: author ?? this.author,
      year: year ?? this.year,
      genres: genres ?? this.genres,
      isLike: isLike ?? this.isLike,
      description: description ?? this.description,
    );
  }
}
