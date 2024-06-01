import 'dart:math';
import 'package:casino/core/general_balance/providers/balance_state_provider.dart';

import '../../domain/entities/bet_entity.dart';
import '../providers/roulette_data_provider.dart';
import '../providers/roulette_state_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RouletteWheel extends ConsumerStatefulWidget {
  final double? angleDelta;
  final int? winNumber;
  final int? moneyDelta;
  const RouletteWheel({
    super.key,
    this.angleDelta,
    this.winNumber,
    this.moneyDelta,
  });

  @override
  ConsumerState<RouletteWheel> createState() => _MonyeWheelState();
}

class _MonyeWheelState extends ConsumerState<RouletteWheel>
    with SingleTickerProviderStateMixin {
  double angle = 0;
  bool isSpinnig = false;
  late List<int> sectors;
  late AnimationController controller;
  late Animation<double> animation;
  BetEntity? bet;

  @override
  void initState() {
    sectors = const [
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
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 6000));
    Tween<double> tween = Tween<double>(begin: 0, end: 1);

    CurvedAnimation curve =
        CurvedAnimation(parent: controller, curve: Curves.decelerate);

    animation = tween.animate(curve);

    controller.addListener(() {
      if (controller.isCompleted) {
        setState(() {
          isSpinnig = false;
        });
        if (widget.winNumber != null && widget.moneyDelta != null) {
          Future.delayed(const Duration(seconds: 1));
          showDialog(
            context: context, // Provide the context of your widget
            builder: (_) {
              return AlertDialog(
                title: Text(
                  'win number ${widget.winNumber.toString()}',
                  style: const TextStyle(color: Colors.white),
                ),
                content: widget.moneyDelta! > 0
                    ? Text(
                        'YOU WIN ${widget.moneyDelta.toString()}',
                        style: const TextStyle(color: Colors.yellow),
                      )
                    : Text(
                        'YOU LOOSE ${(-1 * widget.moneyDelta!).toString()}',
                        style: const TextStyle(color: Colors.red),
                      ),
                actions: [
                  ElevatedButton(
                    onPressed: Navigator.of(context).pop,
                    child: const Text("Close"),
                  ),
                ],
              );
            },
          );
        }
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(rouletteStateProvider, (prev, next) {
      bet = next;
    });

    SchedulerBinding.instance.addPostFrameCallback((_) {
      if (widget.angleDelta != null && isSpinnig == true) {
        spin();
      }
    });
    return Column(
      children: [
        Stack(alignment: Alignment.topCenter, children: [
          AnimatedBuilder(
            animation: animation,
            builder: (context, child) => Transform.rotate(
              angle:
                  (controller.value * ((pi / 180) * angle)) + ((pi / 180) * 5),
              child: Image.asset(
                'assets/images/roulette/roulette.png',
                width: MediaQuery.sizeOf(context).width * 0.4,
              ),
            ),
          ),
          Image.asset(
            'assets/images/roulette/pointer.png',
            width: MediaQuery.sizeOf(context).width * 0.05,
          )
        ]),
        Consumer(
          builder: (context, ref, child) {
            final balance = ref.watch(userDataNotifierStateProvider);
            return ElevatedButton(
                style: ButtonStyle(
                    minimumSize: MaterialStatePropertyAll(Size(
                        MediaQuery.sizeOf(context).width * 0.2,
                        MediaQuery.sizeOf(context).height * 0.07)),
                    backgroundColor: const MaterialStatePropertyAll(
                        Color.fromARGB(255, 220, 45, 45))),
                onPressed: () async {
                  if (!isSpinnig) {
                    if (bet != null && balance != null) {
                      if (bet!.betSum != 0 && bet!.betSum <= balance.balance) {
                        setState(() {
                          spin();
                          isSpinnig = true;
                        });
                        await ref
                            .read(rouletteDataProvider.notifier)
                            .play(bet!);
                      }
                    }
                  }
                },
                child: const Text(
                  'SPIN',
                  style: TextStyle(color: Colors.white),
                ));
          },
        ),
      ],
    );
  }

  void spin() {
    controller.reset();
    angle = widget.angleDelta == null
        ? (360) + 360 * 4
        : 360 * 4 + (360 - widget.angleDelta!.toDouble());
    controller.forward();
    var qwe = [];
    for (var i = 0; i < 18; i++) {
      qwe.add([
        [0 + 20 * i, 360 / 18 * (i + 1)],
        sectors[i]
      ]);
    }
  }
}
