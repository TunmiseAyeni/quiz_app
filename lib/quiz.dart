import 'package:flutter/material.dart';
import 'package:quiz_app/Data/questions.dart';
import 'package:quiz_app/results_screen.dart';
import 'package:quiz_app/start_screen.dart';
import 'package:quiz_app/questions_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers =
      []; //this list will store the answers selected by the user
  var activeScreen = 'StartScreen';

  void switchScreen() {
    setState(() {
      activeScreen = 'QuestionScreen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    //checking if the user has answered all the questions, then we will switch to the start screen
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'ResultsScreen';
      });
    }
    //adding the answer to the list of selected answers
  } //creating the function that will be called when the user selects an answer to store the answer in the list of selected answers

  void restartQuiz(){
    setState(() {
      selectedAnswers = [];
      activeScreen = 'StartScreen';
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == 'QuestionScreen') {
      screenWidget = QuestionScreen(chooseAnswer);
    } else if(activeScreen == 'ResultsScreen') {
      // passing the list of selected answers to the results screen, so we can use it to display the results in the results screen.
      screenWidget =  ResultsScreen(restartQuiz, selectedAnswers: selectedAnswers,);
    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.purple,
        body: screenWidget,
      ),
    );
  }
}
