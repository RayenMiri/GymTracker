import 'package:flutter/material.dart';
import 'package:gym_tracker/services/plan_service.dart';
import 'package:gym_tracker/models/exercise.dart';
import 'package:gym_tracker/utils/exercises_class.dart';

class CreatePlanScreen extends StatefulWidget {
  final int userId;

  const CreatePlanScreen({super.key, required this.userId});

  @override
  _CreatePlanScreenState createState() => _CreatePlanScreenState();
}

class _CreatePlanScreenState extends State<CreatePlanScreen> {
  final TextEditingController _planNameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final PlanService _planService = PlanService();

  // Map to store selected exercises by category
  final Map<String, List<String>> _selectedExercises = {};

  @override
  void initState() {
    super.initState();
    // Initialize the selected exercises map with empty lists for each category
    _initializeSelectedExercises();
  }

  void _initializeSelectedExercises() {
    _selectedExercises['Chest'] = [];
    _selectedExercises['Triceps'] = [];
    _selectedExercises['Calves'] = [];
    _selectedExercises['Back'] = [];
    _selectedExercises['Biceps'] = [];
    _selectedExercises['Abdominals'] = [];
    _selectedExercises['Shoulders'] = [];
    _selectedExercises['Legs'] = [];
  }

  Future<void> _createPlan() async {
    final String planName = _planNameController.text;
    final String description = _descriptionController.text;

    if (planName.isNotEmpty && description.isNotEmpty) {
      // Convert selected exercises to a list of Exercise objects
      final List<Exercise> selectedExercises = [];
      _selectedExercises.forEach((category, exercises) {
        exercises.forEach((exercise) {
          selectedExercises.add(Exercise(
              name: exercise,
              description: description,
              sets: 20,
              reps: 20,
              weight: 20)); // Add any other exercise details if needed
        });
      });

      final int planId = await _planService.createPlan(
          widget.userId, planName, description, selectedExercises);

      final newPlan = {
        'id': planId,
        'userId': widget.userId,
        'planName': planName,
        'description': description,
        'exercises': selectedExercises,
      };

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Plan created successfully')),
      );

      Navigator.pop(context, newPlan); // Return the new plan
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill in all fields')),
      );
    }
  }

  void _onExerciseSelected(String category, String exercise, bool isSelected) {
    setState(() {
      if (isSelected) {
        _selectedExercises[category]!.add(exercise);
      } else {
        _selectedExercises[category]!.remove(exercise);
      }
    });
  }

  Widget _buildExerciseCategory(String category, List<String> exercises) {
    return ExpansionTile(
      title: Text(category),
      children: exercises.map((exercise) {
        return CheckboxListTile(
          title: Text(exercise),
          value: _selectedExercises[category]!.contains(exercise),
          onChanged: (bool? value) {
            _onExerciseSelected(category, exercise, value!);
          },
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Plan'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: _planNameController,
                decoration: const InputDecoration(
                  labelText: 'Plan Name',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _descriptionController,
                decoration: const InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
              ),
              const SizedBox(height: 20),
              _buildExerciseCategory('Chest', Exercises.chestExercises),
              _buildExerciseCategory('Triceps', Exercises.tricepsExercises),
              _buildExerciseCategory('Calves', Exercises.calvesExercises),
              _buildExerciseCategory('Back', Exercises.backExercises),
              _buildExerciseCategory('Biceps', Exercises.bicepsExercises),
              _buildExerciseCategory(
                  'Abdominals', Exercises.abdominalsExercises),
              _buildExerciseCategory('Shoulders', Exercises.shouldersExercises),
              _buildExerciseCategory('Legs', Exercises.legsExercises),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _createPlan,
                child: const Text('Create Plan'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
