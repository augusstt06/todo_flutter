import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_flutter/data/data.dart';
import 'package:todo_flutter/utils/utils.dart';

// 데이터를 관리하기 위해 사용하는 클래스들 정의.
class TodoDataSource {
  static final TodoDataSource _instance = TodoDataSource._();

  factory TodoDataSource() => _instance;
  TodoDataSource._() {
    _initDB();
  }

  static Database? _database;
  Future<Database> get database async {
    _database ??= await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, DBKeys.dbName);
    return openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
    CREATE TABLE ${DBKeys.dbTable} (
      ${DBKeys.idColumn} INTEGER PRIMARY KEY AUTOINCREMENT,
      ${DBKeys.titleColumn} TEXT,
      ${DBKeys.descriptionColumn} TEXT,
      ${DBKeys.categoryColumn} TEXT,
      ${DBKeys.isCompletedColumn} INTEGER,
      ${DBKeys.timeColumn} TEXT,
      ${DBKeys.dateColumn} TEXT
    )
    ''');
  }

  Future<int> addTodo(Todo todo) async {
    final db = await database;
    return db.transaction((action) async {
      return await action.insert(DBKeys.dbTable, todo.toJson(),
          conflictAlgorithm: ConflictAlgorithm.replace);
    });
  }

  Future<int> updateTodo(Todo todo) async {
    final db = await database;
    return db.transaction((action) async {
      return await action.update(DBKeys.dbTable, todo.toJson(),
          where: '${DBKeys.idColumn} = ?', whereArgs: [todo.id]);
    });
  }

  Future<int> deleteTodo(Todo todo) async {
    final db = await database;
    return db.transaction((action) async {
      return await action
          .delete(DBKeys.dbTable, where: 'id = ?', whereArgs: [todo.id]);
    });
  }

  Future<List<Todo>> getAllTodo() async {
    final db = await database;
    final List<Map<String, dynamic>> data =
        await db.query(DBKeys.dbTable, orderBy: 'id DESC');
    return List.generate(data.length, (index) => Todo.fromJson(data[index]));
  }
}
