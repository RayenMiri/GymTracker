import 'package:flutter/material.dart';
import 'package:gym_tracker/screens/auth/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:gym_tracker/services/auth_service.dart';

class SettingsScreen extends StatelessWidget {
  final AuthService _authService = AuthService();

  Future<void> _logout(BuildContext context) async {
    await _authService.logoutUser();
    final prefs = await SharedPreferences.getInstance();
    await prefs
        .remove('token'); // Assuming you save the token in SharedPreferences
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const LoginScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Update Profile'),
            onTap: () {
              // Navigate to Update Profile screen
            },
          ),
          ListTile(
            leading: Icon(Icons.lock),
            title: Text('Change Password'),
            onTap: () {
              // Navigate to Change Password screen
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout'),
            onTap: () => _logout(context),
          ),
        ],
      ),
    );
  }
}
