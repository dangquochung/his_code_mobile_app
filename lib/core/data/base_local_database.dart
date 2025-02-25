import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class BaseLocalDatabase {
  static final BaseLocalDatabase instance = BaseLocalDatabase._init();
  static Database? _database;

  BaseLocalDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('app_database.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,  
    );
  }

  Future _createDB(Database db, int version) async {
    // Example: Create tables
    await db.execute('''
      CREATE TABLE users (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        email TEXT NOT NULL UNIQUE,
        password TEXT NOT NULL
      )
    ''');
  }

  Future<int> insert(String table, Map<String, dynamic> values) async {
    final db = await instance.database;
    return await db.insert(table, values);
  }

  Future<List<Map<String, dynamic>>> query(String table) async {
    final db = await instance.database;
    return await db.query(table);
  }

  Future<int> update(
    String table,
    Map<String, dynamic> values, {
    required String where,
    required List<Object?> whereArgs,
  }) async {
    final db = await instance.database;
    return await db.update(
      table,
      values,
      where: where,
      whereArgs: whereArgs,
    );
  }

  Future<int> delete(
    String table, {
    required String where,
    required List<Object?> whereArgs,
  }) async {
    final db = await instance.database;
    return await db.delete(
      table,
      where: where,
      whereArgs: whereArgs,
    );
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}