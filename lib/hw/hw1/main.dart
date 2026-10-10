// ЛР 1 — шесть независимых виджетов.
//
// Как сдавать: скопируйте этот файл целиком себе в main.dart, допишите
// шесть функций ниже вместо TODO, запустите — все шесть элементов должны
// появиться на экране. Пришлите готовый файл на проверку.
//
// Основной виджет трогать не нужно. Редактируйте там, где написано TODO.

import 'package:flutter/material.dart';

void main() {
  runApp(const Lab1App());
}

class Lab1App extends StatelessWidget {
  const Lab1App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('ЛР 1')),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Task 1:',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              task1(),
              const SizedBox(height: 4),
              Divider(),
              const SizedBox(height: 4),
              Text(
                'Task 2:',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              task2(),

              const SizedBox(height: 4),
              Divider(),
              const SizedBox(height: 4),
              Text(
                'Task 3:',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              task3(),
              const SizedBox(height: 4),
              Divider(),
              const SizedBox(height: 4),
              Text(
                'Task 4:',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              task4(),
              const SizedBox(height: 4),
              Divider(),
              const SizedBox(height: 4),
              Text(
                'Task 5:',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              task5(),
              const SizedBox(height: 4),
              Divider(),
              const SizedBox(height: 4),
              Text(
                'Task 6:',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              task6(),
            ],
          ),
        ),
      ),
    );
  }
}

// 1. Заголовок — Text, крупный жирный текст чёрного цвета, обрезается в одну строку, если не помещается.
Widget task1() {
  return Text(
    'Заголовок',
    maxLines: 1,
    style: TextStyle(
      fontSize: 24,
      overflow: TextOverflow.ellipsis,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
  );
}

// 2. Подпись — небольшой, нежирный курсивный текст белого цвета, обрезается в две строки.
// Также реализуйте подложку из тёмно-серого контейнера с закруглениями, чтобы текст было видно
Widget task2() {
  return Container(
    decoration: BoxDecoration(
      color: Colors.grey.shade700,
      borderRadius: BorderRadius.circular(5),
    ),
    child: Padding(
      padding: EdgeInsets.all(5),
      child: Text(
        'Многостроковая\n подпись',
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.normal,
          fontStyle: FontStyle.italic,
          color: Colors.white,
        ),
      ),
    ),
  );
}

// 3. Иконка — любая Icon на ваш вкус,
// с применением цвета и размером.
Widget task3() {
  return Icon(Icons.apps, size: 50, color: Colors.deepPurpleAccent);
}

// 4. Кнопка с иконкой избранного — большая иконка сердца красного цвета без фона.
// При нажатии пишет в консоль "Вы добавили в избранное"
Widget task4() {
  return IconButton(
    onPressed: () {
      // ignore: avoid_print
      print('Вы добавили в избранное');
    },
    icon: Icon(Icons.favorite, color: Colors.red, size: 32),
  );
}

// 5. Кнопка «Подробнее» — кнопка с текстом и обводкой, при нажатии пишет в консоль "Узнать детали"
Widget task5() {
  return TextButton(
    onPressed: () {
      // ignore: avoid_print
      print("Узнать детали");
    },
    style: ElevatedButton.styleFrom(
      side: BorderSide(color: Colors.orange, width: 2),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(5),
      ),
    ),
    child: Text(
      'Подробнее',
      style: TextStyle(color: Colors.black, fontSize: 14),
    ),
  );
}

// 6. Изображение в стиле Polaroid—  выберите любое из каталога по ссылке
// https://picsum.photos/ (необходим vpn), либо используйте https://docs.flutter.dev/assets/images/dash/dash-fainting.gif
// Добавьте чёрную обводку, а внутри белую рамку в стиле фотографии Polaroid (https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSAeKRHzUEOMCX836O6p8R5-XBkrSlf8C4go4C7f1q8ClnmlFaV9emSrUFL&s=10)
// Для реализации используйте Container
Widget task6() {
  return Container(
    width: 200,
    height: 200,
    padding: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 55),
    decoration: BoxDecoration(
      color: Color.fromRGBO(232, 232, 232, 1),
      boxShadow: [
        BoxShadow(color: Colors.black, blurRadius: 0.3),
      ],
    ),
    alignment: AlignmentGeometry.topCenter,
    child: Container(
      decoration: BoxDecoration(
        border: BoxBorder.all(color: Colors.black, width: 0.7),
      ),
      child: Image.network(
        'https://docs.flutter.dev/assets/images/dash/dash-fainting.gif',
        height: 200,
        fit: BoxFit.cover,
      ),
    ),
  );
}
