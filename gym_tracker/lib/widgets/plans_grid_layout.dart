import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gym_tracker/screens/plan/plan_detail_screen.dart';
import 'plan_card.dart';

class PlansGridLayout extends StatelessWidget {
  const PlansGridLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: StaggeredGrid.count(
        crossAxisCount: 2, // Number of columns
        mainAxisSpacing: 4.0, // Spacing between rows
        crossAxisSpacing: 4.0, // Spacing between columns
        children: [
          StaggeredGridTile.count(
            crossAxisCellCount: 1,
            mainAxisCellCount: 2,
            child: PlanCard(
              planName: 'Plan 1',
              description: 'This is a description of Plan 1',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PlanDetailScreen(planName: 'Plan 1'),
                  ),
                );
              },
            ),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 1,
            mainAxisCellCount: 2,
            child: PlanCard(
              planName: 'Plan 2',
              description: 'This is a description of Plan 2',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PlanDetailScreen(planName: 'Plan 2'),
                  ),
                );
              },
            ),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 1,
            mainAxisCellCount: 2,
            child: PlanCard(
              planName: 'Plan 3',
              description: 'This is a description of Plan 3',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PlanDetailScreen(planName: 'Plan 3'),
                  ),
                );
              },
            ),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 1,
            mainAxisCellCount: 2,
            child: PlanCard(
              planName: 'Plan 3',
              description: 'This is a description of Plan 3',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PlanDetailScreen(planName: 'Plan 3'),
                  ),
                );
              },
            ),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 1,
            mainAxisCellCount: 2,
            child: PlanCard(
              planName: 'Plan 3',
              description: 'This is a description of Plan 3',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PlanDetailScreen(planName: 'Plan 3'),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
