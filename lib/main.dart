import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:learn_flutter/quiz.dart';
import 'package:learn_flutter/result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _totalScore = 0;
  var _questionIndex = 0;
  final _questions = [
    {
      'questionText': "What is going on?",
      'answers': [
        {'text': 'good', 'score': 1},
        {'text': 'decent', 'score': 3},
        {'text': 'amazing!', 'score': 2}
      ]
    },
    {
      'questionText': "What is your favorite color?",
      'answers': [
        {'text': 'red', 'score': 1},
        {'text': 'green', 'score': 3},
        {'text': 'white!', 'score': 2},
        {'text': 'blue!', 'score': 2},
      ]
    }
  ];

  void _resetQuiz() {
    setState(() {
      _totalScore = 0;
      _questionIndex = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Hello world!',
        home: Scaffold(
            appBar: AppBar(
              title: Text("This is the app."),
            ),
            body: _questionIndex < _questions.length
                ? Quiz(
                    questions: _questions,
                    answerQuestion: _answerQuestion,
                    questionIndex: _questionIndex,
                  )
                : Result(_totalScore, _resetQuiz)));
  }
}
