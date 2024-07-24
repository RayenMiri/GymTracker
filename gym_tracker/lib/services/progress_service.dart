import 'package:gym_tracker/models/workout_progress.dart';
import 'package:gym_tracker/services/database_service.dart';

class ProgressService {
  final DatabaseService _databaseService = DatabaseService();

  Future<int> addWorkoutProgress(WorkoutProgress progress) async {
    final db = await _databaseService.database;
    return await db.insert('workout_progress', progress.toMap());
  }

  Future<List<WorkoutProgress>> getUserProgress(int userId) async {
    final db = await _databaseService.database;
    final List<Map<String, dynamic>> maps = await db
        .query('workout_progress', where: 'userId = ?', whereArgs: [userId]);

    return List.generate(maps.length, (i) {
      return WorkoutProgress.fromMap(maps[i]);
    });
  }

  Future<List<WorkoutProgress>> getExerciseProgress(int exerciseId) async {
    final db = await _databaseService.database;
    final List<Map<String, dynamic>> maps = await db.query('workout_progress',
        where: 'exerciseId = ?', whereArgs: [exerciseId]);

    return List.generate(maps.length, (i) {
      return WorkoutProgress.fromMap(maps[i]);
    });
  }
}
