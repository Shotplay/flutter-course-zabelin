import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(
              children: [
                Text(
                  'IconButton:',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                iconButton(),
                const SizedBox(height: 4),
                Divider(),
                const SizedBox(height: 4),
                Text(
                  'TextButton:',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                textButton(),
                const SizedBox(height: 4),
                Divider(),
                const SizedBox(height: 4),
                Text(
                  'InkWell:',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                inkWell(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget inkWell() {
    return InkWell(child: Text('InkWell кнопка'));
  }

  Widget textButton() {
    return TextButton(onPressed: () {}, child: Text('Тектовая кнопка'));
  }

  Widget iconButton() {
    return IconButton(
      onPressed: () {},
      icon: Icon(Icons.delete),
      color: Colors.red,
    );
  }
}
