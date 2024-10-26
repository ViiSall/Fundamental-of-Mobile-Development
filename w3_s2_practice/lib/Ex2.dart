import 'package:flutter/material.dart';

class Ex2 extends StatelessWidget {
  const Ex2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue[300],
      padding: const EdgeInsets.all(24),
      margin: const EdgeInsets.all(16),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue[600],
          borderRadius: BorderRadius.circular(20),
        ),
        child: const Center(
          child: Text(
            'CADT STUDENTS',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              decoration: TextDecoration.none,
            ),
          ),
        ),
      ),
    );
  }
}
