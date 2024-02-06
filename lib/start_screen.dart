import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class StartScreen extends StatelessWidget {
  const StartScreen(
    this.switchScreen,
    {super.key});
  final void Function() switchScreen;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 250,
            color: const Color.fromARGB(127, 255, 255, 255), //adding transparency to the image
            ),
            const SizedBox(height: 100),
             Text(
              'Learn Flutter the fun way!',
              style: GoogleFonts.poppins(
                textStyle:const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
              )
              ),
            ),
            const SizedBox(height: 30),
                OutlinedButton.icon(
                  onPressed: () {
                    switchScreen();
                  },
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    backgroundColor: Colors.blue,
                    shadowColor: Colors.deepPurple,
                    elevation: 30,     
                  ),
                  icon: const Icon(
                    Icons.arrow_right_alt_outlined,
                    color: Colors.white ,
                    size: 40,
                  ),
                  label: const Text(
                    'Start Quiz',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
      ),
    );
  }
}