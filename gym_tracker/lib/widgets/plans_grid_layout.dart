import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gym_tracker/screens/plan/create_plan_screen.dart';
import 'package:gym_tracker/screens/plan/plan_detail_screen.dart';
import 'package:gym_tracker/widgets/create_plan_card.dart';
import 'package:gym_tracker/services/plan_service.dart';
import '../models/plan.dart';
import 'plan_card.dart';

class PlansGridLayout extends StatefulWidget {
  final int userId;

  const PlansGridLayout({Key? key, required this.userId}) : super(key: key);

  @override
  _PlansGridLayoutState createState() => _PlansGridLayoutState();
}

class _PlansGridLayoutState extends State<PlansGridLayout> {
  late Future<List<Plan>> _plansFuture;

  @override
  void initState() {
    super.initState();
    _plansFuture = _fetchPlans();
  }

  Future<List<Plan>> _fetchPlans() async {
    final planService = PlanService();
    final planData = await planService.getPlans(widget.userId);
    print('PLAN ID : ${planData.length}');
    return planData.map((plan) {
      return Plan(
        id: plan['planId'],
        name: plan['planName'],
        description: plan['description'],
        duration: '8 weeks', // Dummy values for now
        difficulty: 'Intermediate',
        exercises: [], // Populate with actual exercises if needed
      );
    }).toList();
  }

  Future<void> _deletePlan(int planId) async {
    final planService = PlanService();
    await planService.deletePlan(planId);
    setState(() {
      _plansFuture = _fetchPlans();
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Plan>>(
      future: _plansFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          final plans = snapshot.data!;

          return SingleChildScrollView(
            child: StaggeredGrid.count(
              crossAxisCount: 2,
              mainAxisSpacing: 4.0,
              crossAxisSpacing: 4.0,
              children: [
                StaggeredGridTile.count(
                  crossAxisCellCount: 2,
                  mainAxisCellCount: 1,
                  child: CreatePlanCard(
                    onTap: () async {
                      final newPlan = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              CreatePlanScreen(userId: widget.userId),
                        ),
                      );

                      if (newPlan != null) {
                        setState(() {
                          _plansFuture = _fetchPlans();
                        });
                      }
                    },
                  ),
                ),
                ...plans.map((plan) {
                  return StaggeredGridTile.count(
                    crossAxisCellCount: 2,
                    mainAxisCellCount: 1,
                    child: PlanCard(
                      planName: plan.name,
                      description: plan.description,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PlanDetailScreen(plan: plan),
                          ),
                        );
                      },
                      onDelete: () => {_deletePlan(plan.id)},
                    ),
                  );
                }).toList(),
              ],
            ),
          );
        }
      },
    );
  }
}
