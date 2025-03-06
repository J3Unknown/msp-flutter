import 'package:flutter/material.dart';
import 'package:msp_project/layout/todo_layout/todo_layout_screen.dart';
import 'package:msp_project/modules/bmi_calculator/bmi_calculator_screen.dart';
import 'package:msp_project/modules/todo_app/todo_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.S
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TodoLayoutScreen() ,
    );
  }
}