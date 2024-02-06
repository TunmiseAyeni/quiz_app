import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen(this.chooseAnswer, {super.key});
  final void Function(String answer) chooseAnswer;

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(String answer) {
    widget.chooseAnswer(answer);
    // we pass answer as a parameter to the function and then pass it to the chooseAnswer function in the stateful widget
    // the special widget object used in the state is used to access functions in the stateful widget
    setState(() {
      currentQuestionIndex += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];
    return Center(
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.questiontext,
              style: GoogleFonts.roboto(
                textStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            //this is converted dynamically into a list of widgets instead of hardcoding the buttons
            //convert the list of answers which is a list of strings into a list of AnswerButton widgets
            //... spread operator is used to remove the square brackets from the list of widgets and make them comma separated
            //the map function goes through each element of the list and returns a new list of widgets which is answeredButtons
            ...currentQuestion.getShuffledAnswers().map((answer) {
              return AnswerButton(
                text: answer,
                onPressed: () {
                  answerQuestion(answer);
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}
