import 'package:flutter/material.dart';
import 'package:todo_ui_app/views/first_screen.dart';

void main() {
  runApp(const MyApp());
}

// class Student {
// //   String name;
// //   String fatherName;
// //   List<String>? subjects;

// //   Student({required this.name, required this.fatherName, this.subjects, id});
// // }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: frontPage());
  }
}
