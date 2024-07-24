import 'package:flutter/material.dart';
import 'package:gym_tracker/models/exercise.dart';
import 'package:gym_tracker/models/plan.dart';
import 'package:gym_tracker/screens/Exercise/exercise_screen.dart';
import 'package:gym_tracker/widgets/exercise_card.dart';
import 'package:gym_tracker/services/plan_service.dart';

class PlanDetailScreen extends StatefulWidget {
  final Plan plan;

  const PlanDetailScreen({Key? key, required this.plan}) : super(key: key);

  @override
  _PlanDetailScreenState createState() => _PlanDetailScreenState();
}

class _PlanDetailScreenState extends State<PlanDetailScreen> {
  late Future<List<Exercise>> _exercises;
  final PlanService _planService = PlanService();

  @override
  void initState() {
    super.initState();
    _load_exercises();
  }

  void _load_exercises() {
    setState(() {
      _exercises = _planService.getExercisesForPlan(widget.plan.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.plan.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.plan.name,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            SizedBox(height: 8),
            Text(
              widget.plan.description,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(height: 16),
            Text(
              'Duration: ${widget.plan.duration}',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            SizedBox(height: 8),
            Text(
              'Difficulty: ${widget.plan.difficulty}',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            SizedBox(height: 16),
            Text(
              'Exercises:',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(height: 8),
            Expanded(
              child: FutureBuilder<List<Exercise>>(
                future: _exercises,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }

                  if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  }

                  if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(child: Text('No exercises found.'));
                  }

                  final exercises = snapshot.data!;

                  return ListView.builder(
                    itemCount: exercises.length,
                    itemBuilder: (context, index) {
                      final exercise = exercises[index];
                      return ExerciseCard(
                        exercise: exercise,
                        planId: widget.plan.id,
                        onTap: () async {
                          final updatedExercise = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ExerciseScreen(
                                exercise: exercise,
                                planId: widget.plan.id,
                              ),
                            ),
                          );

                          if (updatedExercise != null) {
                            _load_exercises(); // Refresh the exercises list
                          }
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
