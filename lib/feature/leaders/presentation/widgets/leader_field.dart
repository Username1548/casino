import 'package:casino/feature/leaders/presentation/widgets/leader_info.dart';
import 'package:flutter/material.dart';

class LeaderField extends StatelessWidget {
  final String username;
  final int balance;
  final int index;
  final Color? color;
  const LeaderField(this.username, this.balance, this.index,
      {super.key, this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          Text('${index + 1}', style: TextStyle(color: color ?? Colors.white)),
          const SizedBox(width: 15),
          Icon(
            Icons.person_outlined,
            color: color ?? Colors.white,
          ),
          const SizedBox(width: 15),
          Expanded(child: LeaderInfo(username, balance, color: color))
        ],
      ),
    );
  }
}
