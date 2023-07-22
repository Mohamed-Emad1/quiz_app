import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/data/questions_screen.dart';
import 'questions_summary.dart';

class Results extends StatelessWidget {
  const Results(
      {super.key, required this.runningScreen, required this.choosenAnswers});

  final List<String> choosenAnswers;
  final void Function() runningScreen;

  List<Map<String, Object>> getData() {
    final List<Map<String, Object>> userResults = [];
    for (var i = 0; i < choosenAnswers.length; i++) {
      userResults.add(
        {
          'Questions_index': i,
          'question': questions[i].text,
          'Correct_answer': questions[i].answers[0],
          'user_answer': choosenAnswers[i],
        },
      );
    }
    return userResults;
  }

  @override
  Widget build(BuildContext context) {
    final numberOfQestions = questions.length;
    final summarydata = getData();
    final correctAnswers = summarydata.where((data) {
      //data is a Map
      return data['Correct_answer'] == data['user_answer'];
    }).toList(); //store length of the list that contains correct answers
    final correctAnswersLength = correctAnswers.length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You have answered $correctAnswersLength of $numberOfQestions questions',
              textAlign: TextAlign.center,
              style: GoogleFonts.playfairDisplay(
                color: const Color.fromARGB(215, 255, 255, 255),
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionsSummary(summarydata), //pass list from function
            const SizedBox(
              height: 20,
            ),
            TextButton.icon(
              onPressed: runningScreen,
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                textStyle: const TextStyle(fontSize: 20),
              ),
              icon: const Icon(
                Icons.autorenew_sharp,
              ),
              label: const Text(
                "Restart Quiz!",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
