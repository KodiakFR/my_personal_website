import 'dart:ui';

import 'package:flutter/material.dart';

import 'Screens/Index.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Maxime Braud',
      theme: ThemeData(
        iconTheme: const IconThemeData(color: Colors.white),
        canvasColor: const Color.fromARGB(255, 35, 89, 133),
        textTheme:  const TextTheme(
            headline4: TextStyle(
          color: Colors.white,
        ),
        headline3: TextStyle(color: Colors.red, decoration: TextDecoration.underline)
        ),
        primarySwatch: Colors.blue,
      ),
      home: const Index(),
    );
  }
}
