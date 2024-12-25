import 'package:flutter/material.dart';
import 'package:personal_project/database/database_manager.dart';
import 'package:personal_project/models/goal_model.dart';

class GoalsRepository extends ChangeNotifier {
  List<GoalModel> _goals = [];
  bool isInitialized = false;

  void _initGoals() async {
    _goals = await DatabaseManager.instance.fetchGoals();

    // Sort goals by displayOrder
    _goals.sort((a, b) => a.displayOrder.compareTo(b.displayOrder));
    isInitialized = true;

    notifyListeners();
  }

  void saveGoal(GoalModel goal) {
    if (goal.id != -1) {
      _updateGoal(goal);
    } else {
      _addGoal(goal);
    }
  }

  void _addGoal(GoalModel goal) async {
    // Set the displayOrder to be the last position
    goal.displayOrder = _goals.length;
    goal.id = (await DatabaseManager.instance.addGoal(goal))!;
    _goals.add(goal);

    notifyListeners();
  }

  void _updateGoal(GoalModel goal) {
    DatabaseManager.instance.updateGoal(goal);

    int goalIndex = _goals.indexWhere((element) => element.id == goal.id);
    if (goalIndex != -1) {
      _goals[goalIndex] = goal;
    }

    notifyListeners();
  }

  void updateGoalsOrder(List<GoalModel> reorderedGoals) async {
    // Update the displayOrder field for each goal
    for (int i = 0; i < reorderedGoals.length; i++) {
      reorderedGoals[i].displayOrder = i;
      await DatabaseManager.instance.updateGoalOrder(reorderedGoals[i].id, i);
    }

    // Update the local list
    _goals = List.from(reorderedGoals);
    notifyListeners();
  }

  List<GoalModel> getGoals() {
    if (!isInitialized) {
      _initGoals();
    }

    // Return sorted goals
    return List.from(_goals);
  }

  List<GoalModel> getGoalsByWeekday(int weekday) {
    return getGoals().where((goal) => goal.days[weekday]).toList();
  }

  void deleteGoal(GoalModel goal) {
    DatabaseManager.instance.deleteGoal(goal);
    _goals.removeWhere((g) => g.id == goal.id);

    // Update displayOrder of remaining goals
    for (int i = 0; i < _goals.length; i++) {
      _goals[i].displayOrder = i;
      DatabaseManager.instance.updateGoalOrder(_goals[i].id, i);
    }

    notifyListeners();
  }
}
