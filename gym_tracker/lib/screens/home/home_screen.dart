import 'package:flutter/material.dart';
import 'package:gym_tracker/screens/Progress/progress_screen.dart';
import 'package:gym_tracker/screens/Stats/stats_screen.dart';
import 'package:gym_tracker/screens/auth/login_screen.dart';
import 'package:gym_tracker/screens/community/community.dart';
import 'package:gym_tracker/screens/nutrition/nutriotion.dart';
import 'package:gym_tracker/screens/plan/plans_screen.dart';
import 'package:gym_tracker/screens/settings/settings.dart';
import 'package:gym_tracker/services/auth_service.dart';
import 'package:gym_tracker/widgets/bottom_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final AuthService _authService = AuthService();

  final List<Widget> _screens = [
    StatsScreen(),
    PlanScreen(),
    ProgressScreen(),
    NutritionScreen(),
    CommunityScreen(),
    SettingsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void logOut(BuildContext context) async {
    await _authService.logoutUser();

    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const LoginScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gym Tracker'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => logOut(context),
          ),
        ],
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavBar(
        onTap: _onItemTapped, // Pass the onTap callback
        currentIndex: _selectedIndex, // Pass the current index
      ),
    );
  }
}
