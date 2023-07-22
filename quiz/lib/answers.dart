import 'package:flutter/material.dart';

class Answers extends StatelessWidget {
  const Answers({super.key, required this.answer, required this.onPress});

  final String answer;
  final void Function() onPress;

  @override
  Widget build(context) {
    return ElevatedButton(
      onPressed: onPress,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
        backgroundColor: const Color.fromARGB(220, 14, 16, 15),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        fixedSize: const Size(30, 45),
      ),
      child: Text(answer, textAlign: TextAlign.center),
    );
  }
}
