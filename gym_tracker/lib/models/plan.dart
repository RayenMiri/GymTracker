import './exercise.dart';

class Plan {
  final int id; // Added id property
  final String name;
  final String description;
  final List<Exercise> exercises;
  final String duration; // Duration of the plan (weeks)
  final String
      difficulty; // Difficulty level (Beginner, Intermediate, Advanced)

  Plan({
    required this.id, // Added id parameter
    required this.name,
    required this.description,
    required this.exercises,
    required this.duration,
    required this.difficulty,
  });
}
