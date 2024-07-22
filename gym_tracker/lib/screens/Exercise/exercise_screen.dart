import 'package:flutter/material.dart';
import 'package:gym_tracker/models/exercise.dart';

class ExerciseScreen extends StatelessWidget {
  final Exercise exercise;
  const ExerciseScreen({Key? key, required this.exercise}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('exercise screen: ${exercise.name}'),
      ),
    );
  }
}
