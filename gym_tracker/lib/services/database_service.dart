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

  Future<void> _onCreate(Database db, int version) async {
    // Create the users table
    await db.execute('''
    CREATE TABLE users(
      userId INTEGER PRIMARY KEY AUTOINCREMENT,
      username TEXT NOT NULL,
      email TEXT UNIQUE NOT NULL,
      password TEXT NOT NULL,
      token TEXT NOT NULL
    );
  ''');

    // Create the plans table
    await db.execute('''
    CREATE TABLE plans(
      planId INTEGER PRIMARY KEY AUTOINCREMENT,
      userId INTEGER NOT NULL,
      planName TEXT NOT NULL,
      description TEXT,
      FOREIGN KEY (userId) REFERENCES users(userId) ON DELETE CASCADE
    );
  ''');

    // Create the exercises table
    await db.execute('''
    CREATE TABLE exercises(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      planId INTEGER NOT NULL,
      exerciseName TEXT NOT NULL,
      sets INTEGER NOT NULL,
      reps INTEGER NOT NULL,
      weight REAL,
      FOREIGN KEY (planId) REFERENCES plans(planId) ON DELETE CASCADE
    );
  ''');
  }

  // Close the database (optional)
  Future<void> closeDatabase() async {
    final db = await database;
    db.close();
  }
}
