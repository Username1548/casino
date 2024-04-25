import 'dart:math';

import 'package:casino/feature/roulette/presentation/providers/roulette_data_provider.dart';
import 'package:casino/feature/roulette/presentation/widgets/roulette_board.dart';
import 'package:casino/feature/roulette/presentation/widgets/roulette_wheel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RoulettePage extends ConsumerWidget {
  const RoulettePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final rouletteWheel = ref.watch(rouletteDataProvider);
    return Scaffold(
        body: Row(
      children: [
        //wheel
        const RouletteBoard(),
        rouletteWheel.when(
            data: (data) {
              const sectors = [
                0,
                32,
                15,
                19,
                4,
                21,
                2,
                25,
                17,
                34,
                6,
                27,
                13,
                36,
                11,
                30,
                8,
                23,
                10,
                5,
                24,
                16,
                33,
                1,
                20,
                14,
                31,
                9,
                22,
                18,
                29,
                7,
                28,
                12,
                35,
                3,
                26
              ];
              final winIndex = sectors.indexOf(data.winNumber);
              final angelDelta = (360 / sectors.length) * winIndex +
                  (Random().nextDouble() * ((360 / sectors.length) - 2) + 1);
              return RouletteWheel(
                angleDelta: angelDelta,
                winNumber: data.winNumber,
                moneyDelta: data.moneyDelta,
              );
            },
            error: (er, stackTrace) =>  Text(er.toString()),
            loading: () {
              return const RouletteWheel();
            })
      ],
    ));
  }
}
