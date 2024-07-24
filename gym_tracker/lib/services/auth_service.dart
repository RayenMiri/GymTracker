import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:sqflite/sqflite.dart';
import 'package:shared_preferences/shared_preferences.dart';
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

  // token generation function
  String _generateToken(String email) {
    final timestamp = DateTime.now().millisecondsSinceEpoch.toString();
    final tokenString = '$email:$timestamp';
    final bytes = utf8.encode(tokenString);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  // Register a new user
  Future<bool> registerUser(
      String username, String email, String password) async {
    final db = await _databaseService.database;

    // Check if the user already exists
    List<Map> result =
        await db.query('users', where: 'email = ?', whereArgs: [email]);
    if (result.isNotEmpty) {
      return false; // User already exists
    }

    // Hash the password before storing it
    String hashedPassword = _hashPassword(password);

    // Generate a unique token for the user
    String token = _generateToken(email);

    // Insert new user with the token
    User newUser = User(
        username: username,
        email: email,
        password: hashedPassword,
        token: token);
    await db.insert('users', newUser.toMap());
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', newUser.token);

    return true;
  }

  // Login a user
  Future<bool> loginUser(String email, String password) async {
    final db = await _databaseService.database;

    // Hash the provided password
    String hashedPassword = _hashPassword(password);

    // Check if the user exists and the password matches
    List<Map> result = await db.query(
      'users',
      where: 'email =? AND password =?',
      whereArgs: [email, hashedPassword],
    );
    if (result.isEmpty) {
      return false;
    }

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', result.first['token']);
    return result.isNotEmpty;
  }

  // Fetch a user by token
  Future<User?> getUserByToken(String token) async {
    final db = await _databaseService.database;

    List<Map> result =
        await db.query('users', where: 'token = ?', whereArgs: [token]);

    if (result.isNotEmpty) {
      return User.fromMap(result.first.cast<String, dynamic>());
    }
    return null;
  }

  //return the user token if he's logged in
  Future<String?> getUserToken() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    return token;
  }

  //delete user token when logging out
  Future<void> logoutUser() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('token');
  }
}
