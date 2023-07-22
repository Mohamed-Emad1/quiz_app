import 'package:flutter/material.dart';
import 'package:quiz/data/questions_screen.dart';
import 'package:quiz/quiestions.dart';
import 'package:quiz/results.dart';
import 'gradient_sd.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  Widget? screen;
  @override
  void initState() {
    //used when initialize State object
    screen = StartScreen(runningScreen);
    super.initState();
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      // need to be removed from here and remove it in results screeen
      setState(() {
        screen = Results(
          runningScreen: runningScreen,
          choosenAnswers: selectedAnswers,
        );
      });
    }
  }

  void runningScreen() {
    setState(() {
      selectedAnswers = [];
      screen = QuestuinsScreen(onSelectedAnswer: chooseAnswer);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 10, 218, 17),
              Color.fromARGB(255, 7, 140, 12)
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
            border: Border(
              top: BorderSide(color: Colors.black, style: BorderStyle.solid),
              right: BorderSide(color: Colors.black, style: BorderStyle.solid),
              left: BorderSide(color: Colors.black, style: BorderStyle.solid),
            ),
          ),
          child: screen,
        ),
      ),
    );
  }
}
