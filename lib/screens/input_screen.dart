import 'package:flutter/material.dart';

class InputForm extends StatefulWidget {
  @override
  _InputFormState createState() => _InputFormState();
}

class _InputFormState extends State<InputForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora de IMC'),
      ),
      body: Padding(
        padding: EdgeInsets.all(18.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  hintText: 'Digite seu nome',
                  labelText: 'Nome',
                  hintStyle: TextStyle(color: Colors.grey),
                ),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'O nome é obrigatório :) ';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _ageController,
                decoration: const InputDecoration(
                  hintText: 'Digite a sua idade',
                  labelText: 'Idade (opcional)',
                  hintStyle: TextStyle(color: Colors.grey),
                ),
                keyboardType: TextInputType.number,
              ),
              TextFormField(
                controller: _weightController,
                decoration: const InputDecoration(
                  hintText: 'Digite seu peso, por exemplo 82.5',
                  labelText: 'Peso (kg)',
                  hintStyle: TextStyle(color: Colors.grey),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Digite o seu peso!';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _heightController,
                decoration: const InputDecoration(
                  hintText: 'Digite sua altura, por exemplo 180',
                  labelText: 'Altura (cm)',
                  hintStyle: TextStyle(
                      color: Colors.grey),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Digite sua altura!';
                  }
                  return null;
                },
              ),
              SizedBox(height: 18),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(bottom: 16.0),
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState != null &&
                            _formKey.currentState!.validate()) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ResultScreen(
                                name: _nameController.text,
                                age: _ageController.text,
                                weight: _weightController.text,
                                height: _heightController.text,
                              ),
                            ),
                          );
                        }
                      },
                      child: Text('Calcular IMC'),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

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
    double imc = double.tryParse(weight)! /
        (double.tryParse(height)! / 100 * double.tryParse(height)! / 100);

    return Scaffold(
      appBar: AppBar(
        title: Text('Resultado do IMC'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                'Prezado(a) $name, seu IMC calculado é de ${imc.toStringAsFixed(2)}'),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
