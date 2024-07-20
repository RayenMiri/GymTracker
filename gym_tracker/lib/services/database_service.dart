import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseService {
  Database? _database;

  // Getter to access the database
  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase();
    return _database!;
  }

  // Initialize the database
  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'gym_tracker.db');

    return await openDatabase(path, version: 2, onCreate: _onCreate);
  }

  /*Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < newVersion) {
      await db.execute('DROP TABLE IF EXISTS users;');
      await _onCreate(db, newVersion); // Recreate the users table
    }
  }*/

  // Create the database tables
  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE users(
        email TEXT UNIQUE NOT NULL,
        password TEXT NOT NULL,
        token TEXT NOT NULL
      )
    ''');
  }

  // Close the database (optional)
  Future<void> closeDatabase() async {
    final db = await database;
    db.close();
  }
}
