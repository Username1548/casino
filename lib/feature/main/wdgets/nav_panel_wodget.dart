import 'custom_navigation_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NavPanel extends StatelessWidget {
  const NavPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.75,
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        const CustomNavButton('/Main/BJBet', 'White Jack'),
        const CustomNavButton('/Main/Roulette', 'Not Roulette'),
        
      ]),
    );
  }
}
