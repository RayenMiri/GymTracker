import './exercise.dart';

class Plan {
  final String name;
  final String description;
  final List<Exercise> exercises;
  final String duration; // Duration of the plan (weeks)
  final String
      difficulty; // Difficulty level (Beginner, Intermediate, Advanced)

  Plan({
    required this.name,
    required this.description,
    required this.exercises,
    required this.duration,
    required this.difficulty,
  });
}
