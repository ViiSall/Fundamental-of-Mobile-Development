import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Center(
          child: Column(children: [
        Container(
          height: 200,
          margin: const EdgeInsets.only(top: 100),
          color: Colors.blue,
        ),
        Container(
          child: Row(
            children: [
              Container(
                width: 310,
                height: 100,
                color: Colors.green,
              ),
              Container(
                width: 100,
                  height: 100,
                  color: Colors.pink
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 100,
              height: 100,
              color: Colors.yellow,
            ),
            Container(
              width: 100,
              height: 100,
              color: Colors.yellow,
            ),
            Container(
              width: 100,
              height: 100,
              color: Colors.yellow,
            ),
          ],
        ),
          const SizedBox(height: 20,),
          Expanded(
            child: Container(
              color: Colors.pink,
            ),
          )
      ])),
    ),
  );
}