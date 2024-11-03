import 'package:flutter/material.dart';
import 'package:w3_s2_practice/Ex2.dart';
import 'package:w3_s2_practice/Ex3.dart';
import 'package:w3_s2_practice/Ex4.dart';

import 'Ex1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Ex4(), // Ex1, Ex2, Ex3, Ex4
    );
  }
}
