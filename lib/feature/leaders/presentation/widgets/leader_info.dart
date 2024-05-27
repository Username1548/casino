import 'package:flutter/material.dart';

class LeaderInfo extends StatelessWidget {
  final String username;
  final int balance;
  final Color? color;
  const LeaderInfo(this.username, this.balance, {super.key, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 0.4,
      height: MediaQuery.sizeOf(context).height * 0.05,
      decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
                color: Color.fromARGB(255, 16, 64, 17),
                offset: Offset(0, 1),
                blurRadius: 1), //BoxShadow
            BoxShadow(
              color: Color.fromARGB(255, 2, 113, 6),
              offset: Offset(0.0, 0.0),
              blurRadius: 0.0,
              spreadRadius: 0.0,
            ), //BoxShadow
          ],
          color: const Color.fromARGB(255, 2, 113, 6),
          borderRadius: BorderRadius.circular(5)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              username,
              style: TextStyle(color: color ?? Colors.white),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Text(
              balance.toString(),
              style: TextStyle(color: color ?? Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
