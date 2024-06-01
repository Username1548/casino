import '../../../../core/general_balance/providers/balance_state_provider.dart';
import '../providers/bet_sum_state_provider.dart';
import '../providers/bet_value_provider.dart';
import '../providers/uncolored_board_state_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UncoloredBoardItem extends ConsumerStatefulWidget {
  const UncoloredBoardItem({
    super.key,
    required this.index,
    required this.width,
    required this.height,
    required this.createBet,
  });
  final int index;
  final double width;
  final double height;
  final Function createBet;

  @override
  ConsumerState<UncoloredBoardItem> createState() => _UncoloredBoardItemState();
}

class _UncoloredBoardItemState extends ConsumerState<UncoloredBoardItem> {
  bool selected = false;
  @override
  Widget build(BuildContext context) {
    final betValue = ref.watch(betValueProvider);
    final betSum = ref.watch(betSumStateProvider);
    final userData = ref.watch(userDataNotifierStateProvider);
    final state = ref.watch(uncoloredBoardStateProvider);
    return GestureDetector(
      onTap: () {
        if (state[widget.index].bet != null) {
          ref
              .read(uncoloredBoardStateProvider.notifier)
              .selectField(widget.index);
          ref
              .read(betSumStateProvider.notifier)
              .changeSum(-state[widget.index].bet!);
          widget.createBet(0);
          ref
              .read(uncoloredBoardStateProvider.notifier)
              .setBet(widget.index, null);
        } else {
          if (betSum + betValue <= userData!.balance) {
            ref
                .read(uncoloredBoardStateProvider.notifier)
                .selectField(widget.index);
            ref.read(betSumStateProvider.notifier).changeSum(betValue);
            widget.createBet(betValue);
            ref
              .read(uncoloredBoardStateProvider.notifier)
              .setBet(widget.index, betValue);
          }
        }
      },
      child: Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          color: state[widget.index].color.getColor,
        ),
        child: Center(
            child: Text(
          state[widget.index].text,
          style: const TextStyle(color: Colors.white),
        )),
      ),
    );
  }
}
