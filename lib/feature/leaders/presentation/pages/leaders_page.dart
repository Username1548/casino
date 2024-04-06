import 'package:casino/core/widgets/custom_safe_area.dart';
import 'package:casino/feature/leaders/presentation/widgets/leader_board.dart';
import 'package:flutter/material.dart';

class LeaderBoardPage extends StatelessWidget {
  const LeaderBoardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ColoredSafeArea(
        child: Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Text(
          'LEADERBOARD',
          style: TextStyle(color: Colors.white),
        ),
        LeaderBoard()
      ]),
    ));
  }
}
