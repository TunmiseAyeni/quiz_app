import 'package:flutter/material.dart';
import 'package:quiz_app/summary_item.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map> summaryData;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        // this will make the column i.e the single child scrollable
        child: Column(
            children: summaryData.map((data) {
          return SummaryItem(data);
        }).toList() // this will convert the list of maps into a list of widgets
  ),
      ),
    );
  }
}
