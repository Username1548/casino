import 'package:casino/feature/roulette/presentation/providers/bet_sum_state_provider.dart';
import 'package:casino/feature/roulette/presentation/providers/board_state_provider.dart';
import 'package:casino/feature/roulette/presentation/providers/roulette_state_provider.dart';
import 'package:casino/feature/roulette/presentation/providers/uncolored_board_state_provider.dart';
import 'package:casino/feature/roulette/presentation/widgets/bet_value_widget.dart';
import 'package:casino/feature/roulette/presentation/widgets/colored_board_item.dart';
import 'package:casino/feature/roulette/presentation/widgets/uncolored_board_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RouletteBoard extends ConsumerStatefulWidget {
  const RouletteBoard({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RouletteBoardState();
}

class _RouletteBoardState extends ConsumerState<RouletteBoard> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    final uncoloredBoardItemHeight = height * 0.10;
    final betSum = ref.watch(betSumStateProvider);
    // final betValue = ref.watch(betValueProvider);
    return SizedBox(
      height: double.infinity,
      width: MediaQuery.sizeOf(context).width * 0.55,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Row(
              children: [
                IconButton(
                    onPressed: () {
                      ref.read(betSumStateProvider.notifier).cleanState();
                      ref.read(boardStateProvider.notifier).cleanState();
                      ref.read(rouletteStateProvider.notifier).cleanState();
                      ref
                          .read(uncoloredBoardStateProvider.notifier)
                          .cleanState();
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.black,
                    )),
                TextButton(
                    onPressed: () {
                      ref.read(betSumStateProvider.notifier).cleanState();
                      ref.read(boardStateProvider.notifier).cleanState();
                      ref.read(rouletteStateProvider.notifier).cleanState();
                      ref
                          .read(uncoloredBoardStateProvider.notifier)
                          .cleanState();
                    },
                    child: const Text('RESET',
                        style: TextStyle(
                          color: Colors.white,
                        ))),
                SizedBox(
                  width: width * 0.07,
                ),
                Text(
                  'TOTAL BET   $betSum',
                  style: const TextStyle(color: Colors.white),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, top: 15),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ColoredBoardItem(
                  36,
                  width: width * 0.05,
                  height: height * 0.3,
                ),
                Column(
                  children: [
                    Row(
                        children: List.generate(
                            12,
                            (index) => ColoredBoardItem(
                                  index,
                                  width: width * 0.04,
                                  height: height * 0.1,
                                ))),
                    Row(
                        children: List.generate(
                            12,
                            (index) => ColoredBoardItem(
                                  index + 12,
                                  width: width * 0.04,
                                  height: height * 0.1,
                                ))),
                    Row(
                        children: List.generate(
                            12,
                            (index) => ColoredBoardItem(
                                  index + 24,
                                  width: width * 0.04,
                                  height: height * 0.1,
                                ))),
                    Row(
                      children: [
                        UncoloredBoardItem(
                          index: 0,
                          width: width * 0.16,
                          height: uncoloredBoardItemHeight,
                          createBet: ref
                              .read(rouletteStateProvider.notifier)
                              .firstTwelve,
                        ),
                        UncoloredBoardItem(
                          index: 1,
                          width: width * 0.16,
                          height: uncoloredBoardItemHeight,
                          createBet: ref
                              .read(rouletteStateProvider.notifier)
                              .secondTwelve,
                        ),
                        UncoloredBoardItem(
                          index: 2,
                          width: width * 0.16,
                          height: uncoloredBoardItemHeight,
                          createBet: ref
                              .read(rouletteStateProvider.notifier)
                              .thirdTwelve,
                        )
                      ],
                    ),
                    Row(children: [
                      UncoloredBoardItem(
                        index: 3,
                        width: width * 0.08,
                        height: uncoloredBoardItemHeight,
                        createBet: ref
                            .read(rouletteStateProvider.notifier)
                            .firstEighteen,
                      ),
                      UncoloredBoardItem(
                        index: 4,
                        width: width * 0.08,
                        height: uncoloredBoardItemHeight,
                        createBet:
                            ref.read(rouletteStateProvider.notifier).even,
                      ),
                      UncoloredBoardItem(
                        index: 5,
                        width: width * 0.08,
                        height: uncoloredBoardItemHeight,
                        createBet: ref.read(rouletteStateProvider.notifier).red,
                      ),
                      UncoloredBoardItem(
                        index: 6,
                        width: width * 0.08,
                        height: uncoloredBoardItemHeight,
                        createBet:
                            ref.read(rouletteStateProvider.notifier).black,
                      ),
                      UncoloredBoardItem(
                        index: 7,
                        width: width * 0.08,
                        height: uncoloredBoardItemHeight,
                        createBet: ref.read(rouletteStateProvider.notifier).odd,
                      ),
                      UncoloredBoardItem(
                        index: 8,
                        width: width * 0.08,
                        height: uncoloredBoardItemHeight,
                        createBet: ref
                            .read(rouletteStateProvider.notifier)
                            .secondEighteen,
                      ),
                    ]),
                    SizedBox(
                      height: height * 0.04,
                    ),
                    const Text(
                      'CHOOSE MONEY AMOUNT',
                      style: TextStyle(color: Colors.white),
                    ),
                    const BetValueWidget()
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}



