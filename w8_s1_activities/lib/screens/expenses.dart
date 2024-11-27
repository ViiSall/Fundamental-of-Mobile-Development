import 'package:flutter/material.dart';
import 'package:w8_s1_activities/models/expense.dart';

class ExpensesScreen extends StatefulWidget {
  const ExpensesScreen({super.key});

  @override
  State<ExpensesScreen> createState() => _ExpensesState();
}

class _ExpensesState extends State<ExpensesScreen> {

  List<Expense> expenses = [
    Expense(title: 'Visal', amount: 12.23, date: DateTime.now()),
    Expense(title: 'Visal', amount: 12.23, date: DateTime.now()),
    Expense(title: 'Visal', amount: 12.23, date: DateTime.now()),
    Expense(title: 'Visal', amount: 12.23, date: DateTime.now()),
    Expense(title: 'Visal', amount: 12.23, date: DateTime.now()),
    Expense(title: 'Visal', amount: 12.23, date: DateTime.now()),
    Expense(title: 'Visal', amount: 12.23, date: DateTime.now()),
  ];

  void onAdd() {
    showModalBottomSheet(
      isScrollControlled: true,
        context: context,
        builder: (BuildContext context) {
          return Container(

          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      appBar: AppBar(
        title: Text('Ronan- The best Expenses App'),
        actions: [
          IconButton(
            onPressed: onAdd,
            icon: Icon(Icons.add)),
        ],
      ),
      body: ListView.builder(
        itemCount: expenses.length,
        itemBuilder: (context, index) => Text(
          expenses[index].title,
          style: const TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold),
        ),
      )
    );
  }
}
