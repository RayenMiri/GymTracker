import 'package:flutter/material.dart';
import 'package:gym_tracker/screens/home/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './screens/auth/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gym Tracker',
      theme: ThemeData(fontFamily: 'Merriweather'),
      darkTheme: ThemeData.dark(), // Dark theme
      themeMode: ThemeMode.system,
      home: FutureBuilder(
        future: SharedPreferences.getInstance(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final prefs = snapshot.data;
            final token = prefs?.getString('token');
            if (token != null) {
              return const HomeScreen(); // Route to main app screen if token is found
            } else {
              return const LoginScreen(); // Route to login screen if token is not found
            }
          } else {
            return const Center(
                child:
                    CircularProgressIndicator()); // Show a loading indicator while waiting for SharedPreferences
          }
        },
      ),
    );
  }
}
