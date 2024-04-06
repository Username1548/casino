import 'package:casino/feature/main/wdgets/custom_navigation_button.dart';
import 'package:flutter/widgets.dart';

class NavPanel extends StatelessWidget {
  const NavPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.7,
      child: const Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomNavButton('/Main/BJBet', 'White Jack'),
            CustomNavButton('/Main/Roulette', 'Not Roulette')
          ]),
    );
  }
}
