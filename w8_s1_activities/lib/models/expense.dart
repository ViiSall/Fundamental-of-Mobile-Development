import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';

enum ExpenseType {FOOD, TRAVEL, LEISURE, WORK}
const Uuid uuid = Uuid();

class Expense {
  final String id;
  final String title;
  final double amount;
  final DateTime date;

  Expense({required this.title, required this.amount, required this.date}) : this.id = uuid.v4();

}