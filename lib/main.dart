import 'package:flutter/material.dart';
import 'package:calculadora_imc/screens/input_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora de IMC',
      theme: ThemeData(
        primaryColor: Colors.blue,
        hintColor: Colors.blue,
        fontFamily: 'Roboto',
      ),
      home: InputForm(),
    );
  }
}
