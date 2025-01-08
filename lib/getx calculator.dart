import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';


import 'calculator ui.dart';
import 'calulator controller.dart';


class GetXCalculatorScreen extends StatelessWidget {
  final CalculatorController controller = Get.put(CalculatorController());

  @override
  Widget build(BuildContext context) {
    return CalculatorUI(controller: controller);
  }
}
