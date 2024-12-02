import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String output = '0';
  String _output = '0';

  buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == 'C') {
        _output = '0';
      } else if (buttonText == '=') {
        _output = _calculate(_output);
      } else {
        if (_output == '0') {
          _output = buttonText;
        } else {
          _output += buttonText;
        }
      }
    });
  }

  String _calculate(String input) {
    try {
      final result = _evaluateExpression(input);
      return result.toString();
    } catch (e) {
      return 'Error';
    }
  }

  double _evaluateExpression(String expression) {
    // Aqui você pode usar uma biblioteca para avaliação matemática (como 'expressions')
    // ou implementar uma lógica básica para cálculos.
    return 0.0; // Simulação de um cálculo
  }

  Widget buildButton(String buttonText) {
    return ElevatedButton(
      onPressed: () => buttonPressed(buttonText),
      child: Text(
        buttonText,
        style: TextStyle(fontSize: 24),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              _output,
              style: TextStyle(fontSize: 48),
            ),
            GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                childAspectRatio: 1.5,
              ),
              itemCount: 16,
              itemBuilder: (BuildContext context, int index) {
                String buttonText = '';
                if (index == 0) buttonText = '7';
                if (index == 1) buttonText = '8';
                if (index == 2) buttonText = '9';
                if (index == 3) buttonText = '/';
                if (index == 4) buttonText = '4';
                if (index == 5) buttonText = '5';
                if (index == 6) buttonText = '6';
                if (index == 7) buttonText = '*';
                if (index == 8) buttonText = '1';
                if (index == 9) buttonText = '2';
                if (index == 10) buttonText = '3';
                if (index == 11) buttonText = '-';
                if (index == 12) buttonText = '0';
                if (index == 13) buttonText = '=';
                if (index == 14) buttonText = 'C';
                if (index == 15) buttonText = '+';

                return buildButton(buttonText);
              },
            ),
          ],
        ),
      ),
    );
  }
}