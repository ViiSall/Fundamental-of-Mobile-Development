import 'package:flutter/material.dart';

import '../model/quiz.dart';

class Submission {
  final List<String> selectedAnswers;

  Submission(this.selectedAnswers);
}

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key,
    required this.onRestart,
    required this.submission,
    required this.quiz,
  });

  final VoidCallback onRestart;
  final Submission submission;
  final Quiz quiz;

  @override
  Widget build(BuildContext context) {
    int score = 0;
    for (int i = 0; i < submission.selectedAnswers.length; i++) {
      if (submission.selectedAnswers[i] == quiz.questions[i].goodAnswer) {
        score++;
      }
    }

    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 40),
          Text(
            'You answered $score on ${quiz.questions.length}!',
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          // Display question results
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: quiz.questions.length,
              itemBuilder: (context, index) {
                final question = quiz.questions[index];
                final selectedAnswer = submission.selectedAnswers[index];
                final isCorrect = selectedAnswer == question.goodAnswer;

                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.0),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 4,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundColor:
                              isCorrect ? Colors.green : Colors.red,
                              child: Text(
                                '${index + 1}',
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                question.title,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        ...question.possibleAnswers.map((answer) {
                          final isSelected = answer == selectedAnswer;
                          final isGoodAnswer = answer == question.goodAnswer;
                          return Row(
                            children: [
                              Icon(
                                isGoodAnswer
                                    ? Icons.check_circle
                                    : isSelected
                                    ? Icons.cancel
                                    : Icons.circle_outlined,
                                color: isGoodAnswer
                                    ? Colors.green
                                    : isSelected
                                    ? Colors.red
                                    : Colors.grey,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                answer,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: isSelected
                                      ? Colors.black
                                      : Colors.black54,
                                  fontWeight: isSelected
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                ),
                              ),
                            ],
                          );
                        }).toList(),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton.icon(
            onPressed: onRestart,
            icon: const Icon(Icons.restart_alt),
            label: const Text('Restart Quiz'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: const Color(0xFF007BFF), // Blue text
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
              textStyle: const TextStyle(fontSize: 18),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
          const SizedBox(height: 40),
        ],
      );
  }
}
