import 'package:flutter/material.dart';

// Q1 - In what scenarios might one approach be more advantageous than another?
//      (in terms of readability, maintainability, performance, etc.)?

// Answer:

// For loop
// Loop in Dart is fast enough for iterating on the list

// Map
// Map is faster compared to for loop and it's what most people prefer

// Dedicate function
// Good for reusability

List<String> colors = ["red", "blue", "green"];

List<Widget> getLabels(List<String> data) {
  return data.map((item) => Text(item)).toList();
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            Label("Method 1: Loop in Array", bold: true),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [for (var color in colors) Text(color)],
            ),
            Label("Method 2: Map", bold: true),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ...colors.map((color) => Text(color)),
              ],
            ),
            Label("Method 23: Dedicated Function", bold: true),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ...getLabels(colors)
              ],
            ),
          ],
        ),
      ),
    ),
  ));
}

class Label extends StatelessWidget {
  const Label(this.text, {super.key, this.bold = false});

  final bool bold;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:
      TextStyle(fontWeight: (bold ? FontWeight.bold : FontWeight.normal)),
    );
  }
}