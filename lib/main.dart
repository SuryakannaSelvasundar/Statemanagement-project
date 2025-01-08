import 'package:calcluator/getx%20calculator.dart';
import 'package:calcluator/image%20picker.dart';
import 'package:calcluator/provider%20calculator.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';


void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CalculatorApp(),
    ),
  );
}

// Main App Widget
class CalculatorApp extends StatefulWidget {
  @override
  _CalculatorAppState createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    ProviderCalculatorScreen(),
    GetXCalculatorScreen(),
    proffii(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 40,
            width: 30, // Set width to match height for a perfect circle
            child: ClipOval(
              child: Image.network(
                "https://media.licdn.com/dms/image/v2/C560BAQHHuhMcDOUAvA/company-logo_200_200/company-logo_200_200/0/1649683807283/radicalstart_logo?e=2147483647&v=beta&t=UJDRQrJaf2BOtfK-9IwzqVqnqD-J84rWqqEyyEvzzP0",
                height: 40,
                width: 30,
                fit: BoxFit.cover, // Ensures the image fills the circle
              ),
            ),
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.only(right:  10),
          child: Text("RadicalStart",style: TextStyle(
            fontSize: 25,
              fontWeight: FontWeight.bold),),
        ),
        backgroundColor: const Color.fromARGB(255, 221, 211, 238),
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: ' Provider',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.circle_rounded),
            label: 'GetX',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.image),
            label: 'Upload',
          ),
        ],
        onTap: _onItemTapped,
      ),
    );
  }
}
