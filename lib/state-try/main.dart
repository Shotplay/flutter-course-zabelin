import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      theme: ThemeData(fontFamily: "Inter"),
      home: Catalog(
        books: [
          Book(
            imageSrc: "assets/images/parfumer.png",
            name: "Парфюмер. История одного убийцы",
            author: "Патрик Зюскинд",
            year: 1985,
            description: "«Парфюмер. История одного убийцы» — исторический психологический роман о человеке с феноменальным обонянием, который стремится создать аромат, способный подчинять людей. Патрик Зюскинд переносит действие во Францию XVIII века, где парижские улицы, мастерские и рынки существуют прежде всего в запахах: резких, сладких, гнилостных, почти осязаемых. Жан-Батист Гренуй лишён собственного человеческого запаха и отделён от окружающих этой особенностью. Его талант к парфюмерии постепенно превращается в одержимость совершенством.",
            genres: [
              BookGenre("18+", bold: true),
              BookGenre("Драма"),
              BookGenre("Зарубежное"),
            ],
          ),
          Book(
            imageSrc: "assets/images/dorian_gray.png",
            name: "Портрет Дориана Грея",
            author: "Оскар Уайльд",
            year: 1890,
            description: "«Портрет Дориана Грея» — самое знаменитое произведение Оскара Уайльда, единственный его роман, вызвавший в свое время шквал негативных оценок и тем не менее имевший невероятный успех. Главный герой романа, красавец Дориан, — фигура двойственная, неоднозначная. Тонкий эстет и романтик становится безжалостным преступником. Попытка сохранить свою необычайную красоту и молодость оборачивается провалом. Вместо героя стареет его портрет — но это не может продолжаться вечно, и смерть Дориана расставляет все по своим местам. Роман Оскара Уайльда продолжает быть очень актуальным и сегодня — разве погоня за вечной молодостью порой не оборачивается потерей своего истинного лица?",
            genres: [
              BookGenre("16+", bold: true),
              BookGenre("Роман"),
              BookGenre("Зарубежное"),
            ],
          ),
          Book(
            imageSrc: "assets/images/death_souls.png",
            name: "Мертвые Души",
            author: "Николай Гоголь",
            year: 1842,
            description: "«...Говоря о „Мертвых душах“, можно вдоволь наговориться о России» — это суждение поэта и критика П. А. Вяземского объясняет особое место поэмы Гоголя в истории русской литературы: и огромный успех у читателей, и необычайную остроту полемики вокруг главной гоголевской книги, и многообразие высказанных мнений, каждое из которых так или иначе вовлекает в размышления о природе национального характера и культурного сознания, о настоящем и будущем России.",
            genres: [
              BookGenre("16+", bold: true),
              BookGenre("Поэма"),
              BookGenre("Роман"),
            ],
          ),
          Book(
            imageSrc: "assets/images/rose_name.png",
            name: "Имя розы",
            author: "Умберто Эко",
            year: 1980,
            description: "«Имя розы» — философско-детективный роман о расследовании загадочных смертей в бенедиктинском монастыре Северной Италии XIV века. Умберто Эко помещает францисканца Вильгельма Баскервильского и его молодого спутника Адсона Мелькского в замкнутое пространство, где богословский спор соседствует с борьбой за книги и право на знание. Монастырь живёт по строгим правилам, а закрытая библиотека-лабиринт хранит рукописи и тревожные следы прошлого. Средневековая история соединяет детективную интригу, религиозные конфликты и размышления о вере, власти, цензуре и свободе мысли.",
            genres: [
              BookGenre("18+", bold: true),
              BookGenre("Зарубежное"),
              BookGenre("Роман"),
            ],
          ),
          Book(
            imageSrc: "assets/images/clean_architecture.png",
            name: "Чистая архитектура. Искусство разработки программного обеспечения",
            author: "Роберт Мартин",
            year: 2026,
            description: "'Идеальный программист' и 'Чистый код' - легендарные бестселлеры Роберта Мартина - рассказывают, как достичь высот профессионализма. 'Чистая архитектура' продолжает эту тему, но не предлагает несколько вариантов в стиле 'решай сам', а объясняет, что именно следует делать, по какой причине и почему именно такое решение станет принципиально важным для вашего успеха. .Роберт Мартин дает прямые и лаконичные ответы на ключевые вопросы архитектуры и дизайна. 'Чистую архитектуру' обязаны прочитать разработчики всех уровней, системные аналитики, архитекторы и каждый программист, который желает подняться по карьерной лестнице или хотя бы повлиять на людей, которые занимаются данной работой. .Все архитектуры подчиняются одним и тем же правилам! .Роберт Мартин (дядюшка Боб)",
            genres: [
              BookGenre("12+", bold: true),
              BookGenre("Программирование"),
              BookGenre("Архитектура Программного Обеспечения"),
            ],
          ),
        ],
      ),
    );
  }
}

class Catalog extends StatefulWidget {
  final List<Book> books;

  const new({super.key, required this.books});

  @override
  State<Catalog> createState() => _CatalogState();
}

class _CatalogState extends State<Catalog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: SafeArea(
        child: Center(
          child: Container(
            decoration: BoxDecoration(color: Color(0xFFF2F2F2)),
            child: Padding(
              padding: EdgeInsetsGeometry.only(
                top: 4,
                right: 16,
                left: 16,
                bottom: 16,
              ),
              child: ListView(children: widget.books),
            ),
          ),
        ),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
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
              "${widget.books.length} книг в каталоге",
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}

class Book extends StatelessWidget {
  final String imageSrc;
  final String name;
  final String author;
  final int year;
  final List<BookGenre> genres;
  final String description;
  final bool isFavorite;

  const new({
    super.key,
    required this.imageSrc,
    required this.name,
    required this.author,
    required this.year,
    required this.genres,
    required this.description,
    this.isFavorite = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BookPreview(imageSrc: imageSrc, isFavorite: isFavorite),
          Expanded(
            child: BookInfo(
              name: name,
              author: author,
              description: description,
              year: year,
              genres: genres,
            ),
          ),
        ],
      ),
    );
  }
}

class BookInfo extends StatelessWidget {
  final String name;
  final String author;
  final String description;
  final int year;
  final List<BookGenre> genres;

  const new({
    super.key,
    required this.name,
    required this.author,
    required this.description,
    required this.year,
    required this.genres,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
          ),
          Text(
            "$author · $year",
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 13),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(spacing: 9, children: genres),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontWeight: .w400, fontSize: 14),
          ),
        ],
      ),
    );
  }
}

class BookGenre extends StatelessWidget {
  final String genre;
  final bool bold;

  const new(this.genre, {super.key, this.bold = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFE6F0EF),
        border: Border.all(color: const Color(0xFFE6F0EF)),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: EdgeInsetsGeometry.symmetric(vertical: 3, horizontal: 8),
        child: Text(
          genre,
          style: TextStyle(
            color: const Color(0xFF1F5F5B),
            fontWeight: bold ? FontWeight.bold : FontWeight.w500,
            fontSize: 11,
          ),
        ),
      ),
    );
  }
}

class BookPreview extends StatelessWidget {
  final String imageSrc;
  final bool isFavorite;

  const new({super.key, required this.imageSrc, required this.isFavorite});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.all(12),
      child: Stack(
        children: [
          image(),
          BookFavorite(isFavorite: isFavorite),
        ],
      ),
    );
  }

  Widget image() {
    return Container(
      width: 88,
      height: 120,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(color: Colors.black, spreadRadius: 0.4, blurRadius: 1),
        ],
      ),
      child: Image.asset(imageSrc, fit: BoxFit.cover),
    );
  }
}

class BookFavorite extends StatefulWidget {
  final bool isFavorite;

  const new({super.key, required this.isFavorite});

  @override
  State<BookFavorite> createState() => _BookFavoriteState();
}

class _BookFavoriteState extends State<BookFavorite> {
  late bool _isFavorite;

  @override
  void initState() {
    super.initState();
    _isFavorite = widget.isFavorite;
  }

  void _changeFavorite() {
    setState(() {
      _isFavorite = !_isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 6,
      left: 54,
      width: 28,
      height: 28,
      child: CircleAvatar(
        radius: 14,
        backgroundColor: Colors.white,
        child: (IconButton(
          padding: EdgeInsets.zero,
          icon: Icon(
            _isFavorite ? Icons.favorite : Icons.favorite_border,
            color: _isFavorite ? Colors.red : Colors.black,
            size: 16,
          ),
          onPressed: () => _changeFavorite(),
        )),
      ),
    );
  }
}
