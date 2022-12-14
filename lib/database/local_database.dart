import 'package:first_lesson/models/todo_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class LocalDatabase {
  static String tableName = "todoTable";
  static LocalDatabase getInstance = LocalDatabase._init();
  Database? _database;

  LocalDatabase._init();

  Future<Database> getDb() async {
    if (_database == null) {
      _database = await _initDB("todo.db");
      return _database!;
    }
    return _database!;
  }

  Future<Database> _initDB(String fileName) async {
    var dbPath = await getDatabasesPath();
    String path = join(dbPath, fileName);

    Database database = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        String idType = "INTEGER PRIMARY KEY AUTOINCREMENT";
        String textType = "TEXT";
        String intType = "INTEGER";
        String boolType = "INTEGER";

        await db.execute('''
        CREATE TABLE $tableName (
            ${TodoFields.id} $idType,
            ${TodoFields.title} $textType, 
            ${TodoFields.description} $textType, 
            ${TodoFields.date} $textType,
            ${TodoFields.priority} $textType,
            ${TodoFields.isCompleted} $boolType
            ${TodoFields.isCompleted1} $boolType

            )
            ''');
      },
    );
    return database;
  }

  static Future<TodoModel> insertToDatabase(TodoModel newTodo) async {
    var database = await getInstance.getDb();
    int id = await database.insert(tableName, newTodo.toJson());
    print("HAMMASI YAXSHI");
    return newTodo.copyWith(id: id);
  }

  static Future<TodoModel> updateTaskById(TodoModel updatedTask) async {
    var database = await getInstance.getDb();
    int id = await database.update(
      tableName,
      updatedTask.toJson(),
      where: 'id = ?',
      whereArgs: [updatedTask.id],
    );
    print("HAMMASI YAXSHI");
    return updatedTask.copyWith(id: id);
  }

  static Future<List<TodoModel>> getList() async {
    var database = await getInstance.getDb();
    var listOfTodos = await database.query(tableName, columns: [
      TodoFields.id,
      TodoFields.title,
      TodoFields.description,
      TodoFields.date,
      TodoFields.priority,
      TodoFields.isCompleted,
      TodoFields.isCompleted1
    ]);

    var list = listOfTodos.map((e) => TodoModel.fromJson(e)).toList();

    return list;
  }

  static Future<List<TodoModel>> getTaskByTitle({String title = ''}) async {
    var database = await getInstance.getDb();

    if (title.isNotEmpty) {
      var listOfTodos = await database.query(
        tableName,
        where: 'title LIKE ?',
        whereArgs: ['%$title%'],
      );
      var list = listOfTodos.map((e) => TodoModel.fromJson(e)).toList();
      return list;
    } else {
      var listOfTodos = await database.query(tableName, columns: [
        TodoFields.id,
        TodoFields.title,
        TodoFields.description,
        TodoFields.date,
        TodoFields.priority,
        TodoFields.isCompleted,
        TodoFields.isCompleted1
      ]);

      var list = listOfTodos.map((e) => TodoModel.fromJson(e)).toList();
      return list;
    }
  }

  static Future<int> deleteTaskById(int id) async {
    var database = await getInstance.getDb();
    return await database.delete(
      tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
