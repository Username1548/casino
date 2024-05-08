import 'package:casino/feature/leaders/presentation/widgets/leader_board.dart';
import 'package:flutter/material.dart';

class LeaderBoardPage extends StatelessWidget {
  const LeaderBoardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
    backgroundColor: Theme.of(context).colorScheme.background,
    title: const Text(
      'LEADERBOARD',
      style: TextStyle(color: Colors.white),
    ),
          ),
          body: const Center(
    child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [LeaderBoard()]),
          ),
        );
  }
}

