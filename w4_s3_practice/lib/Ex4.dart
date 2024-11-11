import 'package:flutter/material.dart';

class Ex4 extends StatelessWidget {
  const Ex4({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        padding: const EdgeInsets.all(20),
        color: Colors.green[500],
        child: const Column(
          children: [
            ScoreBar(),
            ScoreBar(),
          ],
        ),
      ),
    );
  }
}

class ScoreBar extends StatefulWidget {
  const ScoreBar({super.key});

  @override
  State<ScoreBar> createState() => _ScoreBarState();
}

class _ScoreBarState extends State<ScoreBar> {
  int score = 0;

  void increaseScore() {
    setState(() {
      if (score < 10) score++;
    });
  }

  void decreaseScore() {
    setState(() {
      if (score > 0) score--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text(
              "My score in Flutter",
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  decoration: TextDecoration.none),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: decreaseScore, icon: const Icon(Icons.remove)),
                const SizedBox(
                  width: 40,
                ),
                IconButton(
                    onPressed: increaseScore, icon: const Icon(Icons.add)),
              ],
            ),
            Stack(
              children: [
                Container(
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey[500]!),
                  ),
                ),
                FractionallySizedBox(
                  widthFactor: score / 10,
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 0, 255 - (score * 8), 8),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(
    const Ex4(),
  );
}
