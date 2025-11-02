import 'package:flutter/material.dart';

class Menu3 extends StatefulWidget {
  const Menu3({super.key});

  @override
  State<Menu3> createState() => _Menu3State();
}

class _Menu3State extends State<Menu3> {
  String display = '';
  double num1 = 0;
  double num2 = 0;
  String operator = '';

  void inputNumber(String number) {
    setState(() {
      display += number;
    });
  }

  void selectOperator(String op) {
    setState(() {
      if (display.isNotEmpty) {
        num1 = double.parse(display);
        operator = op;
        display = '';
      }
    });
  }

  void calculate() {
    setState(() {
      if (display.isNotEmpty && operator.isNotEmpty) {
        num2 = double.parse(display);
        double result = 0;

        switch (operator) {
          case '+':
            result = num1 + num2;
            break;
          case '-':
            result = num1 - num2;
            break;
          case 'x':
            result = num1 * num2;
            break;
          case '/':
            if (num2 != 0) {
              result = num1 / num2;
            } else {
              display = 'Error';
              return;
            }
            break;
        }

        display = result.toString();
        operator = '';
        num1 = 0;
        num2 = 0;
      }
    });
  }

  void clear() {
    setState(() {
      display = '';
      num1 = 0;
      num2 = 0;
      operator = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kalkulator'),
      ),
      body: Column(
        children: [
          // Display
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16.0),
            margin: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              border: Border.all(),
            ),
            child: Text(
              display,
              style: const TextStyle(fontSize: 24),
              textAlign: TextAlign.right,
            ),
          ),

          // Buttons
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      _buildButton('7'),
                      _buildButton('8'),
                      _buildButton('9'),
                      _buildButton('/'),
                    ],
                  ),
                  Row(
                    children: [
                      _buildButton('4'),
                      _buildButton('5'),
                      _buildButton('6'),
                      _buildButton('x'),
                    ],
                  ),
                  Row(
                    children: [
                      _buildButton('1'),
                      _buildButton('2'),
                      _buildButton('3'),
                      _buildButton('-'),
                    ],
                  ),
                  Row(
                    children: [
                      _buildButton('C'),
                      _buildButton('0'),
                      _buildButton('='),
                      _buildButton('+'),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Kembali'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButton(String text) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: ElevatedButton(
          onPressed: () {
            if (text == 'C') {
              clear();
            } else if (text == '=') {
              calculate();
            } else if (text == '+' || text == '-' || text == 'x' || text == '/') {
              selectOperator(text);
            } else {
              inputNumber(text);
            }
          },
          child: Text(text),
        ),
      ),
    );
  }
}