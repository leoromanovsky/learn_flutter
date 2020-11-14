import 'package:flutter/material.dart';
import 'package:learn_flutter/quiz.dart';
import 'package:learn_flutter/result.dart';
import 'package:learn_flutter/models/transaction.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  final List<Transaction> transactions = [
    Transaction(id: '1', title: 'shoes', amount: 9.99, date: DateTime.now()),
    Transaction(
        id: '2', title: 'groceries', amount: 300.54, date: DateTime.now())
  ];

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
              title: Text(
                  "Today's date: ${DateFormat('M/d/y').format(DateTime.now())}"),
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
