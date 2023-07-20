// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        // we put this here to minimize every space from this widgets taken
        // in this column
        mainAxisSize: MainAxisSize.min,
        children: [
          // before adding the image here in code, don't forget to add it in
          // the pubspec.ymal file in assets
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
            color: const Color.fromARGB(150, 255, 255, 255),
          ),
          // we add the SizedBox's to put some space between the elements
          const SizedBox(
            height: 80,
          ),
          Text(
            'Learn Flutter the fun way',
            style: GoogleFonts.lato(
              color: const Color.fromARGB(255, 245, 208, 248),
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 30),
          // there will be diffrent kind of Button if you watch it in the
          // flutter Documentation
          OutlinedButton.icon(
            onPressed: () {
              startQuiz();
            },
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.orangeAccent,
            ),
            icon: const Icon(
              Icons.arrow_right_alt,
            ),
            label: const Text(
              'Start Quiz',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
