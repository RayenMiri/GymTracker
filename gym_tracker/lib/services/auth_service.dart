import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:sqflite/sqflite.dart';
import 'database_service.dart';
import '../models/user.dart';

class AuthService {
  final DatabaseService _databaseService = DatabaseService();

  // Helper function to hash passwords
  String _hashPassword(String password) {
    final bytes = utf8.encode(password);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  // Register a new user
  Future<bool> registerUser(String email, String password) async {
    final db = await _databaseService.database;

    // Check if the user already exists
    List<Map> result =
        await db.query('users', where: 'email = ?', whereArgs: [email]);
    if (result.isNotEmpty) {
      print('user already exists');
      return false; // User already exists
    }

    // Hash the password before storing it
    String hashedPassword = _hashPassword(password);

    // Insert new user
    User newUser = User(email: email, password: hashedPassword);
    await db.insert('users', newUser.toMap());
    print(newUser);
    return true;
  }

  // Login a user
  Future<bool> loginUser(String email, String password) async {
    final db = await _databaseService.database;

    // Hash the provided password
    String hashedPassword = _hashPassword(password);

    List<Map> users = await db.query('users');
    print(users);
    // Check if the user exists and the password matches
    List<Map> result = await db.query(
      'users',
      where: 'email =? AND password =?',
      whereArgs: [email, hashedPassword],
    );

    return result.isNotEmpty;
  }

  // Fetch a user by email
  Future<User?> getUserByEmail(String email) async {
    final db = await _databaseService.database;

    List<Map> result =
        await db.query('users', where: 'email = ?', whereArgs: [email]);

    if (result.isNotEmpty) {
      return User.fromMap(result.first.cast<String, dynamic>());
    }
    return null;
  }

  Future<void> logoutUser() async {
    // mara jaya
  }
}
