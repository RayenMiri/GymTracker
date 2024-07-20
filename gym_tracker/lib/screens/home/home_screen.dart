import 'package:flutter/material.dart';
import 'package:gym_tracker/screens/auth/login_screen.dart';
import 'package:gym_tracker/services/auth_service.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void logOut(BuildContext context) async {
    final _auth_service = AuthService();
    await _auth_service.logoutUser();

    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const LoginScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Column(
            children: [
              SizedBox(
                height: 64.0,
              ),
              ElevatedButton(
                onPressed: () => logOut(context),
                child: const Text('Logout'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
