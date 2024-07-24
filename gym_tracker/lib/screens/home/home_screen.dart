import 'package:flutter/material.dart';
import 'package:gym_tracker/models/user.dart';
import 'package:gym_tracker/screens/Progress/progress_screen.dart';
import 'package:gym_tracker/screens/community/community.dart';
import 'package:gym_tracker/screens/nutrition/nutriotion.dart';
import 'package:gym_tracker/screens/plan/plans_screen.dart';
import 'package:gym_tracker/screens/settings/settings.dart';
import 'package:gym_tracker/services/auth_service.dart';
import 'package:gym_tracker/widgets/bottom_nav_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final AuthService _auth_service;
  late final SharedPreferences? prefs;
  late final String? token;
  late final User? user;

  @override
  void initState() {
    super.initState();
    _init_async_user_id();
  }

  Future<void> _init_async_user_id() async {
    _auth_service = AuthService();
    prefs = await SharedPreferences.getInstance();
    token = prefs?.getString('token');
    user = await _auth_service.getUserByToken(token.toString());
    print(user?.userId);
    setState(() {});
  }

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _init_async_user_id(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final List<Widget> _screens = [
            PlanScreen(),
            ProgressScreen(userId: user?.userId ?? 0),
            NutritionScreen(),
            CommunityScreen(),
            SettingsScreen(),
          ];

          return Scaffold(
            appBar: AppBar(
              title: const Text('Gym Tracker'),
            ),
            body: _screens[_selectedIndex],
            bottomNavigationBar: BottomNavBar(
              onTap: _onItemTapped, // Pass the onTap callback
              currentIndex: _selectedIndex, // Pass the current index
            ),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
