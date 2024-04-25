import 'package:casino/core/general_balance/providers/balance_state_provider.dart';
import 'package:casino/feature/roulette/presentation/providers/bet_sum_state_provider.dart';
import 'package:casino/feature/roulette/presentation/providers/bet_value_provider.dart';
import 'package:casino/feature/roulette/presentation/providers/board_state_provider.dart';
import 'package:casino/feature/roulette/presentation/providers/roulette_state_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ColoredBoardItem extends ConsumerStatefulWidget {
  const ColoredBoardItem(this.index,
      {required this.width, required this.height, super.key});
  final int index;
  final double width;
  final double height;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ColoredBoardItemState();
}

class _ColoredBoardItemState extends ConsumerState<ColoredBoardItem> {
  @override
  Widget build(BuildContext context) {
    // final state = ref.watch(rouletteStateProvider);
    final state = ref.watch(boardStateProvider);
    final betValue = ref.watch(betValueProvider);
    final betSum = ref.watch(betSumStateProvider);
    final userData = ref.watch(userDataNotifierStateProvider);

    return GestureDetector(
      onTap: () {
        if (state[widget.index].bet != null) {
          ref
              .read(boardStateProvider.notifier)
              .selectNumber(state[widget.index].number);
          ref
              .read(betSumStateProvider.notifier)
              .changeSum(-state[widget.index].bet!);
          ref
              .read(rouletteStateProvider.notifier)
              .number(state[widget.index].number, null);
          ref
              .read(boardStateProvider.notifier)
              .setBet(state[widget.index].number, null);
        } else {
          if (betSum + betValue <= userData!.balance) {
            ref
                .read(boardStateProvider.notifier)
                .selectNumber(state[widget.index].number);
            ref
                .read(rouletteStateProvider.notifier)
                .number(state[widget.index].number, betValue);
            ref.read(betSumStateProvider.notifier).changeSum(betValue);
            ref
                .read(boardStateProvider.notifier)
                .setBet(state[widget.index].number, betValue);
          }
        }
      },
      child: Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            color: state[widget.index].color.getColor),
        child: Center(
            child: Text(
          state[widget.index].number.toString(),
          style: const TextStyle(color: Colors.white),
        )),
      ),
    );
  }
}
