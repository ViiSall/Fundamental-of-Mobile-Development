import 'package:flutter/material.dart';

class Ex1 extends StatelessWidget {
  const Ex1({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text(
            'Visal is the best!!!',
            style: TextStyle(
              color: Colors.orange,
              fontSize: 50,
            ),
          ),
        ),
      ),
    );
  }
}
