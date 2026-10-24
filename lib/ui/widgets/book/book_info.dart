import 'package:flutter/material.dart';
import 'package:flutter_app/domain/value_object/genre.dart';
import 'book_genre.dart';

class BookInfo extends StatelessWidget {
  final String title;
  final String subtitle;
  final int year;
  final Set<Genre> genres;
  final int? titleMaxLines;

  const BookInfo({
    super.key,
    required this.title,
    required this.subtitle,
    required this.year,
    required this.genres,
    this.titleMaxLines,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 6,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _Title(title: title, maxLines: titleMaxLines),
        _SubTitle(subtitle: subtitle, year: year),
        if (genres.isNotEmpty) _Genres(genres: genres),
      ],
    );
  }
}

class _Title extends StatelessWidget {
  final String title;
  final int? maxLines;

  const _Title({required this.title, required this.maxLines});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      maxLines: maxLines,
      softWrap: true,
      overflow: maxLines != null ? TextOverflow.ellipsis : TextOverflow.visible,
      style: Theme.of(context).textTheme.headlineMedium!.copyWith(fontSize: 18),
    );
  }
}

class _SubTitle extends StatelessWidget {
  final String subtitle;
  final int year;

  const _SubTitle({required this.subtitle, required this.year});

  @override
  Widget build(BuildContext context) {
    return Text(
      "$subtitle · $year г.",
      style: Theme.of(context).textTheme.bodyLarge,
    );
  }
}

class _Genres extends StatelessWidget {
  final Set<Genre> genres;

  const _Genres({required this.genres});

  @override
  Widget build(BuildContext context) {
    if (genres.isEmpty) return const SizedBox.shrink();

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        spacing: 6,
        children: genres.map((g) => BookGenre(genre: g)).toList(),
      ),
    );
  }
}
