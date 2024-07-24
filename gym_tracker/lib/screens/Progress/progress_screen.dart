import 'package:flutter/material.dart';
import 'package:gym_tracker/services/progress_service.dart';
import 'package:gym_tracker/models/workout_progress.dart';

class ProgressScreen extends StatelessWidget {
  final int userId;

  const ProgressScreen({Key? key, required this.userId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProgressService progressService = ProgressService();

    return Scaffold(
      body: FutureBuilder<List<WorkoutProgress>>(
        future: progressService.getUserProgress(userId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No progress found.'));
          }

          final progressList = snapshot.data!;

          return ListView.builder(
            itemCount: progressList.length,
            itemBuilder: (context, index) {
              final progress = progressList[index];
              return ListTile(
                title: Text('Date: ${progress.date}'),
                subtitle: Text(
                    'Sets: ${progress.sets}, Reps: ${progress.reps}, Weight: ${progress.weight} kg'),
              );
            },
          );
        },
      ),
    );
  }
}
