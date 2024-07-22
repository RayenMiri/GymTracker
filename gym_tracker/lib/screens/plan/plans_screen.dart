import 'package:flutter/material.dart';
import 'package:gym_tracker/models/user.dart';
import 'package:gym_tracker/services/auth_service.dart';
import 'package:gym_tracker/widgets/plans_grid_layout.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PlanScreen extends StatefulWidget {
  const PlanScreen({super.key});

  @override
  _PlanScreenState createState() => _PlanScreenState();
}

class _PlanScreenState extends State<PlanScreen> {
  late AuthService _authService;
  late SharedPreferences _prefs;
  late String _token;
  User? _user; // Change this to nullable

  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
    _authService = AuthService();
    _prefs = await SharedPreferences.getInstance();
    _token = _prefs.getString('token') ?? '';
    print('token ${_token}');
    try {
      // Fetch user details using the token
      _user = await _authService.getUserByToken(_token);
      print('User Data: ${_user?.toMap()}'); // Print the entire user data map
      print('user id ${_user!.userId}');
    } catch (e) {
      // Handle errors if any
      print('Error fetching user: $e');
    }
    setState(() {}); // Call setState to rebuild the widget tree
  }

  @override
  Widget build(BuildContext context) {
    if (_user == null) {
      return Center(
          child:
              CircularProgressIndicator()); // Show a loading indicator while data is being loaded
    }

    return Scaffold(
      body: PlansGridLayout(
        userId:
            _user?.userId ?? 0, // Handle the case where userId might be null
      ),
    );
  }
}
