import 'package:flutter/material.dart';
import 'package:gym_tracker/models/exercise.dart';
import 'package:gym_tracker/services/plan_service.dart';

class ExerciseScreen extends StatefulWidget {
  final Exercise exercise;
  final int planId;

  const ExerciseScreen({Key? key, required this.exercise, required this.planId})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => ExerciseScreenState();
}

class ExerciseScreenState extends State<ExerciseScreen> {
  final PlanService _planService = PlanService();
  late TextEditingController _setsController;
  late TextEditingController _repsController;
  late TextEditingController _weightController;
  late Map<String, dynamic> new_exer;

  @override
  void initState() {
    super.initState();
    _setsController =
        TextEditingController(text: widget.exercise.sets.toString());
    _repsController =
        TextEditingController(text: widget.exercise.reps.toString());
    _weightController =
        TextEditingController(text: widget.exercise.weight.toString());
    _initializeNewExer();
  }

  void _initializeNewExer() {
    new_exer = {
      'name': widget.exercise.name,
      'description': widget.exercise.description,
      'sets': _setsController.text,
      'reps': _repsController.text,
      'weight': _weightController.text,
    };
  }

  Future<void> updatePlanExercise() async {
    setState(() {
      widget.exercise.sets = int.parse(_setsController.text);
      widget.exercise.reps = int.parse(_repsController.text);
      widget.exercise.weight = double.parse(_weightController.text);
      new_exer['sets'] = _setsController.text;
      new_exer['reps'] = _repsController.text;
      new_exer['weight'] = _weightController.text;
    });

    await _planService.updatePlanExercise(widget.planId, widget.exercise);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Exercise updated successfully')),
    );

    Navigator.pop(context, widget.exercise); // Pass the updated exercise
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Exercise'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _setsController,
              decoration: InputDecoration(
                labelText: 'Sets',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16),
            TextField(
              controller: _repsController,
              decoration: InputDecoration(
                labelText: 'Reps',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16),
            TextField(
              controller: _weightController,
              decoration: InputDecoration(
                labelText: 'Weight',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: updatePlanExercise,
              child: Text('Update Exercise'),
            ),
          ],
        ),
      ),
    );
  }
}
