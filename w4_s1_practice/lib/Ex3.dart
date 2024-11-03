import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Color color;
  final String label;
  final IconData icon;
  final Color textColor;

  const CustomButton({super.key,
    required this.color,
    required this.label,
    required this.icon,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: 400,
      child: ElevatedButton.icon(
        onPressed: () {},
        icon: Icon(
            icon,
            color: textColor
        ),
        label: Text(
          label,
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.w500,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          minimumSize: const Size(250, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }
}

class Ex3 extends StatelessWidget {
  const Ex3({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Custom Buttons'),
        ),
        backgroundColor: Colors.white,
        body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButton(
                color: Colors.blue,
                label: 'Submit',
                icon: Icons.check,
                textColor: Colors.black54,
              ),
              CustomButton(
                color: Colors.green, // Green color
                label: 'Time',
                icon: Icons.access_time,
                textColor: Colors.black54,
              ),
              CustomButton(
                color: Colors.grey, // Gray color
                label: 'Account',
                icon: Icons.account_tree,
                textColor: Colors.black54,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

