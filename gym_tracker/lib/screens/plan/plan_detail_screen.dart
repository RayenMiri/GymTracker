import 'package:flutter/material.dart';

class PlanDetailScreen extends StatelessWidget {
  final String planName;

  const PlanDetailScreen({Key? key, required this.planName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(planName),
      ),
      body: Center(
        child: Text('Details about $planName'),
      ),
    );
  }
}
