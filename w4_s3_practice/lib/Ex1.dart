import 'package:flutter/material.dart';

class SelectButton extends StatefulWidget {
  const SelectButton({super.key});

  @override
  _SelectButtonState createState() => _SelectButtonState();
}

class _SelectButtonState extends State<SelectButton> {
  bool isSelected = false;

  void selectButton() {
    setState(() {
      isSelected = !isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 100,
      child: Center(
        child: ElevatedButton(
          onPressed: selectButton,
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20), // Increase button size
            backgroundColor: isSelected ? Colors.blue[500] : Colors.blue[50], // Change color
            foregroundColor: isSelected ? Colors.white : Colors.black, // Text color
            textStyle: const TextStyle(fontSize: 24), // Text size
          ),
          child: Text(isSelected ? 'Selected' : 'Not selected'), // Change text
        ),
      ),
    );
  }
}

class Ex1 extends StatefulWidget {
  const Ex1({super.key});

  @override
  State<Ex1> createState() => _Ex1State();
}

class _Ex1State extends State<Ex1> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Statefull widget - button'),
        ),
        body: const Center(
          child: Column(
            children: [
              SelectButton(),
              SelectButton(),
              SelectButton(),
              SelectButton(),
            ],
          ),
        ),
      ),
    );
  }
}
