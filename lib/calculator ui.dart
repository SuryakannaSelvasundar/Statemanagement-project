import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
// import 'package:get/get.dart';
// import 'package:statemanagement_calculator/calculator%20buttons.dart';
// import 'package:statemanagement_calculator/calculator%20controller.dart';

import 'calculator button.dart';
import 'calulator controller.dart';


class CalculatorUI extends StatelessWidget {
  final CalculatorController controller;

  const CalculatorUI({Key? key, required this.controller}) : super(key: key);

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
                color: Colors.white,
                borderRadius: BorderRadius.circular(40),
              ),
              child: GridView.count(
                crossAxisCount: 4,
                padding: const EdgeInsets.all(8),
                children: [
                  CalculatorButton(label: 'C', onTap: controller.clearInput),
                  CalculatorButton(label: '%', onTap: () => controller.appendInput('%')),
                  CalculatorButton(label: '⌫', onTap: controller.backspace),
                  CalculatorButton(label: '÷', onTap: () => controller.appendInput('÷')),
                  CalculatorButton(label: '7', onTap: () => controller.appendInput('7')),
                  CalculatorButton(label: '8', onTap: () => controller.appendInput('8')),
                  CalculatorButton(label: '9', onTap: () => controller.appendInput('9')),
                  CalculatorButton(label: '×', onTap: () => controller.appendInput('×')),
                  CalculatorButton(label: '4', onTap: () => controller.appendInput('4')),
                  CalculatorButton(label: '5', onTap: () => controller.appendInput('5')),
                  CalculatorButton(label: '6', onTap: () => controller.appendInput('6')),
                  CalculatorButton(label: '-', onTap: () => controller.appendInput('-')),
                  CalculatorButton(label: '1', onTap: () => controller.appendInput('1')),
                  CalculatorButton(label: '2', onTap: () => controller.appendInput('2')),
                  CalculatorButton(label: '3', onTap: () => controller.appendInput('3')),
                  CalculatorButton(label: '+', onTap: () => controller.appendInput('+')),
                  CalculatorButton(label: '.', onTap: () => controller.appendInput('.')),
                  CalculatorButton(label: '0', onTap: () => controller.appendInput('0')),
                  CalculatorButton(label: '00', onTap: () => controller.appendInput('00')),
                  CalculatorButton(label: '=', onTap: controller.calculateResult),
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
                Obx(() => Text(
                  controller.input.value,
                  style: const TextStyle(fontSize: 28, color: Colors.black54),
                )),
                const SizedBox(height: 10),
                Obx(() => Text(
                  controller.result.value,
                  style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
