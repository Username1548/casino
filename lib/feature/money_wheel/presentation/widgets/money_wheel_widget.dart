import 'dart:math';
import '../providers/wheel_state_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MonyeWheel extends ConsumerStatefulWidget {
  final int? angleDelta;

  const MonyeWheel({
    super.key,
    this.angleDelta,
  });

  @override
  ConsumerState<MonyeWheel> createState() => _MonyeWheelState();
}

class _MonyeWheelState extends ConsumerState<MonyeWheel>
    with SingleTickerProviderStateMixin {
  double angle = 0;
  bool isSpinnig = false;
  late List<int> sectors;
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    sectors = const [
      10000,
      1000,
      5000,
      1000,
      250,
      1000,
      2000,
      1000,
      750,
      1,
      1500,
      1000,
      500,
      1000,
      3000,
      1000,
      100,
      1000
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
    SchedulerBinding.instance.addPostFrameCallback((_) {
      if (widget.angleDelta != null && isSpinnig == true) {
        spin();
      }
    });
    return InkWell(
        highlightColor: Colors.transparent,
        splashFactory: NoSplash.splashFactory,
        onTap: () async {
          if (!isSpinnig) {
            setState(() {
              spin();
              isSpinnig = true;
            });
            await ref.read(wheelDataProvider.notifier).spin();
          }
        },
        child: Stack(alignment: Alignment.center, children: [
          AnimatedBuilder(
            animation: animation,
            builder: (context, child) => Transform.rotate(
              angle: controller.value * ((pi / 180) * angle),
              child: Image.asset(
                'assets/images/wheel/fortune_wheel.png',
                width: MediaQuery.sizeOf(context).width * 0.6,
                height: MediaQuery.sizeOf(context).height * 0.7,
              ),
            ),
          ),
          Image.asset(
            'assets/images/wheel/pointer.png',
            width: MediaQuery.sizeOf(context).width * 0.08,
          )
        ]));
  }

  void spin() {
    controller.reset();
    angle = widget.angleDelta == null
        ? (360 - 10) + 360 * 4
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
