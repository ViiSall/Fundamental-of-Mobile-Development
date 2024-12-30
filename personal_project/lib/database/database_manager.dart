import 'package:path_provider/path_provider.dart';
import 'package:personal_project/models/day_model.dart';
import 'package:personal_project/models/goal_model.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseManager {
  DatabaseManager._privateConstructor();

  static final DatabaseManager instance = DatabaseManager._privateConstructor();

  static Database? _database;

  Future<Database> get database async {
    _database ??= await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    var documentsPath = (await getApplicationDocumentsDirectory()).path;
    var databasePath = '${documentsPath}HabitTracker.db';

    return await openDatabase(
      databasePath,
      version: 3, // Increment version number
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
    );
  }

  void _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE tb_goals(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        description TEXT,
        is_on_monday BOOLEAN,
        is_on_tuesday BOOLEAN,
        is_on_wednesday BOOLEAN,
        is_on_thursday BOOLEAN,
        is_on_friday BOOLEAN,
        is_on_saturday BOOLEAN,
        is_on_sunday BOOLEAN,
        icon_id INTEGER,
        display_order INTEGER DEFAULT 0
      );
    ''');

    await db.execute('''
      CREATE TABLE tb_days(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        completed_goals_id TEXT,
        date TEXT
      );
    ''');
  }

  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < 3) {
      await db.execute('ALTER TABLE tb_goals ADD COLUMN display_order INTEGER DEFAULT 0');
      var goals = await db.query('tb_goals', orderBy: 'id ASC');
      for (var i = 0; i < goals.length; i++) {
        await db.update(
          'tb_goals',
          {'display_order': i},
          where: 'id = ?',
          whereArgs: [goals[i]['id']],
        );
      }
    }
  }

  Future<List<Map<String, dynamic>>> _fetchDatabaseElement(String table) async {
    var database = await instance.database;
    return await database.query(table);
  }

  Future<int?> _addDatabaseElement(String table, var databaseElement) async {
    var database = await instance.database;

    return database.insert(
      table,
      databaseElement.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  void _updateDatabaseElement(String table, var databaseElement) async {
    var database = await instance.database;

    database.update(
      table,
      databaseElement.toJson(),
      where: 'id = ?',
      whereArgs: [databaseElement.id],
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  void _deleteDatabaseElement(String table, var databaseElement) async {
    var database = await instance.database;

    database.delete(
      table,
      where: 'id = ?',
      whereArgs: [databaseElement.id],
    );
  }

  // -- Goals Methods --
  Future<List<GoalModel>> fetchGoals() async {
    var database = await instance.database;
    List<Map<String, dynamic>> maps = await database.query(
        'tb_goals',
        orderBy: 'display_order ASC'
    );

    if (maps.isNotEmpty) {
      return maps.map((map) => GoalModel.fromJson(map)).toList();
    }
    return [];
  }

  Future<int?> addGoal(var goal) async {
    // Get the highest order value
    var database = await instance.database;
    var result = await database.rawQuery('SELECT MAX(display_order) as max_order FROM tb_goals');
    var maxOrder = result.first['max_order'] as int? ?? -1;

    // Set the new goal's order to be last
    goal.displayOrder = maxOrder + 1;

    return await _addDatabaseElement('tb_goals', goal);
  }

  void updateGoal(var goal) async {
    _updateDatabaseElement('tb_goals', goal);
  }

  void deleteGoal(var goal) async {
    _deleteDatabaseElement('tb_goals', goal);
  }

  Future<void> updateGoalOrder(int goalId, int newOrder) async {
    final db = await database;
    await db.update(
      'tb_goals',
      {'display_order': newOrder},
      where: 'id = ?',
      whereArgs: [goalId],
    );
  }

  // -- Days Methods --
  Future<List<DayModel>> fetchDays() async {
    List<Map<String, dynamic>> maps = await _fetchDatabaseElement('tb_days');

    if (maps.isNotEmpty) {
      return maps.map((map) => DayModel.fromJson(map)).toList();
    }
    return [];
  }

  Future<int?> addDay(var day) async {
    return await _addDatabaseElement('tb_days', day);
  }

  void updateDay(var day) async {
    _updateDatabaseElement('tb_days', day);
  }

  void deleteDay(var day) async {
    _deleteDatabaseElement('tb_days', day);
  }
}