import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsIdentifier extends StatelessWidget {
  const QuestionsIdentifier(
    {
    super.key,
    required this.questionIndex,
    required this.isCorrect,
    }
    );
  final int questionIndex;
  final bool isCorrect;

  @override
  Widget build(BuildContext context) {
    final int questionNumber = questionIndex + 1;
    return Container(
      height: 30,
      width: 30,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: isCorrect ? Colors.green : Colors.red, //if the answer is correct, the color will be green, else it will be red
      ),
      child: Text(
        questionNumber.toString(),
        style: GoogleFonts.lato(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}