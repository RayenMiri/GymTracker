import 'package:flutter/material.dart';
import '../models/plan.dart';
import '../models/exercise.dart';

class ExerciseCard extends StatelessWidget {
  final Exercise exercise;

  const ExerciseCard({Key? key, required this.exercise}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              exercise.name,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              exercise.description,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Sets: ${exercise.sets}',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                Text(
                  'Reps: ${exercise.reps}',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            // Add an image or icon if you want to make it more visually appealing
            // For example, you can use the following code to add an image
            // Image.asset('assets/images/exercise.png', height: 100),
          ],
        ),
      ),
    );
  }
}
