import 'package:flutter/material.dart';
import 'package:my_personal_website/Controller/page_controller.dart';

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
        canvasColor: const Color.fromARGB(255, 65, 115, 156),
        textTheme:   TextTheme(
            headline1: TextStyle(
              color: Colors.blue[300]
              
            ),
             headline2: TextStyle(
              color: Colors.blue[400]
            ),
            headline5: TextStyle(
              color: Colors.blue[900]
            )       
        ),
        
        primarySwatch: Colors.blue,
      ),
      home: const CustomPageController(),
    );
  }
}
