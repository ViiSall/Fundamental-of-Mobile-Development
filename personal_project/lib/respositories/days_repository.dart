import 'package:flutter/material.dart';
import 'package:personal_project/database/database_manager.dart';
import 'package:personal_project/models/day_model.dart';

class DaysRepository extends ChangeNotifier {
  List<DayModel> _days = [];
  bool isInitalized = false;

  void _initDays() async {
    _days = await DatabaseManager.instance.fetchDays();
    notifyListeners();
  }

  void updateGoalStatus(DateTime date, var goalId) {
    date = DateUtils.dateOnly(date);
    var day = _getDayByDate(date);

    if (day == null) {
      day = DayModel(
        completedGoalsId: [goalId],
        date: date,
      );

      _addDay(day);
    } else {
      if (day.completedGoalsId.contains(goalId)) {
        _removeCompletedGoal(day, goalId);
      } else {
        _addCompletedGoal(day, goalId);
      }
    }
  }

  void _addCompletedGoal(var day, var goalId) {
    day.completedGoalsId.add(goalId);
    _updateDay(day);
  }

  void _removeCompletedGoal(var day, var goalId) {
    day!.completedGoalsId.remove(goalId);

    if (day.completedGoalsId.isEmpty) {
      _deleteDay(day);
    } else {
      _updateDay(day);
    }
  }

  void _addDay(var day) async {
    day.id = await DatabaseManager.instance.addDay(day);
    _days.add(day);

    notifyListeners();
  }

  void _updateDay(var day) {
    DatabaseManager.instance.updateDay(day);
    notifyListeners();
  }

  List<DayModel> _getDays() {
    if (!isInitalized) {
      _initDays();
      isInitalized = true;
    }
    return _days;
  }

  DayModel? _getDayByDate(DateTime date) {
    date = DateUtils.dateOnly(date);

    var days = _getDays().where((element) => element.date == date);
    if (days.isNotEmpty) {
      return days.first;
    } else {
      return null;
    }
  }

  List<DayModel> getDaysByGoalId(int goalId) {
    return _getDays()
        .where((element) => element.completedGoalsId.contains(goalId))
        .toList();
  }

  void _deleteDay(var day) {
    DatabaseManager.instance.deleteDay(day);
    _days.remove(day);
    notifyListeners();
  }

  bool isGoalCompleted(DateTime date, int goalId) {
    date = DateUtils.dateOnly(date);
    var day = _getDayByDate(date);

    if (day != null) {
      return day.completedGoalsId.contains(goalId);
    }
    return false;
  }

  void removeGoal(int goalId) {
    var goalDays = [];

    for (var day in _getDays()) {
      if (day.completedGoalsId.contains(goalId)) {
        goalDays.add(day);
      }
    }

    for (var day in goalDays) {
      _removeCompletedGoal(day, goalId);
    }
  }
}