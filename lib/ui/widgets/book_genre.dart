import 'package:flutter/material.dart';

class BookGenre extends StatelessWidget {
  final String genre;

  const new(this.genre, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: const BoxDecoration(
        color: Color(0xFFE6F0EF),
        border: Border.fromBorderSide(BorderSide(color: Color(0xFFE6F0EF))),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Text(
        genre,
        style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 11),
      ),
    );
  }
}
