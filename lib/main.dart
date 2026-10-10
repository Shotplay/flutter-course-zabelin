import 'package:flutter/material.dart';
import 'package:flutter_application_1/domain/entities/book.dart';
import 'package:flutter_application_1/ui/screens/catalog_screen.dart';

const List<BookItem> books = [
  BookItem(
    id: "1",
    previewSrc: "assets/images/parfumer.png",
    name: "Парфюмер. История одного убийцы",
    author: "Патрик Зюскинд",
    year: 1985,
    genres: ["18+", "Драма", "Зарубежное"],
    isLike: true,
  ),
  BookItem(
    id: "2",
    previewSrc: "assets/images/death_souls.png",
    name: "Мертвые души",
    author: "Николай Гоголь",
    year: 1842,
    genres: ["16+", "Поэма", "Роман"],
  ),
  BookItem(
    id: "3",
    previewSrc: "assets/images/dorian_gray.png",
    name: "Портрет Дориана Грея",
    author: "Оскар Уайльд",
    year: 1890,
    genres: ["16+", "Роман", "Зарубежное"],
    isLike: true,
  ),
  BookItem(
    id: "4",
    previewSrc: "assets/images/rose_name.png",
    name: "Имя розы",
    author: "Умберто Эко",
    year: 1980,
    genres: ["18+", "Роман", "Зарубежное"],
  ),
  BookItem(
    id: "5",
    previewSrc: "assets/images/clean_architecture.png",
    name: "Чистая архитектура. Искусство разработки программного обеспечения",
    author: "Роберт Мартин",
    year: 2017,
    genres: ["12+", "Программирование", "Архитектура программного обеспечения"],
  ),
  BookItem(
    id: "6",
    previewSrc: "assets/images/highload_architecture.png",
    name: "Высоконагруженные приложения. Программирование, масштабирование, поддержка",
    author: "Клеппман Мартин",
    year: 2017,
    genres: [
      "16+",
      "Программирование",
      "Архитектура программного обеспечения",
      "Базы данных и распределенные системы",
    ],
    isLike: true,
  ),
  BookItem(
    id: "7",
    previewSrc: "assets/images/catalog_lature.png",
    name: "Каталог Латура, или Лакей маркиза де Сада",
    author: "Николай Фробениус",
    year: 2004,
    genres: ["18+", "Мистика"],
  ),
  BookItem(
    id: "8",
    previewSrc: "assets/images/fahrenheit_451.png",
    name: "451 градус по Фаренгейту",
    author: "Рэй Брэдбери",
    year: 1953,
    genres: ["16+", "Научная фантастика", "Философский роман"],
    isLike: true,
  ),
  BookItem(
    id: "9",
    previewSrc: "assets/images/1984.png",
    name: "1984",
    author: "Джордж Оруэлл",
    year: 1949,
    genres: ["18+", "Роман", "Антиутопия", "Социальная фантастика"],
    isLike: true,
  ),
  BookItem(
    id: "10",
    previewSrc: "assets/images/master_and_margarita.png",
    name: "Мастер и Маргарита",
    author: "Михаил Булгаков",
    year: 1967,
    genres: ["16+", "Роман", "Проза", "Сверхъестественное"],
  ),
  BookItem(
    id: "11",
    previewSrc: "assets/images/storm.png",
    name: "Гроза",
    author: "Александр Островский",
    year: 1860,
    genres: ["12+", "Драматургия", "Классика"],
  ),
];

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    Map<String, BookItem> booksIds = Map.fromIterable(books, key: (b) => b.id);

    var catalogScreen = CatalogScreen(books: booksIds);

    return MaterialApp(
      debugShowCheckedModeBanner: true,
      theme: ThemeData(fontFamily: "Inter"),
      home: Scaffold(body: SafeArea(child: catalogScreen)),
    );
  }
}
