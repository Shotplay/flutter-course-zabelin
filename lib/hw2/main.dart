import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> books = [
      book(
        "assets/images/parfumer.png",
        "Парфюмер. История одного убийцы",
        "Патрик Зюскинд",
        "1985",
        [bookGenre("18+"), bookGenre("Драма"), bookGenre("Зарубежное")],
        true,
      ),
      book(
        "assets/images/death_souls.png",
        "Мертвые души",
        "Николай Гоголь",
        "1842",
        [bookGenre("16+"), bookGenre("Поэма"), bookGenre("Роман")],
        false,
      ),
      book(
        "assets/images/dorian_gray.png",
        "Портрет Дориана Грея",
        "Оскар Уайльд",
        "1890",
        [bookGenre("16+"), bookGenre("Роман"), bookGenre("Зарубежное")],
        true,
      ),
      book("assets/images/rose_name.png", "Имя розы", "Умберто Эко", "1980", [
        bookGenre("18+"),
        bookGenre("Роман"),
        bookGenre("Зарубежное"),
      ], false),
      book(
        "assets/images/clean_architecture.png",
        "Чистая архитектура. Искусство разработки программного обеспечения",
        "Роберт Мартин",
        "2026",
        [
          bookGenre("12+"),
          bookGenre("Программирование"),
          bookGenre("Архитектура Программного Обеспечения"),
        ],
        false,
      ),
      book(
        "assets/images/highload_architecture.png",
        "Высоконагруженные приложения. Программирование, масштабирование, поддержка",
        "Клеппман Мартин",
        "2026",
        [
          bookGenre("16+"),
          bookGenre("Программирование"),
          bookGenre("Архитектура Программного Обеспечения"),
          bookGenre("Базы данных и распределённые системы"),
        ],
        true,
      ),
      book(
        "assets/images/catalog_lature.png",
        "Каталог Латура, или Лакей маркиза де Сада",
        "Николай Фробениус",
        "2004",
        [bookGenre("18+"), bookGenre("Мистика")],
        false,
      ),
      book(
        "assets/images/fahrenheit_451.png",
        "451 градус по Фаренгейту",
        "Рэй Брэдбери",
        "1953",
        [
          bookGenre("16+"),
          bookGenre("Научная Фантастика"),
          bookGenre("Философский Роман"),
        ],
        true,
      ),
      book("assets/images/1984.png", "1984", "Джордж Оруэлл", "1949", [
        bookGenre("16+"),
        bookGenre("Роман"),
        bookGenre("Антиутопия"),
        bookGenre("Социальная Фантастика"),
      ], true),
    ];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: "Inter"),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          toolbarHeight: 97,
          titleSpacing: 0,
          title: Padding(
            padding: EdgeInsetsGeometry.only(
              top: 32,
              right: 16,
              bottom: 12,
              left: 16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Каталог книг",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 28),
                ),
                Text(
                  "${books.length} книг в каталоге",
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
                ),
              ],
            ),
          ),
        ),
        body: SafeArea(
          child: Container(
            decoration: BoxDecoration(color: Color(0xFFF2F2F2)),
            child: ListView.separated(
              padding: EdgeInsets.only(top: 4, right: 16, bottom: 16, left: 16),
              itemCount: books.length,
              itemBuilder: (_, i) => books[i],
              separatorBuilder: (_, i) => const SizedBox(height: 12),
            ),
          ),
        ),
      ),
    );
  }

  Widget book(
    String imgSrc,
    String name,
    String author,
    String year,
    List<Widget> genres,
    bool favorite,
  ) {
    return Container(
      width: 358,
      height: 146,
      decoration: BoxDecoration(
        border: BoxBorder.all(color: Color(0xFFECE8E1), width: 1),
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
      ),
      child: Padding(
        padding: EdgeInsetsGeometry.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            bookPreview(imgSrc, favorite),
            bookInfo(name, author, year, genres),
          ],
        ),
      ),
    );
  }

  Widget bookGenre(String genre) {
    return Container(
      padding: const EdgeInsetsGeometry.only(
        top: 3,
        right: 8,
        bottom: 3,
        left: 8,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFE6F0EF),
        border: Border.all(color: const Color(0xFFE6F0EF)),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        genre,
        style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 11),
      ),
    );
  }

  Widget bookInfo(
    String name,
    String author,
    String year,
    List<Widget> genres,
  ) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
          ),
          const SizedBox(height: 6),
          Text(
            "$author · $year",
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 13),
          ),
          const SizedBox(height: 6),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(spacing: 9, children: genres),
          ),
        ],
      ),
    );
  }

  Widget bookPreview(String src, bool favorite) {
    return SizedBox(
      width: 88,
      height: 120,
      child: Stack(
        children: [
          Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black,
                  spreadRadius: 0.4,
                  blurRadius: 1,
                ),
              ],
            ),
            child: Image.asset(src, fit: BoxFit.cover),
          ),
          bookFavorite(favorite),
        ],
      ),
    );
  }

  Widget bookFavorite(bool enable) {
    return Positioned(
      width: 28,
      height: 28,
      top: 6,
      left: 50,
      child: CircleAvatar(
        radius: 14,
        backgroundColor: Colors.white,
        child: Icon(
          enable ? Icons.favorite : Icons.favorite_border,
          color: enable ? Colors.red : Colors.grey,
          size: 16,
        ),
      ),
    );
  }
}
