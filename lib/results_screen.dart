import 'package:flutter/material.dart';
import 'package:test_sample/data/questions.dart';

import 'package:test_sample/questions_summary/questions_summary.dart';

class ResulstScreen extends StatelessWidget {
  const ResulstScreen({
    super.key,
    required this.chosenAnswers,
    required this.onRestart,
  });

  final List<String> chosenAnswers;
  final void Function() onRestart;

  // we do here Map data Structre where it accepts Keys and Values
  // we specife the Keyes here as Strings but the Values from Object datatype
  // which could accepts any kind of value

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      // we added here a Map list from keys and values
      // the keys are String and we sperate them by using colon (:)
      // to there Values ....
      //
      summary.add(
        {
          'question_index': i,
          'question': questions[i].text,
          'correct_answer': questions[i].answers[0],
          'user_answer': chosenAnswers[i]
        },
      );
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    // with where function we are cheacking if the statment ture, then we
    // passing the data to summaryData, und when its false then we drop it.
    // in that we are savin it in a new List but thought its we are matching
    // it with number of corrcetQuestions then we should add lenth at the end.
    final numCorrectQuestions = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answerd $numCorrectQuestions out of $numTotalQuestions questions correctly!',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            QuestionsSummary(summaryData),
            const SizedBox(
              height: 20,
            ),
            TextButton.icon(
              onPressed: onRestart,
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
              ),
              icon: const Icon(
                Icons.refresh_rounded,
              ),
              label: const Text(
                'Restart Quiz!',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
