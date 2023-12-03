import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final String name;
  final String age;
  final String weight;
  final String height;

  ResultScreen({
    required this.name,
    required this.age,
    required this.weight,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
   // Calculo do IMC
    double imc = double.parse(weight) / (double.parse(height) * double.parse(height));

    return Scaffold(
      appBar: AppBar(
        title: Text('Resultado do IMC'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Prezado(a) $name, seu IMC calculado é de ${imc.toStringAsFixed(2)}'),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
