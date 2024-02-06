import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/Data/questions.dart';
import 'package:quiz_app/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(this.restartQuiz,
      {super.key, required this.selectedAnswers});

  final List<String> selectedAnswers;
  final void Function() restartQuiz;

  List<Map> getSummaryData() {
    final List<Map> summaryData = [];
    for (var i = 0; i < selectedAnswers.length; i++) {
      summaryData.add({
        'question_index': i, //this is the index of the question
        'question': questions[i].questiontext, //this is the question
        'correct_answer': questions[i].answers[0], //this is the correct answer
        'user_answer':
            selectedAnswers[i], //this is the answer selected by the user
      });
    }
    return summaryData;
  }

  @override
  Widget build(BuildContext context) {
    var numTotalQuestions = 0;
    numTotalQuestions = questions.length;
    var numCorrectAnswers = 0;
    for (var i = 0; i < selectedAnswers.length; i++) {
      if (selectedAnswers[i] == questions[i].answers[0]) {
        numCorrectAnswers += 1;
      }
    }

    return SizedBox(
      width: double
          .infinity, // this will make the container take the full width of the screen
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // const SizedBox(height: 100),
            Center(
              child: Text(
                'You have answered $numCorrectAnswers out of $numTotalQuestions questions correctly',
                style: GoogleFonts.lato(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(height: 70),
            QuestionsSummary(
              getSummaryData(),
            ), //passing the summary data to the QuestionsSummary widget
            const SizedBox(height: 50),
            OutlinedButton.icon(
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                backgroundColor: Colors.blue,
                shadowColor: Colors.deepPurple,
                elevation: 30,
              ),
              onPressed: () {
                restartQuiz();
              },
              label: const Text(
                'Restart Quiz',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
              icon: const Icon(
                Icons.restart_alt_outlined,
                color: Colors.white,
                size: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
