import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton
  (
    {
      super.key,
      required this.text,
      required this.onPressed,
      }
      );
  final String text;
  final VoidCallback onPressed;


  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          horizontal: 40,
          vertical: 10,
          ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
        backgroundColor: const Color.fromARGB(255, 13, 1, 34),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
