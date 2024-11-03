import 'package:flutter/material.dart';

class HobbyCard extends StatelessWidget {
  const HobbyCard({
    super.key,
    required this.text,
    this.color = Colors.blue,
    required this.icon,
  });

  final String text;
  final Color? color;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          icon,
          const SizedBox(width: 20), // Adds space between icon and text
          Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class Ex1 extends StatelessWidget {
  const Ex1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('This is my Hobbies...'),
        ),
        body: const Padding(
          padding: EdgeInsets.all(30.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                HobbyCard(
                  text: 'Travelling',
                  color: Colors.green,
                  icon: Icon(Icons.travel_explore, color: Colors.white),
                ),
                HobbyCard(
                  text: 'Skating',
                  color: Colors.grey,
                  icon: Icon(Icons.skateboarding, color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
