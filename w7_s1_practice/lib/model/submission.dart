import 'package:w7_s1_practice/model/quiz.dart';

class Answer {
  final String questionAnswer;
  final String correctAnswer;

  Answer({required this.questionAnswer, required this.correctAnswer});

  bool isCorrect() {
    return questionAnswer == correctAnswer;
  }
}

class Submission {
  final Map<Question, Answer> _answers = {};

  int getScore() {
    int score = 0;
    for (var answer in _answers.values) {
      if (answer.isCorrect()) {
        score++;
      }
    }
    return score;
  }

  Answer? getAnswerFor(Question question) {
    return _answers[question];
  }

  void addAnswer(Question question, String userAnswer) {
    _answers[question] = Answer(
      questionAnswer: userAnswer,
      correctAnswer: question.goodAnswer,
    );
  }

  void removeAnswers() {
    _answers.clear();
  }

}
