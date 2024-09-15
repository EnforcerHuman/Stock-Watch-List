import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:convert';

/// A helper class for managing the watchlist database using sqflite.
class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;

  static Database? _database;

  DatabaseHelper._internal();

  /// Returns the database instance, initializing it if necessary.
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  /// Initializes the watchlist database and creates necessary tables.
  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'watch_list.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute(
            'CREATE TABLE watch_list_items (id INTEGER PRIMARY KEY AUTOINCREMENT, stock_name TEXT NOT NULL)');
      },
    );
  }

  /// Inserts a new stock name into the watchlist.
  Future<void> insertValue(String value) async {
    final db = await database;
    await db.insert('watch_list_items', {'stock_name': value});
  }

  /// Retrieves all stock items from the watchlist.
  Future<List<Map<String, dynamic>>> getItems() async {
    final db = await database;
    return await db.query('watch_list_items');
  }

  /// Deletes a specific item from the watchlist by its ID.
  Future<int> deleteItem(int id) async {
    final db = await database;
    return await db.delete(
      'watch_list_items',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  /// Updates a specific watchlist item with new values.
  ///
  /// [id]: The ID of the item to update.
  /// [listName]: The new name of the stock.
  /// [values]: A list of additional values (encoded as JSON).
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
