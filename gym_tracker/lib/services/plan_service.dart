import 'package:gym_tracker/models/exercise.dart';
import 'package:gym_tracker/models/plan.dart';
import 'package:gym_tracker/services/database_service.dart';

class PlanService {
  final DatabaseService _databaseService = DatabaseService();

  //create plan
  Future<int> createPlan(int userId, String planName, String description,
      List<Exercise> exercises) async {
    final db = await _databaseService.database;
    // Insert the plan and get its ID
    int planId = await db.insert('plans', {
      'userId': userId,
      'planName': planName,
      'description': description,
    });

    // Insert each exercise associated with the plan into the plan_exercises table
    for (var exercise in exercises) {
      await db.insert('exercises', {
        'planId': planId,
        'exerciseName': exercise.name,
        'sets': exercise.sets,
        'reps': exercise.reps,
        'weight': exercise.weight
      });
    }

    return planId;
  }

  //get plan
  Future<List<Map<String, dynamic>>> getPlans(int userId) async {
    final db = await _databaseService.database;
    return await db.query('plans', where: 'userId = ?', whereArgs: [userId]);
  }

  //get plan's exercises
  Future<List<Exercise>> getExercisesForPlan(int planId) async {
    final db = await _databaseService.database;
    final List<Map<String, dynamic>> maps = await db.query(
      'exercises',
      where: 'planId = ?',
      whereArgs: [planId],
    );

    return List.generate(maps.length, (i) {
      return Exercise(
          name: maps[i]['exerciseName'],
          description: '',
          sets: maps[i]['sets'],
          reps: maps[i]['reps'],
          weight: maps[i]['weight']);
    });
  }

  //update plan's exericise
  Future<int> updatePlanExercise(int planId, Exercise exercice) async {
    final db = await _databaseService.database;
    return await db.update(
      'exercises',
      {'sets': exercice.sets, 'reps': exercice.reps, 'weight': exercice.weight},
      where: 'planId=? AND exerciseName=?',
      whereArgs: [planId, exercice.name],
    );
  }

  //update plan
  Future<int> updatePlan(int id, String planName, String description) async {
    final db = await _databaseService.database;
    return await db.update(
      'plans',
      {'planName': planName, 'description': description},
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  //delete plan
  Future<int> deletePlan(int id) async {
    final db = await _databaseService.database;
    return await db.delete(
      'plans',
      where: 'planId = ?',
      whereArgs: [id],
    );
  }
}
