import 'package:flutter/material.dart';

import '../model/quiz.dart';

class QuestionScreen extends StatelessWidget {
  const QuestionScreen({
    super.key,
    required this.question,
    required this.onTap,
  });

  final Question question;
  final void Function(String selectedAnswer) onTap;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            question.title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          ...question.possibleAnswers.map((answer) {
            return SizedBox(
              width: 300,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: ElevatedButton(
                  onPressed: () => onTap(answer),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[300],
                    foregroundColor: Colors.white,
                  ),
                  child: Text(answer),
                ),
              ),
            );
          }).toList(),
        ],
      ),
    );
  }
}
