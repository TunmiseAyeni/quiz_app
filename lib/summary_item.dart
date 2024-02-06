import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/questions_identifier.dart';

class SummaryItem extends StatelessWidget {
  const SummaryItem(this.summaryData, {super.key});

  final Map summaryData;

  @override
  Widget build(BuildContext context) {
    final isCorrect =
        summaryData['user_answer'] == summaryData['correct_answer'];
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        QuestionsIdentifier(
            questionIndex: (summaryData['question_index'] as int),
            isCorrect: isCorrect),
        const SizedBox(height: 40),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                summaryData['question'],
                style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 10),
              Text(summaryData['user_answer'],
              style: const TextStyle(
                color: Colors.grey,
              ),
              ),
              Text(summaryData['correct_answer'],
              style: const  TextStyle(
                color: Colors.green,
              ),
              )
            ],
          ),
        )
      ],
    );
  }
}
