import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:convert';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;

  static Database? _database;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'watch_list.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute(
            'CREATE TABLE watch_list_items (id INTEGER PRIMARY KEY AUTOINCREMENT,stock_name TEXT NOT NULL)');
      },
    );
  }

  Future<void> insertValue(String value) async {
    final db = await database;
    db.insert('watch_list_items', {'stock_name': value});
  }

  Future<List<Map<String, dynamic>>> getItems() async {
    final db = await database;
    return await db.query('watch_list_items');
  }

  Future<int> deleteItem(int id) async {
    final db = await database;
    return await db.delete(
      'watch_list_item',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<int> updateItem(int id, String listName, List<String> values) async {
    final db = await database;
    return await db.update(
      'watch_list_item',
      {
        'list_name': listName,
        'values': jsonEncode(values),
      },
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
