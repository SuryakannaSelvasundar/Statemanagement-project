import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import 'getx calculator.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorController extends GetxController {
  var input = ''.obs;
  var result = '0'.obs;

  void appendInput(String value) {
    input.value += value;
  }

  void clearInput() {
    input.value = '';
    result.value = '0';
  }

  void backspace() {
    if (input.isNotEmpty) {
      input.value = input.value.substring(0, input.value.length - 1);
    }
  }

  void calculateResult() {
    try {
      String expression = input.value.replaceAll('×', '*').replaceAll('÷', '/');
      if (expression.contains('%')) {
        expression = expression.replaceAllMapped(RegExp(r'(\d+)%'), (match) {
          return (double.parse(match.group(1)!) / 100).toString();
        });
      }
      final parser = Parser();
      final exp = parser.parse(expression);
      final resultValue = exp.evaluate(EvaluationType.REAL, ContextModel());
      result.value = resultValue.toString();
    } catch (_) {
      result.value = 'Error';
    }
  }
}
