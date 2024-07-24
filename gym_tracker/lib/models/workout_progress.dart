class WorkoutProgress {
  final int id;
  final int userId;
  final int planId;
  final int exerciseId;
  final DateTime date;
  final int reps;
  final int sets;
  final double weight;

  WorkoutProgress({
    required this.id,
    required this.userId,
    required this.planId,
    required this.exerciseId,
    required this.date,
    required this.reps,
    required this.sets,
    required this.weight,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'planId': planId,
      'exerciseId': exerciseId,
      'date': date.toIso8601String(),
      'reps': reps,
      'sets': sets,
      'weight': weight,
    };
  }

  factory WorkoutProgress.fromMap(Map<String, dynamic> map) {
    return WorkoutProgress(
      id: map['id'],
      userId: map['userId'],
      planId: map['planId'],
      exerciseId: map['exerciseId'],
      date: DateTime.parse(map['date']),
      reps: map['reps'],
      sets: map['sets'],
      weight: map['weight'],
    );
  }
}
