import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const CalculatorButton({
    Key? key,
    required this.label,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: label == '='
              ? const Color(0xFF673AB7)
              : label == 'C' || label == '%' || label == '⌫'
              ? const Color(0xFFF5F5F5)
              : ['+', '-', '×', '÷'].contains(label)
              ? const Color(0xFFFF9800)
              : const Color.fromARGB(255, 231, 237, 252),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: label == '=' || ['+', '-', '×', '÷'].contains(label)
                  ? Colors.white
                  : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
