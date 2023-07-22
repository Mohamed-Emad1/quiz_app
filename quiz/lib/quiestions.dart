import 'package:flutter/material.dart';
import 'package:quiz/answers.dart';
import 'package:quiz/data/questions_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestuinsScreen extends StatefulWidget {
  const QuestuinsScreen({super.key, required this.onSelectedAnswer});

  final void Function(String name) onSelectedAnswer;
  @override
  State<QuestuinsScreen> createState() {
    return _QuestuinsScreenState();
  }
}

class _QuestuinsScreenState extends State<QuestuinsScreen> {
  var questionsIndex = 0;

  void answerQuestions(String answer) {
    widget.onSelectedAnswer(answer);
    setState(() {
      questionsIndex += 1;
    });
  }

  @override
  Widget build(context) {
    final currentquestion = questions[questionsIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              currentquestion.text,
              style: GoogleFonts.playfairDisplay(
                  fontSize: 20,
                  color: const Color.fromARGB(233, 255, 255, 255),
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ...currentquestion.getShuffledAnswers().map((ans) {
              return Answers(
                answer: ans,
                onPress: () {
                  answerQuestions(ans);
                },
              );
            })
          ],
        ),
      ),
    );
  }
}
