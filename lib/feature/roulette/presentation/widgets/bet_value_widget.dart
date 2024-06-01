import '../providers/bet_value_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BetValueWidget extends ConsumerStatefulWidget {
  const BetValueWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BetValueWidgetState();
}

class _BetValueWidgetState extends ConsumerState<BetValueWidget> {
  final chipsValue = [1, 5, 10, 25, 100, 250, 1000];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    final betValue = ref.watch(betValueProvider);
    final valueIndex = chipsValue.indexOf(betValue);
    return SizedBox(
      width: width * 0.48,
      height: height * 0.2,
      child: ListView.separated(
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(width: width * 0.02);
        },
        physics: const NeverScrollableScrollPhysics(),
        itemCount: chipsValue.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            child: Image.asset(
              'assets/images/chips/standard/${chipsValue[index]}.png',
              width: valueIndex == index ? width * 0.05 : width * 0.04,
            ),
            onTap: () {
              ref.read(betValueProvider.notifier).state = chipsValue[index];
            },
          );
        },
      ),
    );
  }
}
