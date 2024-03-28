import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

const List rouletteNumberAndColor = [
  [3, Colors.red, false],
  [6, Colors.black, false],
  [9, Colors.red, false],
  [12, Colors.red, false],
  [15, Colors.black, false],
  [18, Colors.red, false],
  [21, Colors.red, false],
  [24, Colors.black, false],
  [27, Colors.red, false],
  [30, Colors.red, false],
  [33, Colors.black, false],
  [36, Colors.red, false],
  [2, Colors.black, false],
  [5, Colors.red, false],
  [8, Colors.black, false],
  [11, Colors.black, false],
  [14, Colors.red, false],
  [17, Colors.black, false],
  [20, Colors.black, false],
  [23, Colors.red, false],
  [26, Colors.black, false],
  [29, Colors.black, false],
  [32, Colors.red, false],
  [35, Colors.black, false],
  [1, Colors.red, false],
  [4, Colors.black, false],
  [7, Colors.red, false],
  [10, Colors.black, false],
  [13, Colors.black, false],
  [16, Colors.red, false],
  [19, Colors.red, false],
  [22, Colors.black, false],
  [25, Colors.red, false],
  [28, Colors.black, false],
  [31, Colors.black, false],
  [34, Colors.red, false],
  [0, false]
];

class RoulettePage extends ConsumerWidget {
  const RoulettePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;

    return Scaffold(
        body: SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.white)),
            child: Center(
              child: Text(
                  rouletteNumberAndColor[rouletteNumberAndColor.length - 1][0]
                      .toString()),
            ),
          ),
          Expanded(
            child: SizedBox(
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 30 / 30, crossAxisCount: 12),
                itemCount: 36,
                itemBuilder: (context, index) => Container(
                  width: 4,
                  height: 4,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      color: rouletteNumberAndColor[index][1]),
                  child: Center(
                      child: Text(
                    rouletteNumberAndColor[index][0].toString(),
                    style: const TextStyle(color: Colors.white),
                  )),
                ),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
