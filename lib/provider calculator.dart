import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

import 'calculator button.dart';
// import 'package:statemanagement_calculator/calculator%20buttons.dart';


class ProviderCalculatorScreen extends StatefulWidget {
  @override
  _ProviderCalculatorScreenState createState() => _ProviderCalculatorScreenState();
}

class _ProviderCalculatorScreenState extends State<ProviderCalculatorScreen> {
  String _input = '';
  String _result = '0';

  void _appendInput(String value) {
    setState(() {
      _input += value;
    });
  }

  void _clearInput() {
    setState(() {
      _input = '';
      _result = '0';
    });
  }

  void _backspace() {
    if (_input.isNotEmpty) {
      setState(() {
        _input = _input.substring(0, _input.length - 1);
      });
    }
  }

  void _calculateResult() {
    try {
      String expression = _input.replaceAll('×', '*').replaceAll('÷', '/');
      if (expression.contains('%')) {
        expression = expression.replaceAllMapped(RegExp(r'(\d+)%'), (match) {
          return (double.parse(match.group(1)!) / 100).toString();
        });
      }
      final parser = Parser();
      final exp = parser.parse(expression);
      final resultValue = exp.evaluate(EvaluationType.REAL, ContextModel());
      setState(() {
        _result = resultValue.toString();
      });
    } catch (_) {
      setState(() {
        _result = 'Error';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          SizedBox(height: 60,),
          Expanded(
            flex: 3,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: Colors.white,
              ),
              child: GridView.count(
                crossAxisCount: 4,
                padding: const EdgeInsets.all(8),
                children: [
                  CalculatorButton(label: 'C', onTap: _clearInput),
                  CalculatorButton(label: '%', onTap: () => _appendInput('%')),
                  CalculatorButton(label: '⌫', onTap: _backspace),
                  CalculatorButton(label: '÷', onTap: () => _appendInput('÷')),
                  CalculatorButton(label: '7', onTap: () => _appendInput('7')),
                  CalculatorButton(label: '8', onTap: () => _appendInput('8')),
                  CalculatorButton(label: '9', onTap: () => _appendInput('9')),
                  CalculatorButton(label: '×', onTap: () => _appendInput('×')),
                  CalculatorButton(label: '4', onTap: () => _appendInput('4')),
                  CalculatorButton(label: '5', onTap: () => _appendInput('5')),
                  CalculatorButton(label: '6', onTap: () => _appendInput('6')),
                  CalculatorButton(label: '-', onTap: () => _appendInput('-')),
                  CalculatorButton(label: '1', onTap: () => _appendInput('1')),
                  CalculatorButton(label: '2', onTap: () => _appendInput('2')),
                  CalculatorButton(label: '3', onTap: () => _appendInput('3')),
                  CalculatorButton(label: '+', onTap: () => _appendInput('+')),
                  CalculatorButton(label: '.', onTap: () => _appendInput('.')),
                  CalculatorButton(label: '0', onTap: () => _appendInput('0')),
                  CalculatorButton(label: '00', onTap: () => _appendInput('00')),
                  CalculatorButton(label: '=', onTap: _calculateResult),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            alignment: Alignment.bottomRight,
            color: Colors.grey.shade200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  _input,
                  style: const TextStyle(fontSize: 28, color: Colors.black54),
                ),
                const SizedBox(height: 10),
                Text(
                  _result,
                  style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
