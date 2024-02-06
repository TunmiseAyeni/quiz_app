// Purpose: Model for quiz questions

class QuizQuestion {
  const QuizQuestion(this.questiontext, this.answers);

  final String questiontext;
  final List<String> answers;

// creating a function to shuffle the answers
  List<String> getShuffledAnswers() {
    //shuffle can only be used on a list
    //.shuffle will change the original order of the list that is why we make a copy of the list
    //List.of creates a new copied list based on the old list i.e answers, basically copies an existing list
    //we shuffle the copied list because we don't want to change the original list
    final shuffledAnswers = List.of(answers);// the copied list is stored in shuffledAnswers
    shuffledAnswers.shuffle();//shuffling the copied list
    return shuffledAnswers;
  }
}
