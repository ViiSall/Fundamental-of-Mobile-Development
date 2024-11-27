import 'package:flutter/material.dart';
import 'package:w7_s1_practice/screens/question_screen.dart';
import 'package:w7_s1_practice/screens/result_screen.dart';
import 'package:w7_s1_practice/screens/welcome_screen.dart';
import 'model/quiz.dart';

enum QuizState { notStarted, started, finished }

class QuizApp extends StatefulWidget {
  const QuizApp(this.quiz, {super.key});

  final Quiz quiz;

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  QuizState quizState = QuizState.notStarted;
  int currentQuestionIndex = 0;
  Submission submission = Submission([]);

  void startQuiz() {
    setState(() {
      quizState = QuizState.started;
      currentQuestionIndex = 0;
    });
  }

  void answerQuestion(String selectedAnswer) {
    setState(() {
      submission.selectedAnswers.add(selectedAnswer);
      if (currentQuestionIndex == widget.quiz.questions.length - 1) {
        quizState = QuizState.finished;
      } else {
        currentQuestionIndex++;
      }
    });
  }

  void restartQuiz() {
    setState(() {
      quizState = QuizState.notStarted;
      currentQuestionIndex = 0;
      submission = Submission([]);
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screen;

    switch (quizState) {
      case QuizState.notStarted:
        screen = WelcomeScreen(startQuiz: startQuiz);
        break;
      case QuizState.started:
        screen = QuestionScreen(
          question: widget.quiz.questions[currentQuestionIndex],
          onTap: answerQuestion,
        );
        break;
      case QuizState.finished:
        screen = ResultScreen(
          onRestart: restartQuiz,
          submission: submission,
          quiz: widget.quiz,
        );
        break;
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blue[500],
        body: screen,
      ),
    );
  }
}
