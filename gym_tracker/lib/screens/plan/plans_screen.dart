import 'package:flutter/material.dart';
import 'package:gym_tracker/widgets/plans_grid_layout.dart';

class PlanScreen extends StatelessWidget {
  const PlanScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PlansGridLayout(),
    );
  }
}
