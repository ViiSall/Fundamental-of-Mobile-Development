import 'package:flutter/material.dart';
import 'package:w4_s1_practice/Ex2.dart';
import 'package:w4_s1_practice/Ex3.dart';

import 'Ex1.dart';
import 'Ex4.dart';

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
      home: WeatherForecast(),
    );
  }
}
