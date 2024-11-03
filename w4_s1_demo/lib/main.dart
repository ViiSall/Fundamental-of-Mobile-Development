import 'package:flutter/material.dart';
import 'dart:math';

const String diceImage1 = 'assets/images/dice-1.png';

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() => _DiceRollerState();
}

class _DiceRollerState extends State<DiceRoller> {
  String activeDiceImage = diceImage1;

  void rollDice() {
    setState(() {
      int diceNumber = Random().nextInt(6) + 1;
      activeDiceImage = 'assets/images/dice-$diceNumber.png';
    });
  }

  @override
  Widget build(context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: rollDice,
          child: Image.asset(
            activeDiceImage,
            width: 200,
          ),
        ),
        const SizedBox(height: 20),
        TextButton(
          onPressed: rollDice,
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
            textStyle: const TextStyle(
              fontSize: 28,
            ),
          ),
          child: const Text('Roll Dice'),
        ),
      ],
    );
  }
}

void main() => runApp(const MaterialApp(
  home: Scaffold(
    backgroundColor: Colors.deepPurple,
    body: Center(child: DiceRoller()),
  ),
));
