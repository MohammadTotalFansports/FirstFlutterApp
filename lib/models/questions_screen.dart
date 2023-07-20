class QuizQuestion {
  const QuizQuestion(this.text, this.answers);

  final String text;
  final List<String> answers;

  List<String> getShuffeldAnsers() {
    // we made a copy of the Answers List here to maintain the orginal
    // and get the copy shuffeld
    final shuffledList = List.of(answers);
    shuffledList.shuffle();
    return shuffledList;
  }
}
