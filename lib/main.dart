import 'package:flutter/material.dart';
import 'package:msp_project/bmi_calculator/bmi_calculator_screen.dart';
import 'package:msp_project/bmi_calculator/bmi_result_screen.dart';
import 'package:msp_project/counter_app/counter_app_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BmiCalculatorScreen(),
    );
  }
}