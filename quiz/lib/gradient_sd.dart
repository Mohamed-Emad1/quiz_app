import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: camel_case_types
class StartScreen extends StatelessWidget {
  const StartScreen(this.StartQuiz, {super.key});

  // ignore: non_constant_identifier_names
  final void Function() StartQuiz;

  //final Color color; //for background color

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            color: const Color.fromARGB(160, 255, 255, 255),
            'images/quiz-logo.png',
            width: 300,
          ),
          const SizedBox(height: 40),
          Text(
            'Learn Flutter in a Fun way!',
            style: GoogleFonts.playfairDisplay(
                color: Colors.white,
                fontSize: 30.5,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 30),
          OutlinedButton.icon(
            onPressed: StartQuiz,
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
              textStyle: const TextStyle(fontSize: 22),
            ),
            icon: const Icon(Icons.arrow_right_alt),
            label: const Text('Start Quiz'),
            // child: const Text('Learn Flutter in a Fun way'),
          ),
        ],
      ),
    );
  }
}
