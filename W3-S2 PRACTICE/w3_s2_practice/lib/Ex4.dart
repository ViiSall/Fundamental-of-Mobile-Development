import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    required this.text,
    required this.color,
    this.mixColor,
  });

  final String text;
  final Color color;
  final Color? mixColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [color, mixColor ?? color],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white, // Set text color
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class Ex4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('This is my Ex4...'),
        ),
        body: Center(
          child: Container(
            padding: EdgeInsets.all(30),
            margin: EdgeInsets.symmetric(vertical: 24),
            child: Column(
              children: [
                CustomCard(
                  text: 'OOP',
                  color: Colors.blue[300]!,
                ),
                CustomCard(
                  text: 'DART',
                  color: Colors.blue[600]!,
                ),
                CustomCard(
                  text: 'FLUTTER',
                  color: Colors.blue[300]!,
                  mixColor: Colors.blue[900]!,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
